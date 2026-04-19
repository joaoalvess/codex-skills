---
name: alexa-control
description: Control Amazon Alexa devices, routines, smart-home actions, and playback from Codex using a local alexa-remote-control install on macOS. Use when the user wants to turn lights on or off, run routines, make Alexa speak, control Echo playback, change volume, pair Bluetooth, or send a voice command such as "apaga a luz", "fala pra alexa", "boa noite", "alexa", "echo", "smart home", or similar home-automation requests.
---

# Alexa Control

Use the bundled wrapper script instead of rebuilding the long `alexa_remote_control.sh` command by hand.

## Run the wrapper

- Use `scripts/alexa_control.sh` for all Alexa actions.
- Assume the default target device is `Echo Show` unless the user names another device.
- Override the defaults only when necessary:
  - `ALEXA_DIR` for a non-standard install path
  - `ALEXA_DEVICE` for a different default device

## Choose the action

- Use `textcommand` for most free-form Alexa requests and smart-home actions.
- Use `automation` for named routines. Fall back to `textcommand` if the routine name does not resolve reliably.
- Use `speak` to make Alexa say something out loud.
- Use `action` for `play`, `pause`, `next`, `prev`, `fwd`, `rwd`, `shuffle`, or `repeat`.
- Use `volume` for a device volume from `0` to `100`.
- Use `playmusic` with provider `AMAZON_MUSIC` or `TUNEIN`.
- Use `bluetooth` with `pair`, `unpair`, or `list`.

## Common examples

```bash
./scripts/alexa_control.sh textcommand "apaga a luz"
./scripts/alexa_control.sh textcommand "liga a luz da sala" "Echo Show"
./scripts/alexa_control.sh automation "boa noite"
./scripts/alexa_control.sh speak "Ola Joao, mensagem aqui"
./scripts/alexa_control.sh action pause
./scripts/alexa_control.sh volume 35
./scripts/alexa_control.sh playmusic AMAZON_MUSIC "Legiao Urbana"
./scripts/alexa_control.sh bluetooth list
```

## Operating guidance

- Treat a clear device-control request as explicit user intent to act.
- Ask a follow-up only when the target device, action, or utterance is ambiguous.
- Keep Alexa utterances in Portuguese when interacting with a Brazilian Portuguese setup.
- Return a short confirmation after the command succeeds.
- If the request is to inspect available devices, run `./scripts/alexa_control.sh list-devices`.

## Failure handling

- Check that `~/.alexa-remote-control/alexa_remote_control.sh` exists before running commands.
- If authentication has expired, report that the local Alexa session needs to be refreshed.
- If a routine fails through `automation`, retry with `textcommand` using the same phrase.
