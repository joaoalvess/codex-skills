# Search And Discovery

Search in tvOS should be easy to scan, semantically narrow, and stable under focus.

## Preferred patterns

- Use `searchable(text:placement:prompt:)` for the search field.
- Use `searchSuggestions` for light suggestion flows and keep the suggestions semantically useful.
- Keep tvOS suggestions simple and text-based.
- Prefer `LazyVGrid` for search-result layouts so several rows remain visible at once.
- Keep result ordering stable so focus does not jump unpredictably as the user types.

## Good defaults

- Use landscape lockups for dense search results.
- Keep search scopes few and obvious.
- Make empty, loading, and error states focus-safe and readable from across the room.

## Guardrails

- Do not build a custom search shell if standard SwiftUI search already fits.
- Do not let live reordering break focus predictability.
- Do not overload the page with tiny metadata lines or touch-first filter chips.
