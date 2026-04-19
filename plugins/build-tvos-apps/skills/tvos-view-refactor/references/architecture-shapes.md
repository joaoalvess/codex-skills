# tvOS Architecture Shapes

Use explicit surfaces instead of one giant screen type.

## Good boundaries

- `App/`: app entry, scene routing
- `Views/Sidebar/`: sidebar roots and section selectors
- `Views/Hero/`: showcase and banner content
- `Views/Shelves/`: rails, lockups, and section wrappers
- `Views/Details/`: product metadata and action panels
- `Views/Search/`: search shell and results
- `Views/Player/`: playback shell and overlays
- `Services/`: playback, metadata, routing, and network logic

## Guardrails

- Do not let one file own catalog browsing and playback transport at the same time.
- Keep focus and route state near the surface that owns it.
