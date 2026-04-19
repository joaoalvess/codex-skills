# Codex Skills

Repo for local Codex plugins distributed to the team.

## Included plugin

- `alexa-control`
  - `alexa-control`
- `spotify-control`
  - `spotify-control`
- `commit-commands`
  - `commit-commands`
- `build-tvos-apps`
  - `tvos-ui-patterns`
  - `tvos-liquid-glass`
  - `tvos-media-playback`
  - `tvos-system-surfaces`
  - `tvos-debugger-agent`
  - `tvos-performance-audit`
  - `tvos-accessibility-audit`
  - `tvos-view-refactor`

## Team setup

1. Clone this repo.
2. Open the repo in Codex as a workspace root.
3. Codex can discover the repo-local marketplace at `.agents/plugins/marketplace.json`.

## Local prerequisites

- `spotify-control` plugin
  - macOS with the Spotify app installed
- `alexa-control` plugin
  - local checkout of `alexa-remote-control` at `~/.alexa-remote-control`
  - authenticated Alexa session for the target account
- `commit-commands` plugin
  - `git` repository with an `origin` remote
  - `gh` installed and authenticated for the `commit-push-pr` flow

## Notes

- The plugin is repo-local and versioned with the repository.
- If the team later wants global installation outside a single workspace, the same plugin can be copied to `~/plugins` and referenced from `~/.agents/plugins/marketplace.json`.
- `build-tvos-apps` is tvOS-first on purpose: focus, remote behavior, shelves, playback, deep links, and Apple TV simulator workflows are the default posture, not iOS UI transplanted onto a TV.
