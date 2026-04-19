# Focus And Remote

tvOS is focus-driven. Build your interaction model around directional movement and activation.

## Preferred tools

- Use `@Environment(\.isFocused)` when descendants need to react to a focused ancestor.
- Use `.focusable(...)` only for custom views that are not already focusable.
- Use `.prefersDefaultFocus(...)` or `.defaultFocus(...)` when the correct first target is not the default geometric guess.
- Use `.focusScope(...)` to constrain default-focus preferences to a meaningful region.
- Use `resetFocus` when filters, data, or screen state changes should return focus to the right target.
- Use `.focusSection()` to help focus jump across large empty gaps or disconnected regions.

## Remote interaction defaults

- Prefer standard swipe, press, and long-press behavior.
- Use context menus for long-press quick actions.
- Make focus move in the same direction as the remote gesture.
- Provide clear visual feedback for focus, activation, and long-press affordances.

## Guardrails

- Do not wrap buttons or lists with `.focusable(...)`.
- Do not move focus unexpectedly without a content change or user action.
- Do not invent pointer-like drag systems for non-game flows.
