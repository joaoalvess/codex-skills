---
name: git-publish
description: >-
  Automate Git and GitHub publish workflows from Codex with two explicit modes:
  `commit-push` for grouped conventional commits on the current branch, and
  `commit-push-pr` for creating a new branch, grouped conventional commits,
  push, `pr.md` generation in English, and a ready pull request with `gh`. Use
  when the user asks to "faz commit e push", "commit-push", "cria branch,
  commit, push e pr", "commit-push-pr", publish the current work, split changes
  into small conventional commits, or open a PR without codex mentions or
  co-author trailers.
---

# Git Publish

Use this skill only when the user explicitly wants the full publish workflow, not for simple Git inspection.

## Modes

- Use `commit-push` when the user wants commits and push on the current branch.
- Use `commit-push-pr` when the user wants a new branch, grouped commits, push, `pr.md`, and a ready PR.
- If the request is ambiguous, ask which mode to use before mutating anything.

## Hard rules

- Never add `Co-authored-by:` trailers.
- Never mention `codex` or any AI tool in branch names, commit messages, PR titles, or generated PR copy unless the user explicitly asks for that wording.
- Never commit `pr.md`.
- Treat repository-root `pr.md` as auxiliary output, not as publishable source.
- Never include unrelated changes when scope is ambiguous.
- Do not run project tests, linters, builds, or Git hooks by default. Use `--no-verify` for `git commit` and `git push` unless the user explicitly asks to keep hooks enabled.

## References

- Read `references/conventional-commits.md` before writing commit messages or branch names.
- Read `references/pr-body-guidelines.md` before generating `pr.md` or creating the PR.

## Preflight

Run these checks before mutating the repository:

1. Confirm you are inside a Git repository.
2. Confirm there are changes to publish across staged, unstaged, or untracked files, ignoring repository-root `pr.md`.
3. Confirm `origin` exists.
4. For `commit-push-pr`, confirm `gh auth status` succeeds before creating a branch or commit.

Use at least:

```bash
git status --short
git diff --stat
git diff --cached --stat
git ls-files --others --exclude-standard
git remote get-url origin
```

For `commit-push-pr`, also inspect the default branch:

```bash
gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name'
```

## Scope handling

- Inspect staged, unstaged, and untracked changes together.
- Group files by behavior, not only by file type or directory.
- Treat the worktree as mixed-scope and stop for clarification when:
  - changed files clearly belong to different unrelated tasks
  - generated files are mixed with source changes and the relationship is not obvious
  - a single file contains multiple unrelated edits that cannot be separated safely with non-interactive commands
- If the scope is coherent, proceed automatically without asking for confirmation.
- If scope is mixed, ask the user which files or directories belong in the publish flow and do nothing else.

## Commit grouping

- Prefer small functional commits.
- Order commits from foundation to user-facing behavior:
  - supporting refactor or config
  - main implementation
  - tests
  - docs
- Stage only the files that belong to the current functional block.
- If one file contains mixed concerns that cannot be separated safely without interactive staging, stop and ask for scope clarification instead of guessing.
- Use conventional commits for every commit.
- Add an optional scope only when it is obvious and stable, for example `feat(auth): add password reset`.
- Keep the subject concise, imperative, and without a trailing period.

Use this commit shape:

```text
type(optional-scope): summary
```

## Branch handling

### `commit-push`

- Stay on the current branch even if it is `main`, `master`, or the default branch.
- Do not create a new branch.

### `commit-push-pr`

- Create the branch before staging or committing.
- Derive the branch name from the dominant overall change using `<type>/<slug>`.
- Keep the slug lowercase and hyphenated.
- Never include `codex`, usernames, or timestamps in the branch name.
- If the derived branch name already exists locally or on `origin`, append `-2`, then `-3`, and so on until it is unique.

Example:

```text
feat/create-new-feature
fix/future-launches-crash
```

## Execute the flow

### `commit-push`

1. Inspect the full diff and derive commit groups.
2. Stage one functional group at a time.
3. Commit with:

```bash
git commit --no-verify --cleanup=strip -m "type: summary"
```

4. Repeat until all in-scope changes are committed.
5. Push to the current branch:
   - if upstream exists, use `git push --no-verify`
   - otherwise use `git push --no-verify -u origin $(git branch --show-current)`

### `commit-push-pr`

1. Inspect the full diff and derive the overall branch name plus commit groups.
2. Create and switch to the new branch from the current HEAD.
3. Stage one functional group at a time.
4. Commit with:

```bash
git commit --no-verify --cleanup=strip -m "type: summary"
```

5. Repeat until all in-scope changes are committed.
6. Push with tracking:

```bash
git push --no-verify -u origin $(git branch --show-current)
```

7. Generate `pr.md` at the repository root in English.
8. Keep `pr.md` untracked and out of all commits.
9. Create a ready PR with:

```bash
gh pr create --base "$BASE_BRANCH" --head "$(git branch --show-current)" --title "$PR_TITLE" --body-file pr.md
```

## `pr.md` rules

- Write `pr.md` only for `commit-push-pr`.
- Overwrite `pr.md` only when it is untracked and clearly related to the current publish flow.
- If `pr.md` already exists and is tracked or appears unrelated, stop and ask before overwriting it.
- Keep the file in English.
- Match the level of detail to the PR complexity.
- Cover at minimum:
  - problem or context
  - what changed
  - impact or notes
  - testing status, using `Not run` when no checks were executed

## Failure handling

- Stop immediately if `gh auth status` fails for `commit-push-pr`.
- Stop immediately if `origin` is missing.
- Stop immediately if there are no changes to publish.
- If branch-name derivation is clear but commit grouping is not, ask for scope rather than creating a low-quality publish result.
