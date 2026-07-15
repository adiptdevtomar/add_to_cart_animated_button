import 'package:flutter/material.dart';

/// Theme defaults for [AddToCart], registered via [ThemeData.extensions] so
/// an app can style every `AddToCart` instance from one place instead of
/// repeating decorations/icons/text styles per widget.
///
/// Values supplied directly to an `AddToCart` constructor always take
/// precedence over this theme; values left null here fall back to the
/// widget's own hardcoded defaults.
@immutable
class AddToCartThemeData extends ThemeExtension<AddToCartThemeData> {
  /// Creates a theme extension for [AddToCart].
  const AddToCartThemeData({
    this.initialBoxDecoration,
    this.counterBoxDecoration,
    this.incrementIcon,
    this.decrementIcon,
    this.counterTextStyle,
  });

  /// Default box decoration for the initial "Add" state.
  final BoxDecoration? initialBoxDecoration;

  /// Default box decoration for the counter state.
  final BoxDecoration? counterBoxDecoration;

  /// Default icon for the increment button.
  final Icon? incrementIcon;

  /// Default icon for the decrement button.
  final Icon? decrementIcon;

  /// Default text style for the counter value.
  final TextStyle? counterTextStyle;

  @override
  AddToCartThemeData copyWith({
    BoxDecoration? initialBoxDecoration,
    BoxDecoration? counterBoxDecoration,
    Icon? incrementIcon,
    Icon? decrementIcon,
    TextStyle? counterTextStyle,
  }) {
    return AddToCartThemeData(
      initialBoxDecoration: initialBoxDecoration ?? this.initialBoxDecoration,
      counterBoxDecoration: counterBoxDecoration ?? this.counterBoxDecoration,
      incrementIcon: incrementIcon ?? this.incrementIcon,
      decrementIcon: decrementIcon ?? this.decrementIcon,
      counterTextStyle: counterTextStyle ?? this.counterTextStyle,
    );
  }

  @override
  AddToCartThemeData lerp(ThemeExtension<AddToCartThemeData>? other, double t) {
    if (other is! AddToCartThemeData) return this;
    return AddToCartThemeData(
      initialBoxDecoration: BoxDecoration.lerp(
          initialBoxDecoration, other.initialBoxDecoration, t),
      counterBoxDecoration: BoxDecoration.lerp(
          counterBoxDecoration, other.counterBoxDecoration, t),
      // Icon doesn't support smooth interpolation; jump at the midpoint.
      incrementIcon: t < 0.5 ? incrementIcon : other.incrementIcon,
      decrementIcon: t < 0.5 ? decrementIcon : other.decrementIcon,
      counterTextStyle:
          TextStyle.lerp(counterTextStyle, other.counterTextStyle, t),
    );
  }
}
