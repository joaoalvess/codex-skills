#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  spotify_control.sh open
  spotify_control.sh play
  spotify_control.sh pause
  spotify_control.sh playpause
  spotify_control.sh next
  spotify_control.sh prev
  spotify_control.sh current
  spotify_control.sh get-volume
  spotify_control.sh set-volume <0-100>
  spotify_control.sh get-position
  spotify_control.sh set-position <seconds>
  spotify_control.sh set-shuffle <on|off>
  spotify_control.sh set-repeat <on|off>
  spotify_control.sh play-uri <spotify:...>
EOF
}

spotify_is_running() {
  pgrep -x "Spotify" >/dev/null 2>&1
}

ensure_spotify_open() {
  if spotify_is_running; then
    return
  fi

  if ! open -a Spotify >/dev/null 2>&1; then
    echo "Spotify is not installed or could not be opened." >&2
    exit 1
  fi

  sleep 2
}

run_applescript() {
  osascript "$@"
}

require_number() {
  local value="$1"
  if [[ ! "$value" =~ ^[0-9]+$ ]]; then
    echo "Expected a numeric value, got: $value" >&2
    exit 1
  fi
}

main() {
  if [[ $# -lt 1 ]]; then
    usage >&2
    exit 1
  fi

  local action="$1"
  shift

  case "$action" in
    open)
      ensure_spotify_open
      ;;
    play)
      ensure_spotify_open
      run_applescript -e 'tell application "Spotify" to play'
      ;;
    pause)
      ensure_spotify_open
      run_applescript -e 'tell application "Spotify" to pause'
      ;;
    playpause)
      ensure_spotify_open
      run_applescript -e 'tell application "Spotify" to playpause'
      ;;
    next)
      ensure_spotify_open
      run_applescript -e 'tell application "Spotify" to next track'
      ;;
    prev)
      ensure_spotify_open
      run_applescript -e 'tell application "Spotify" to previous track'
      ;;
    current)
      ensure_spotify_open
      run_applescript <<'APPLESCRIPT'
tell application "Spotify"
  if player state is stopped then
    return ""
  end if
  return name of current track & tab & artist of current track
end tell
APPLESCRIPT
      ;;
    get-volume)
      ensure_spotify_open
      run_applescript -e 'tell application "Spotify" to get sound volume'
      ;;
    set-volume)
      local volume="${1:?Missing volume}"
      require_number "$volume"
      if (( volume < 0 || volume > 100 )); then
        echo "Volume must be between 0 and 100." >&2
        exit 1
      fi
      ensure_spotify_open
      run_applescript -e "tell application \"Spotify\" to set sound volume to $volume"
      ;;
    get-position)
      ensure_spotify_open
      run_applescript -e 'tell application "Spotify" to get player position'
      ;;
    set-position)
      local seconds="${1:?Missing position in seconds}"
      require_number "$seconds"
      ensure_spotify_open
      run_applescript -e "tell application \"Spotify\" to set player position to $seconds"
      ;;
    set-shuffle)
      local enabled="${1:?Missing shuffle state}"
      ensure_spotify_open
      case "$enabled" in
        on)
          run_applescript -e 'tell application "Spotify" to set shuffling to true'
          ;;
        off)
          run_applescript -e 'tell application "Spotify" to set shuffling to false'
          ;;
        *)
          echo "Shuffle state must be 'on' or 'off'." >&2
          exit 1
          ;;
      esac
      ;;
    set-repeat)
      local enabled="${1:?Missing repeat state}"
      ensure_spotify_open
      case "$enabled" in
        on)
          run_applescript -e 'tell application "Spotify" to set repeating to true'
          ;;
        off)
          run_applescript -e 'tell application "Spotify" to set repeating to false'
          ;;
        *)
          echo "Repeat state must be 'on' or 'off'." >&2
          exit 1
          ;;
      esac
      ;;
    play-uri)
      local uri="${1:?Missing Spotify URI}"
      ensure_spotify_open
      run_applescript -e "tell application \"Spotify\" to play track \"$uri\""
      ;;
    *)
      usage >&2
      exit 1
      ;;
  esac
}

main "$@"
