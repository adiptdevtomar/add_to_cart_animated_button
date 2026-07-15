## v1.0.0

- **Breaking:** `onIncrement` and `onDecrement` are now `Function()` instead of `Function(int)`. Callers must read the new value from their own state/controller instead of receiving it as a callback argument.
- **Fix:** `AddToCart` now enforces `maxValue`/`minValue` itself — the increment/decrement buttons no longer fire past those bounds (previously only the icon opacity dimmed; the tap still fired).
- Added `debugFillProperties` override on `AddToCart` (exposes `value`, `minValue`, `maxValue` in Flutter Inspector/DevTools).
- Updated example app's Android build tooling: Gradle 8.3 → 8.9, Android Gradle Plugin 8.1.0 → 8.7.0, Kotlin 1.8.22 → 2.1.0.
- Verified compatibility with Flutter 3.41.6 / Dart 3.11.4.

## v0.0.4

Correct formatting of all Files.

## v0.0.3

Update Gif Urls in README.md

## v0.0.2

Update README.md

## v0.0.1

Initial Version
