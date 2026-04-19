# tvOS Profiling Checklist

Collect the smallest useful evidence first.

## Ask for

- the exact reproduction path
- whether the issue appears on simulator, device, or both
- Debug vs Release build context
- screenshots or traces from Instruments
- the exact screen or interaction being profiled

## Preferred evidence

- SwiftUI timeline or view-update evidence
- Time Profiler traces
- memory snapshots when large artwork or video surfaces are involved
- focus-debug evidence when movement or selection is wrong

## Important note

- Real-device validation is required before calling a tvOS performance problem fixed.
