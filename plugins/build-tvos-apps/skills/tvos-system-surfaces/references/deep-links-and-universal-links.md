# Deep Links And Universal Links

Universal links and URL routing are the default external entry model for tvOS apps.

## Recommended shape

- Represent destinations with stable identifiers and route enums or path elements.
- Route incoming URLs through one app-level entry path.
- Restore enough state to land the user in the right detail or player surface without rebuilding the entire app around one-off deep-link code.

## Strong defaults

- Keep the route model aligned with `NavigationStack` path values or sidebar/detail selection state.
- Make sure the focused element after routing is obvious and usable.
- Treat continuation into playback differently from continuation into catalog browsing.

## Guardrails

- Do not bury URL parsing logic inside arbitrary view files.
- Do not encode transient UI-only state into deep-link identifiers.
