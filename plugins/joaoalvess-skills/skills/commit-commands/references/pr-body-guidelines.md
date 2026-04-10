# PR Body Guidelines

Generate `pr.md` in English for the `commit-push-pr` flow and use it as the source of truth for `gh pr create --body-file`.

## Required sections

```md
## Problem

## What Changed

## Impact

## Testing
```

## Content rules

- Explain the problem or context first.
- Describe the implementation in concrete terms.
- Match the detail level to the PR size:
  - short PR: concise prose or a short list
  - medium or large PR: fuller explanation with grouped bullets
- Include root cause when the PR is primarily a fix.
- Use `Not run` in `## Testing` when no checks were executed.
- Do not mention Codex, AI assistance, or co-author information.

## Writing expectations

- Keep the title used in `gh pr create` aligned with the dominant overall change, usually a conventional-commit style summary without scope overload.
- Prefer direct technical language over marketing language.
- Mention user or developer impact when it matters.
