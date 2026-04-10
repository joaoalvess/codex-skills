# Conventional Commits

Use conventional commit messages for every commit and derive the branch prefix from the dominant overall change.

## Message format

```text
type(optional-scope): summary
```

- Keep the summary short and imperative.
- Use lowercase for the type and scope.
- Omit the scope when it does not add clarity.
- Do not end the summary with a period.

## Type guide

- `feat`: new user-facing capability
- `fix`: bug fix or regression fix
- `refactor`: internal restructuring without intended behavior change
- `perf`: performance improvement
- `docs`: documentation-only change
- `test`: tests only
- `build`: build tooling or dependency packaging
- `ci`: CI or automation pipeline changes
- `chore`: maintenance work that does not fit the categories above

## Grouping guide

- Prefer one type per commit block.
- Split unrelated behavior into separate commits.
- Put tests and docs in separate commits when they are large enough to stand alone.
- If a supporting refactor is required for the main change, commit the refactor first and the feature or fix second.

## Branch naming

Use the dominant overall change type plus a concise slug:

```text
feat/create-new-feature
fix/future-launches-crash
refactor/simplify-auth-flow
```

- Keep the slug lowercase and hyphenated.
- Remove filler words where possible.
- Never include `codex`, usernames, or ticketless noise in the slug.
