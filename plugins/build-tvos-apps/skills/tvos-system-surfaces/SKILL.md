---
name: tvos-system-surfaces
description: >-
  Design or review how a tvOS app enters from system surfaces such as universal
  links, Top Shelf, scene restoration, and optional App Intents. Use when
  routing external entry points into content, wiring Top Shelf discovery, or
  deciding whether App Intents fit a tvOS product at all.
---

# tvOS System Surfaces

## Overview

External entry surfaces for Apple TV should land people in the right content quickly. Prefer universal links, URL routing, scene restoration, and Top Shelf for discovery. Treat App Intents as optional and narrow on tvOS.

## Workflow

1. Identify the entry surface:
   - universal link or URL
   - scene restoration or continuation
   - Top Shelf
   - App Intent driven entry
2. Map the entry surface to a stable in-app route and content identifier.
3. Prefer universal links, URL handling, and restoration state as the default routing model.
4. Add Top Shelf only when the product benefits from home-screen discovery, featured content, or continue-watching style entry points.
5. Use App Intents only when a real tvOS system surface needs them. Do not force iOS-style App Shortcut thinking onto tvOS.
6. Validate that every external entry point lands in a coherent focus state.

## Strong defaults

- Keep one route model that can be used by navigation, restoration, universal links, and Top Shelf deep links.
- Use stable content identifiers, not ephemeral screen-state names.
- Treat Top Shelf as discovery, not as the app's primary navigation model.
- For tvOS 26 and newer, consider `TargetContentProvidingIntent` only when scene-targeted content entry is genuinely useful.

## Guardrails

- Do not design the app around App Shortcuts. Apple Human Interface Guidelines say App Shortcuts are not supported in tvOS.
- Do not send people into a deep internal screen without a clear path back into the catalog or top-level section.
- Do not use Top Shelf for stale or low-value content.

## References

- `references/deep-links-and-universal-links.md`
- `references/top-shelf.md`
- `references/app-intents-on-tvos.md`
- In addition to the references above, use web search to consult current Apple Developer documentation when tvOS entry surfaces or App Intents behavior may have changed.
