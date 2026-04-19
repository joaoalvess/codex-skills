# Build tvOS Apps Plugin

This plugin packages tvOS-first development workflows in `plugins/build-tvos-apps`.

It currently includes these skills:

- `tvos-ui-patterns`
- `tvos-media-playback`
- `tvos-system-surfaces`
- `tvos-debugger-agent`
- `tvos-performance-audit`
- `tvos-accessibility-audit`
- `tvos-view-refactor`

## What It Covers

- building modern tvOS SwiftUI interfaces around focus, remote behavior, shelves, lockups, hero content, search, and sidebar-based navigation
- keeping Apple TV layouts stable when focus expands controls and content lockups
- structuring playback around `AVPlayerViewController`, PiP, transport controls, and catalog-to-player handoff
- handling system entry surfaces such as universal links, scene routing, Top Shelf, and tvOS-specific App Intents constraints
- debugging Apple TV apps on booted tvOS simulators with XcodeBuildMCP-backed flows
- auditing focus-related jank, playback UI performance, and image or layout churn
- auditing accessibility for distance legibility, focus order, captions, subtitles, reduced motion, and reduced transparency
- refactoring oversized tvOS SwiftUI views toward stable focus regions and explicit catalog, detail, and player surfaces

## What It Does Not Cover

- generic iOS-first UI advice transplanted to the TV
- TVMLKit as a default architecture for new work
- App Shortcuts as a primary tvOS surface
- pixel-perfect motion design that overrides standard focus, hover, and remote conventions
- App Store Connect release operations

## Plugin Structure

The plugin lives at:

- `plugins/build-tvos-apps/`

with this shape:

- `.codex-plugin/plugin.json`
  - required plugin manifest
  - defines plugin metadata and points Codex at the plugin contents

- `.mcp.json`
  - plugin-local MCP config
  - wires in XcodeBuildMCP for Apple TV simulator build, run, logging, and debugging workflows

- `agents/`
  - plugin-level agent metadata
  - currently includes `agents/openai.yaml` for the OpenAI surface

- `skills/`
  - the actual skill payload
  - each skill keeps the normal skill structure (`SKILL.md`, optional `agents/`, `references/`, `assets/`, `scripts/`)

## Notes

- The default posture is focus-first, not touch-first.
- `tvos-ui-patterns` is the main design skill. It owns navigation, focus, shelves, search, and restrained use of Liquid Glass.
- `tvos-system-surfaces` intentionally treats Top Shelf and App Intents as optional system surfaces, not as the architectural center of a tvOS app.
- `tvos-debugger-agent` assumes Apple TV simulator workflows via XcodeBuildMCP, matching the public `build-ios-apps` shape.
