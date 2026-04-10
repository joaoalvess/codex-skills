# Codex Skills

Repo for local Codex plugins distributed to the team.

## Included plugin

- `joaoalvess-skills`
  - `alexa-control`
  - `spotify-control`
  - `git-publish`

## Team setup

1. Clone this repo.
2. Open the repo in Codex as a workspace root.
3. Codex can discover the repo-local marketplace at `.agents/plugins/marketplace.json`.

## Local prerequisites

- `spotify-control`
  - macOS with the Spotify app installed
- `alexa-control`
  - local checkout of `alexa-remote-control` at `~/.alexa-remote-control`
  - authenticated Alexa session for the target account
- `git-publish`
  - `git` repository with an `origin` remote
  - `gh` installed and authenticated for the `commit-push-pr` flow

## Notes

- The plugin is repo-local and versioned with the repository.
- If the team later wants global installation outside a single workspace, the same plugin can be copied to `~/plugins` and referenced from `~/.agents/plugins/marketplace.json`.
