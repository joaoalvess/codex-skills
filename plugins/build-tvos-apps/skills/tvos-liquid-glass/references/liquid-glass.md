# tvOS Liquid Glass Reference

Treat Liquid Glass as a control and navigation layer that helps people focus on content.

## Default posture

- Build and run with the latest SDKs first.
- Prefer standard controls, sidebars, bars, and focus behavior before custom glass work.
- Remove custom backgrounds and blur that interfere with system appearance.

## Good fits

- compact floating action groups
- filter chips or segmented controls near content
- player-adjacent action clusters
- app-specific controls that do not have a standard equivalent

## Poor fits

- coating every lockup or shelf item in custom glass
- putting decorative glass directly over media content
- using glass to replace missing spacing, hierarchy, or focus design

## Composition rules

- Use `GlassEffectContainer` for nearby related glass elements.
- Use `glassEffectID` with a namespace for morphing transitions.
- Add `tint` only when it conveys product meaning.
- Keep shapes and spacing consistent across related glass surfaces.
