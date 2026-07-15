## v1.0.0

- **Breaking:** `onIncrement` and `onDecrement` are now `FutureOr<void> Function()` instead of `Function(int)`. Callers must read the new value from their own state/controller instead of receiving it as a callback argument. Existing synchronous callbacks keep working unchanged.
- **Fix:** `AddToCart` now enforces `maxValue`/`minValue` itself — the increment/decrement buttons no longer fire past those bounds (previously only the icon opacity dimmed; the tap still fired).
- **Behavior change:** tapping a control at its bound now fires the new `onMaxValueReached`/`onMinValueReached` callback instead of doing nothing — the real `onIncrement`/`onDecrement` still never fires past the bound.
- Added built-in async/loading support: if `onIncrement`/`onDecrement` returns a `Future`, the widget awaits it, shows `loadingIndicator` while pending, and blocks further taps until it resolves.
- Added `AddToCart.controller` constructor and `AddToCartController` (a `ValueNotifier<int>`) for imperative/external control (e.g. resetting the count from a parent widget) as an alternative to the caller-managed `value` prop.
- Added `AddToCartThemeData` as a `ThemeExtension` so colors/decorations/icons/text style can be set once via `ThemeData.extensions` instead of per-instance; explicit constructor params still take precedence.
- Added accessibility: `Semantics` labels on all controls, configurable via `incrementSemanticLabel`, `decrementSemanticLabel`, `addSemanticLabel`, and `counterSemanticLabelBuilder`.
- Added `enabled` and `errorText` params for disabled/read-only/error states.
- Added `enableLongPressRepeat` (+ `longPressRepeatInterval`) to auto-repeat increment/decrement on long-press.
- Fixed the increment/decrement slide animation to respect `Directionality` (previously always slid left-to-right regardless of locale).
- Added `debugFillProperties` override on `AddToCart` (exposes `value`, `minValue`, `maxValue`, `enabled`, and whether a `controller` is attached, in Flutter Inspector/DevTools).
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
