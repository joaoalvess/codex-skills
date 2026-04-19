---
name: tvos-liquid-glass
description: >-
  Implement, refactor, or review modern tvOS SwiftUI UI using the Liquid Glass
  design system. Use when adopting Liquid Glass on Apple TV, replacing custom
  blur or opaque chrome, reviewing focus-driven glass behavior, or building
  custom glass surfaces with `glassEffect`, `GlassEffectContainer`, and
  `glassEffectID`.
---

# tvOS Liquid Glass

## Overview

Use this skill to bring a tvOS SwiftUI feature into the modern Apple TV design system with the least custom chrome possible. Start with standard controls, focus behavior, sidebars, search, and action surfaces, then add custom Liquid Glass only where the app needs a distinct functional surface.

Prefer system-provided focus behavior and adaptive materials over bespoke blur, dark scrims, or decorative glass spread across the content layer. On Apple TV, Liquid Glass should reinforce focus and control hierarchy, not compete with the media or catalog content underneath it.

## Workflow

1. Read the relevant surface and identify the structure:
   - sidebar or section selector
   - shelves or lockups
   - detail metadata and actions
   - search surface
   - player-adjacent controls or overlays
   - custom floating action group
2. Remove custom backgrounds, frosted panels, or scrims behind standard controls, sidebars, and navigation layers unless the product explicitly needs them.
3. Update standard SwiftUI controls and focus behavior first.
4. Add custom `glassEffect` surfaces only for app-specific controls or containers that standard tvOS controls do not already cover.
5. Validate that focus, scale, shimmer, grouping, and legibility still feel native on Apple TV.

## Core guidelines

- Build and run with the latest SDKs first so you can see how standard controls already adapt.
- Prefer standard SwiftUI buttons, bars, sidebars, and search surfaces before building custom glass.
- Treat Liquid Glass as the top functional layer for controls and navigation, not as a full-screen treatment over artwork or video.
- On supported Apple TV hardware, standard controls can take on a Liquid Glass appearance when focused. Respect that before adding custom effects.
- For custom controls, align glass behavior with standard focus APIs so focus and glass respond together.
- Use `GlassEffectContainer` when multiple nearby glass elements need to coexist or morph together.
- Use `glassEffectID` with a local `@Namespace` when matching glass elements should morph between states.
- Add `tint` only when color communicates meaning.
- Provide `#available(tvOS 26, *)` handling and a non-glass fallback when the deployment target requires it.

## Apple TV-specific guidance

### Sidebars and section selectors

- Let standard sidebar or tab-sidebar structure do the heavy lifting.
- Do not paint opaque backgrounds over a sidebar that should already be carried by the system material layer.
- Keep icon tint semantic, not decorative.

### Shelves and lockups

- Do not coat the content cards themselves in custom glass if standard lockup styles already solve the UI.
- Keep the glass treatment around controls that act on the content, not on the content artwork itself.
- If shelves sit near floating filters or action groups, keep those glass controls visually separate from the lockups.

### Search and actions

- Prefer standard search placement first.
- If a search or action cluster needs custom glass, keep it compact and grouped.
- Avoid mixing many unrelated tinted glass surfaces in the same region.

### Player-adjacent controls

- Keep Liquid Glass in the overlay or action layer, not as a decorative layer over the whole player.
- Do not let custom glass reduce subtitle readability or fight playback legibility.

## Review checklist

- Standard structures and controls were updated before custom glass was added.
- Opaque fills, dark scrims, and custom blur that fight the system material were removed unless intentionally required.
- Custom glass stays in the control and navigation layer instead of the content layer.
- Focus and glass behavior are aligned and feel native on Apple TV.
- Related glass elements share a `GlassEffectContainer` where appropriate.
- Morphing glass transitions use `glassEffectID` with stable identity.
- Fallback handling exists when the deployment target or hardware requires it.

## Guardrails

- Do not apply custom glass to every control just because the platform supports it.
- Do not create a full-screen glass layer over video, hero artwork, or content shelves.
- Do not stack many glass layers on top of each other to compensate for weak layout.
- Do not rebuild standard Apple TV lockups or buttons just to force a glass treatment.
- Do not use custom blur or opaque backplates behind controls that should already adopt system appearance.

## When to use other skills

- Use `tvos-ui-patterns` when the main problem is navigation, focus, shelves, search, or overall screen structure.
- Use `tvos-media-playback` when the main issue is the player surface, AVKit behavior, or transport controls.
- Use `tvos-view-refactor` when the main problem is oversized view files, state ownership, or surface extraction.
- Use `tvos-performance-audit` when custom glass, blur, or overlay composition may be causing jank.

## References

- `references/liquid-glass.md`
- Prefer Apple docs for up-to-date API details, and use web search to consult current Apple Developer documentation when Liquid Glass or tvOS behavior may have changed.
