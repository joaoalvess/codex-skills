---
name: tvos-media-playback
description: >-
  Build or review tvOS playback flows around AVKit, Siri Remote behavior,
  overlays, PiP, and now-playing integration. Use when implementing a player
  surface, moving from a catalog to playback, designing remote transport
  controls, or fixing custom playback UI that fights tvOS conventions.
---

# tvOS Media Playback

## Overview

Playback is a first-class surface on Apple TV. Default to `AVPlayerViewController` and the system transport model unless the product truly needs a custom player experience.

## Workflow

1. Classify the request:
   - standard media playback
   - catalog-to-player handoff
   - custom overlay controls
   - now-playing or remote command integration
   - playback performance or responsiveness issue
2. Prefer `AVPlayerViewController` for the baseline player.
3. Keep the handoff from catalog to player explicit and reversible.
4. If the player needs custom overlays, make them sparse, focusable, and secondary to the media itself.
5. Wire system playback behaviors before inventing custom controls:
   - transport via Siri Remote
   - subtitle and alternate-audio selection
   - Picture in Picture where the product supports it
   - Now Playing and remote command metadata when the app owns custom playback state
6. Validate remote behavior and overlay focus in the simulator, then confirm on device when playback polish matters.

## Strong defaults

- Prefer `AVPlayerViewController` unless there is a concrete product reason not to.
- Keep player overlays separate from catalog UI. They solve different interaction problems.
- Use `MPRemoteCommandCenter` and now-playing metadata only when the app is responsible for transport behavior beyond the default AVKit experience.
- Keep overlays lightweight and easy to exit.
- Use standard system playback affordances before custom chrome.

## Anti-patterns

- Building a custom player just to restyle controls.
- Carrying dense catalog UI into the player overlay.
- Making overlay focus heavier than the playback content.
- Ignoring subtitles, alternate audio, PiP, or remote commands when the product expects them.
- Treating playback as just another detail screen.

## References

- `references/playback-architecture.md`
- `references/player-overlays-and-controls.md`
- `references/now-playing-and-remote-commands.md`
- In addition to the references above, use web search to consult current Apple Developer documentation when AVKit, PiP, or playback-control guidance may have changed.
