# Navigation Structure

Choose the root structure based on the content model, not on how an iPhone screen would be routed.

## Preferred choices

- Use `NavigationStack` for drill-down content flows and programmatic deep-link routing.
- Use `NavigationSplitView` when the app needs a persistent sidebar or a clear catalog hierarchy with detail content.
- Use `TabView` with `.sidebarAdaptable` when the app has several top-level sections and should present them as a sidebar on tvOS.

## Strong defaults

- Keep navigation state explicit so universal links, scene restoration, and content handoff can land in the correct destination.
- Prefer one stable root structure instead of top-level branching between unrelated shells.
- Model sections by domain content such as Home, Search, Library, Sports, or Settings, not by implementation-layer route names.

## Guardrails

- Do not use `NavigationView` for new tvOS work.
- Do not force a touch-first tab bar or bottom bar structure onto tvOS.
- If the app mixes catalog browsing with a player surface, keep the catalog shell and playback shell distinct.
