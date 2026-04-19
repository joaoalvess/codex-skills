# Now Playing And Remote Commands

Use custom remote-command wiring only when the app owns playback behavior beyond the default AVKit transport experience.

## Use when

- the player is custom and the app must explicitly support play, pause, seek, skip, or scrubbing behavior
- the app needs accurate now-playing metadata while playback continues outside the immediate screen context

## Good defaults

- Keep metadata stable and accurate.
- Map remote commands to the same transport actions visible in the overlay.
- Avoid exposing unsupported transport options.

## Guardrails

- Do not wire custom remote commands if `AVPlayerViewController` already handles the use case cleanly.
- Do not present playback state in one place while remote commands control a different internal state machine.
