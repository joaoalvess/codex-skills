---
name: tvos-accessibility-audit
description: >-
  Audit a tvOS app for distance legibility, focus order, captions, subtitles,
  contrast, VoiceOver or Voice Control compatibility, and reduced motion or
  transparency behavior. Use when reviewing whether an Apple TV experience is
  readable, predictable, and accessible from across the room.
---

# tvOS Accessibility Audit

## Overview

Accessibility on Apple TV is largely about legibility, predictable focus, and media accessibility. Audit the experience like a living-room product, not like a handheld app.

## Workflow

1. Audit focus order and discoverability:
   - can every interactive element be reached?
   - does focus move predictably?
   - is default focus sensible?
2. Audit distance legibility:
   - readable typography
   - concise copy
   - adequate spacing and contrast
3. Audit motion and transparency:
   - reduced motion
   - reduced transparency
   - custom effects that interfere with system accessibility settings
4. Audit media accessibility:
   - captions and subtitles
   - alternate audio where the product expects it
   - now-playing and playback controls that remain understandable under focus
5. Audit assistive labels and semantics:
   - VoiceOver labels
   - icon-only controls with accessible labels
   - meaningful section titles and button names

## Strong defaults

- Favor system controls and system focus effects.
- Keep text large, scannable, and brief. Apple guidance for tvOS accessibility cites 29 pt as a default size and 23 pt as a minimum.
- Provide accessibility labels for icon-only controls.
- Keep captions and subtitle affordances easy to reach.
- Test custom animations and translucent surfaces with reduced-motion and reduced-transparency settings.

## Anti-patterns

- Small, dense text copied from phone or tablet UI
- Long focus chains through low-value controls
- Icon-only controls without accessible labels
- Custom motion or glass effects that ignore accessibility settings
- Player or search surfaces whose key actions are not obvious under focus

## References

- `references/focus-accessibility-checklist.md`
- `references/media-accessibility-checklist.md`
- In addition to the references above, use web search to consult current Apple Developer documentation when tvOS accessibility guidance or platform behavior may have changed.
