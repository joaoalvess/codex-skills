---
name: tvos-ui-patterns
description: >-
  Best practices and example-driven guidance for building modern tvOS SwiftUI
  interfaces around focus, remote navigation, shelves, lockups, hero content,
  search, and sidebar-based navigation. Use when creating or refactoring tvOS
  UI, planning navigation, building media-browsing surfaces, or fixing layouts
  that feel touch-first or break under focus.
---

# tvOS UI Patterns

## Quick start

Choose a track based on your goal:

### Existing project

- Identify the screen's focus graph before touching layout code.
- Classify the surface: catalog, hero + shelves, detail/product page, search, sidebar root, or player-adjacent overlay.
- Read the nearest existing tvOS view before inventing a new structure.
- Use `references/components-index.md` to jump to the most relevant pattern.

### New tvOS screen or scaffold

- Start with `references/navigation-structure.md` to choose `NavigationStack`, `NavigationSplitView`, or `TabView` with `.sidebarAdaptable`.
- Read `references/focus-and-remote.md` before adding custom focus or gesture behavior.
- Read `references/lockups-shelves.md` before building shelves, lockups, or hero headers.
- Read `references/search-and-discovery.md` if the screen includes search or suggestion flows.

## Core rules to follow

- Start from focus, not touch. Every interactive decision should make directional focus movement and Siri Remote behavior clearer.
- Prefer `NavigationStack` for drill-down flows, `NavigationSplitView` for sidebar or catalog structure, and `TabView(.sidebarAdaptable)` for sectioned top-level apps on modern tvOS.
- Default to standard button styles:
  - use `.buttonStyle(.borderless)` for primary media lockups
  - use `.buttonStyle(.card)` when the lockup is information-dense
- Build shelves with `ScrollView(.horizontal)` plus `LazyHStack`, and use `.scrollClipDisabled()` so focused lockups can lift and scale without being clipped.
- Use `focusSection()` to bridge directional focus across large hero or header regions that would otherwise be skipped by straight-line focus search.
- Use `prefersDefaultFocus`, `defaultFocus`, `focusScope`, and `resetFocus` intentionally when content changes or when the best initial target is not the default geometric choice.
- Use `searchable` and `searchSuggestions` for search surfaces. Keep results stable, sorted, and easy to scan from across the room.
- Treat Liquid Glass as a functional control and navigation layer, not as decoration over content. Read `references/liquid-glass-and-styling.md` before custom glass work.
- Keep generous spacing, honor safe areas, and leave room for focus expansion and hover lift.

## Strong defaults

- Prefer system focus behavior over custom gesture systems.
- Use `@Environment(\.isFocused)` to react to focus state inside descendants instead of duplicating focus state in parent models.
- Apply `.focusable(...)` only to custom views that are not already intrinsically focusable. Do not wrap buttons, lists, or UIKit views that already manage focus cleanly.
- Keep hero content, shelves, details, and player-adjacent overlays as distinct layout regions with explicit responsibilities.
- Use context menus for long-press quick actions instead of inventing custom press-and-hold overlays.
- Keep copy short and scannable. TV text should not feel like a dense tablet UI stretched onto a larger screen.

## Anti-patterns

- Designing tvOS like an iPhone on a large monitor.
- Using `NavigationView` for new work instead of `NavigationStack` or `NavigationSplitView`.
- Building rigid grids that break when focused items enlarge.
- Leaving shelves clipped because `.scrollClipDisabled()` was omitted.
- Replacing standard remote behavior with custom swipe models or freeform pointer-like interaction.
- Spraying custom blur, background fills, or custom glass over bars, sidebars, and controls that should use system appearance.
- Assuming the top-left element is always the correct default focus target.
- Treating `verticalSizeClass` as a meaningful tvOS adaptation signal.

## Workflow for a new tvOS screen

1. Define the content surface and focus graph first.
2. Choose the root structure from `references/navigation-structure.md`.
3. Build the focusable content with standard lockup and shelf patterns from `references/lockups-shelves.md`.
4. Add explicit focus management only where geometry or content changes require it.
5. Review search, quick actions, and remote affordances if the screen exposes discovery actions.
6. Build and verify in the simulator, making sure focus moves where a TV user expects.

## References

- `references/components-index.md`
- `references/navigation-structure.md`
- `references/focus-and-remote.md`
- `references/lockups-shelves.md`
- `references/search-and-discovery.md`
- `references/liquid-glass-and-styling.md`
- In addition to the references above, use web search to consult current Apple Developer documentation when tvOS APIs, focus behavior, or design guidance may have changed.
