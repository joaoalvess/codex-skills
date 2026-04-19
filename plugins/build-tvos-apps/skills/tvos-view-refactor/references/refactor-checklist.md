# tvOS Refactor Checklist

- The root shell is stable under focus changes.
- Shelves and lockups have stable identity.
- Focus helpers are scoped to the surface that needs them.
- Hero, shelf, detail, search, and player concerns are separated.
- Actions and side effects are out of `body`.
- Standard button styles replace ad hoc focus visuals where possible.
