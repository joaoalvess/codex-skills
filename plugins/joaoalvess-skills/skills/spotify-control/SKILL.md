---
name: spotify-control
description: Control Spotify playback, volume, track position, shuffle, repeat, and current-track lookup from Codex on macOS using AppleScript. Use when the user wants to play, pause, skip, go back, change Spotify volume, inspect what is currently playing, or manage Spotify playback with requests such as "toca", "play", "pause", "proxima musica", "musica anterior", "spotify", "que musica ta tocando", or similar music-control requests.
---

# Spotify Control

Use the bundled wrapper script to keep Spotify automation consistent and to avoid rebuilding AppleScript commands by hand.

## Run the wrapper

- Use `scripts/spotify_control.sh` for Spotify actions.
- Let the wrapper open Spotify automatically when the app is not already running.
- Use `current` only when the user explicitly asks what is playing.

## Choose the action

- Use `play`, `pause`, or `playpause` for playback state changes.
- Use `next` or `prev` to move between tracks.
- Use `current` to fetch the current track and artist.
- Use `get-volume` or `set-volume` for Spotify's internal volume.
- Use `get-position` or `set-position` for playback position in seconds.
- Use `set-shuffle on|off` or `set-repeat on|off` for playback modes.
- Use `play-uri` only when the user gives a Spotify URI directly.

## Common examples

```bash
./scripts/spotify_control.sh play
./scripts/spotify_control.sh pause
./scripts/spotify_control.sh next
./scripts/spotify_control.sh current
./scripts/spotify_control.sh set-volume 40
./scripts/spotify_control.sh set-shuffle on
./scripts/spotify_control.sh play-uri spotify:track:TRACK_ID
```

## Operating guidance

- Treat a clear playback request as explicit user intent to act.
- Ask a follow-up only when the action is ambiguous or when the user wants a specific song without a Spotify URI.
- Do not fetch current track info after `play`, `pause`, `next`, or `prev` unless the user explicitly asks for it.
- When the user asks what is playing, format the response as `"Song Name" - Artist`.
- Explain that AppleScript playback of a specific song, playlist, or album requires a Spotify URI.

## Failure handling

- Report clearly when Spotify is not installed on the Mac.
- Report clearly when Spotify is running but no track is active and `current` returns nothing useful.
- Reject invalid numeric values for volume or position before running AppleScript.
