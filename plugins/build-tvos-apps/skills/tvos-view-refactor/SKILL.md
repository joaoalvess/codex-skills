---
name: tvos-view-refactor
description: >-
  Refactor tvOS SwiftUI views toward stable focus regions, shelves, hero
  sections, player overlays, and explicit Apple TV navigation structure. Use
  when splitting oversized tvOS views, cleaning up focus-heavy screens, or
  tightening catalog, detail, search, and player UI composition without
  falling back to generic iOS refactor habits.
---

# tvOS View Refactor

## Overview

Refactor tvOS views around content surfaces and focus regions. The goal is not generic SwiftUI cleanliness; it is a stable Apple TV interaction model that survives focus movement, shelves, overlays, and system entry routing.

## Core guidelines

### 1) Model the major tvOS surfaces explicitly

- Sidebar or section selector
- Hero or showcase header
- Shelf list or content grid
- Detail metadata surface
- Search results surface
- Player overlay or transport surface

### 2) Keep a predictable file shape

- Environment
- `private` or `public` `let`
- `@State` and other stored properties
- computed non-view values
- `init`
- `body`
- computed view helpers
- helper and async functions

### 3) Prefer dedicated subview types over many computed `some View` fragments

- Extract shelves, lockup rows, hero sections, metadata panels, and player controls into focused subviews.
- Pass explicit data, bindings, and actions.
- Keep computed `some View` helpers small and rare.

### 4) Keep focus regions explicit and stable

- Use `focusSection()` where geometry needs help.
- Keep layout stable while data and focus state change inside it.
- Avoid top-level branch swapping between radically different roots when focus should remain local.

### 5) Extract actions and side effects out of `body`

- Keep button actions and async work in named helpers.
- Do not bury routing, filtering, playback mutations, or search logic inline.

### 6) Prefer MV over extra architecture by default

- Keep view-local state in the view.
- Keep business logic in services or existing models.
- Do not add a view model just to mirror focus or selection state.

## Workflow

1. Identify which tvOS surface is overloaded.
2. Re-establish the stable shell: sidebar, hero, shelves, detail, search, or player overlay.
3. Split the file by surface responsibility.
4. Move focus logic closer to the specific surface that owns it.
5. Preserve behavior unless the request explicitly includes a product change.

## Common smells

- One giant view mixing hero, shelves, detail metadata, search, and playback controls
- Focus logic scattered across unrelated descendants
- Catalog and player concerns living in the same file with no boundary
- Search, filtering, and routing mixed into lockup rendering code
- Repeated custom button or focus-effect code instead of standard styles

## References

- `references/architecture-shapes.md`
- `references/refactor-checklist.md`
