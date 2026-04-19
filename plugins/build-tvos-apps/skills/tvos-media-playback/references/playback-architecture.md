# Playback Architecture

Start from a clean separation between browsing and playback.

## Recommended shape

- Catalog shell: shelves, lockups, search, metadata, and route selection
- Playback shell: player, sparse overlay controls, playback metadata, and exit or continuation actions

## Preferred defaults

- Use `AVPlayerViewController` as the standard playback surface.
- Keep a stable content identifier so the app can deep-link back into the correct catalog or detail page.
- Make the transition from detail page to player obvious and reversible.

## Guardrails

- Do not force the player to reuse the same layout primitives as the catalog.
- Do not let navigation or focus logic from the catalog leak into the player overlay.
