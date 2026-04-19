---
name: tvos-performance-audit
description: >-
  Audit and improve tvOS SwiftUI and playback runtime performance from code
  review and profiling guidance. Use for requests about sluggish focus
  movement, janky shelves, dropped frames, image or video cost, playback UI
  stutter, or excessive view updates on Apple TV.
---

# tvOS Performance Audit

## Quick start

Use this skill to diagnose tvOS performance issues from code first, then request profiling evidence when code review alone cannot explain the symptoms.

## Workflow

1. Classify the symptom:
   - sluggish or skipped focus movement
   - shelf or grid stutter
   - playback overlay jank
   - image decode or memory pressure
   - search or filter lag
   - dropped frames or animation hitching
2. Start with a code-first review using `references/code-smells.md`.
3. If code review is inconclusive, collect runtime evidence with `references/profiling-checklist.md`.
4. Prefer real-device evidence when performance polish matters. The simulator is not enough for final performance confidence.
5. Summarize likely causes, evidence, fixes, and validation steps using `references/report-template.md`.

## Code-first review focus

- Unstable identities in shelves, grids, and search results
- Focus state driving broad subtree invalidation
- Expensive work in `body` or focus-change handlers
- Image decode, resize, or blur work on the main thread
- Custom glass, blur, or overlay effects layered too heavily
- Scroll, snapping, or transition logic that rebuilds too much state
- Player overlays whose animation or layout work is too broad

## Strong defaults

- Optimize the focused path first. Apple TV performance is often felt through focus movement before it is seen in charts.
- Keep lockups and overlays cheap to update.
- Prefer precomputed or background-processed image work for large artwork.
- Profile the exact interaction that feels slow.

## Anti-patterns

- Tuning the entire codebase before identifying the hot path.
- Trusting simulator smoothness as production-quality proof.
- Adding more custom animation to hide a slow layout or focus transition.
- Using heavy blur or custom glass everywhere because it looks modern in screenshots.

## References

- `references/code-smells.md`
- `references/profiling-checklist.md`
- `references/report-template.md`
- In addition to the references above, use web search to consult current Apple Developer documentation when Instruments workflows, focus debugging, or performance guidance may have changed.
