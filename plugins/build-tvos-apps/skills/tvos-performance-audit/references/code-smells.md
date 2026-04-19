# tvOS Performance Code Smells

Focus on the hot path a TV user can feel.

## Common smells

- `ForEach` items without stable identity in shelves or grids
- Focus changes toggling large parent state instead of local visual state
- Image decode, resize, or large blur work running on the main thread
- Custom focus effects that rebuild the entire lockup subtree
- Heavy overlay stacks that animate together when only one control changes
- Search results reordering unpredictably as text changes
- Scroll snapping or hero transitions that continuously recompute layout

## Good fixes

- Stabilize identities
- Narrow state ownership
- Precompute artwork sizes and metadata
- Reduce custom blur, glass, and shadow layers
- Keep focused overlays small and cheap
