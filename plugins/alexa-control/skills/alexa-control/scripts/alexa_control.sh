#!/usr/bin/env bash
set -euo pipefail

ALEXA_DIR="${ALEXA_DIR:-$HOME/.alexa-remote-control}"
ALEXA_DEVICE="${ALEXA_DEVICE:-Echo Show}"
ALEXA_SCRIPT="$ALEXA_DIR/alexa_remote_control.sh"

usage() {
  cat <<'EOF'
Usage:
  alexa_control.sh list-devices
  alexa_control.sh textcommand "<phrase>" [device]
  alexa_control.sh automation "<name>" [device]
  alexa_control.sh speak "<message>" [device]
  alexa_control.sh action <play|pause|next|prev|fwd|rwd|shuffle|repeat> [device]
  alexa_control.sh volume <0-100> [device]
  alexa_control.sh playmusic <AMAZON_MUSIC|TUNEIN> "<query>" [device]
  alexa_control.sh bluetooth <pair|unpair|list> [device]
EOF
}

require_setup() {
  if [[ ! -x "$ALEXA_SCRIPT" && ! -f "$ALEXA_SCRIPT" ]]; then
    echo "Alexa script not found at $ALEXA_SCRIPT" >&2
    exit 1
  fi
}

run_alexa() {
  local device="$1"
  local event="$2"

  require_setup
  cd "$ALEXA_DIR"
  /bin/sh ./alexa_remote_control.sh -d "$device" -e "$event"
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

  local mode="$1"
  shift

  case "$mode" in
    list-devices)
      require_setup
      cd "$ALEXA_DIR"
      /bin/sh ./alexa_remote_control.sh -a
      ;;
    textcommand)
      local phrase="${1:?Missing text command}"
      local device="${2:-$ALEXA_DEVICE}"
      run_alexa "$device" "textcommand:$phrase"
      ;;
    automation)
      local name="${1:?Missing automation name}"
      local device="${2:-$ALEXA_DEVICE}"
      run_alexa "$device" "automation:$name"
      ;;
    speak)
      local message="${1:?Missing message}"
      local device="${2:-$ALEXA_DEVICE}"
      run_alexa "$device" "speak:$message"
      ;;
    action)
      local action="${1:?Missing action}"
      local device="${2:-$ALEXA_DEVICE}"
      case "$action" in
        play|pause|next|prev|fwd|rwd|shuffle|repeat) ;;
        *)
          echo "Unsupported action: $action" >&2
          exit 1
          ;;
      esac
      run_alexa "$device" "$action"
      ;;
    volume)
      local volume="${1:?Missing volume}"
      local device="${2:-$ALEXA_DEVICE}"
      require_number "$volume"
      if (( volume < 0 || volume > 100 )); then
        echo "Volume must be between 0 and 100." >&2
        exit 1
      fi
      run_alexa "$device" "vol:$volume"
      ;;
    playmusic)
      local provider="${1:?Missing provider}"
      local query="${2:?Missing query}"
      local device="${3:-$ALEXA_DEVICE}"
      case "$provider" in
        AMAZON_MUSIC|TUNEIN) ;;
        *)
          echo "Unsupported provider: $provider" >&2
          exit 1
          ;;
      esac
      run_alexa "$device" "playmusic:$provider:$query"
      ;;
    bluetooth)
      local action="${1:?Missing bluetooth action}"
      local device="${2:-$ALEXA_DEVICE}"
      case "$action" in
        pair|unpair|list) ;;
        *)
          echo "Unsupported bluetooth action: $action" >&2
          exit 1
          ;;
      esac
      run_alexa "$device" "bluetooth:$action"
      ;;
    *)
      usage >&2
      exit 1
      ;;
  esac
}

main "$@"
