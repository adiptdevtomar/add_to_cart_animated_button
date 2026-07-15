import 'package:flutter/foundation.dart';

/// A [ValueNotifier] that holds the counter value for an [AddToCart] built
/// with `AddToCart.controller`.
///
/// While attached to a widget, the widget is the sole mutator of [value] for
/// normal increment/decrement taps — it applies the delta itself only after
/// the corresponding `onIncrement`/`onDecrement` callback resolves
/// successfully. Use [reset] or direct assignment only for imperative,
/// out-of-band changes (e.g. clearing a cart from a parent widget); do not
/// mutate [value] from inside `onIncrement`/`onDecrement`, or the widget's
/// own delta application will race with that mutation.
class AddToCartController extends ValueNotifier<int> {
  /// Creates a controller starting at [initialValue] (defaults to `0`).
  AddToCartController({int initialValue = 0}) : super(initialValue);

  /// Resets the counter to [value] (defaults to `0`), bypassing
  /// `minValue`/`maxValue` — the attached widget re-clamps on the next tap.
  void reset([int value = 0]) => this.value = value;
}
