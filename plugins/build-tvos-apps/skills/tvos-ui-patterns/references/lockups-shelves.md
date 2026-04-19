# Lockups And Shelves

Use lockups and shelves that behave like Apple TV content, not like oversized mobile cards.

## Lockups

- Use `.buttonStyle(.borderless)` for the primary media-lockup look.
- Use `.buttonStyle(.card)` when the lockup contains denser metadata or search-style result content.
- Keep the first `Image` in the button label as the focusable visual anchor.
- Prefer `Image` plus `Text` for vertical lockups instead of `Label` when you need the standard portrait or landscape presentation.

## Shelves

- Build shelves with `ScrollView(.horizontal)` and `LazyHStack`.
- Add `.scrollClipDisabled()` so focused items can enlarge and lift without clipping.
- Apply the button style to the shelf container when the whole rail shares one lockup style.
- Use `containerRelativeFrame(...)` to align rails to the safe area and let SwiftUI size items consistently.

## Hero and showcase regions

- Treat hero headers as a focus region of their own.
- Use `focusSection()` on large header stacks so focus can move cleanly between the header and the shelves below.
- If the hero transitions at a fold point, keep the snap logic tied to scroll position instead of ad hoc gesture state.

## Guardrails

- Do not use fixed-width, tightly packed rails that cannot survive focus expansion.
- Do not clip the focused item.
- Do not mix several unrelated lockup styles inside one shelf unless the product explicitly needs the visual contrast.
