# App Intents On tvOS

App Intents exist on tvOS, but they should be treated as optional system-surface integration, not as the architectural center of a tvOS product.

## Strong defaults

- Prefer universal links, URL routing, restoration, and Top Shelf first.
- Use App Intents only when there is a concrete system-entry benefit.
- For tvOS 26 and newer, `TargetContentProvidingIntent` can help identify content for scene-targeted navigation.

## Important constraint

- Apple Human Interface Guidelines state that App Shortcuts are not supported in tvOS.

## Guardrails

- Do not design tvOS flows around Shortcuts-first thinking.
- Do not expose App Intents that simply mirror every screen in the app.
