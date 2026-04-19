---
name: tvos-debugger-agent
description: >-
  Use XcodeBuildMCP to build, run, launch, and debug the current tvOS project
  on a booted Apple TV simulator. Trigger when asked to run a tvOS app,
  inspect focus or layout behavior, capture screenshots, or diagnose runtime
  issues on Apple TV using simulator tooling.
---

# tvOS Debugger Agent

## Overview

Use XcodeBuildMCP to build and run the current scheme on a booted Apple TV simulator, inspect UI state, and capture logs. Prefer the MCP tools for simulator control, screenshots, logs, and UI inspection.

## Core workflow

### 1) Discover the booted Apple TV simulator

- Call `mcp__XcodeBuildMCP__list_sims`.
- Select the simulator with state `Booted` whose device name or type indicates Apple TV.
- If no Apple TV simulator is booted, ask the user to boot one instead of doing it automatically.

### 2) Set session defaults

- Call `mcp__XcodeBuildMCP__session-set-defaults` with:
  - `projectPath` or `workspacePath`
  - `scheme`
  - `simulatorId` for the booted Apple TV simulator
  - Optional: `configuration: "Debug"`, `useLatestOS: true`

### 3) Build and run

- Call `mcp__XcodeBuildMCP__build_run_sim`.
- If the build fails, summarize the first real blocker before attempting UI interaction.
- After a successful build, verify launch with `mcp__XcodeBuildMCP__describe_ui` or `mcp__XcodeBuildMCP__screenshot`.

### 4) Inspect focus and UI behavior

- Use `mcp__XcodeBuildMCP__describe_ui` before interaction.
- Capture `mcp__XcodeBuildMCP__screenshot` before and after a focus transition when debugging focus issues.
- Prefer element-based interaction first, then coordinates if the tool surface requires it.
- Re-run UI description after screen or focus changes.

### 5) Capture logs

- Start logs with `mcp__XcodeBuildMCP__start_sim_log_cap`.
- Stop logs with `mcp__XcodeBuildMCP__stop_sim_log_cap` and summarize only the important lines.
- If bundle id is unknown, resolve it with `mcp__XcodeBuildMCP__get_sim_app_path` and `mcp__XcodeBuildMCP__get_app_bundle_id`.

## Strong defaults

- Prefer a screenshot plus UI description before speculating about focus state.
- Treat Apple TV focus bugs as state-transition bugs. Capture each step, not just the final broken screen.
- Keep scheme, simulator, and bundle-id selection explicit.

## Troubleshooting

- If the wrong simulator is booted, stop and say which simulator you found.
- If the UI appears but focus is wrong, capture before/after screenshots and describe the currently focused element.
- If the build succeeds but the app does not appear, confirm scheme and bundle id before retrying.
- If a focus bug remains unclear, collect simulator evidence first and then use Xcode focus logging or UIFocusDebugger rather than guessing.
