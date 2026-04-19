# Liquid Glass And Styling

Treat Liquid Glass as the control and navigation layer, not as a decorative coating over the content layer.

## Default posture

- Build and run with the latest SDKs first and inspect how standard controls, bars, and sidebars already adapt.
- Prefer standard SwiftUI controls, bars, sheets, and sidebars before adding custom glass.
- Remove custom backgrounds and effects from controls and navigation layers when they fight system appearance.

## tvOS-specific guidance

- On supported Apple TV hardware, standard controls can adopt Liquid Glass behavior when focused.
- For custom elements, use standard focus APIs so focus state and custom glass remain aligned.
- If multiple custom glass surfaces must morph or animate together, group them with `GlassEffectContainer`.

## Guardrails

- Do not create a full-screen glass content layer.
- Do not stack many custom glass surfaces on top of each other.
- Do not use custom glass to compensate for weak layout, spacing, or focus design.
