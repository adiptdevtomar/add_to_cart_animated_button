import 'package:flutter/material.dart';

/// AnimatedCounter widget to display animated transitions between numeric values.
class AnimatedCounter extends StatefulWidget {
  /// Height of the counter widget.
  final double height;

  /// Current numeric value of the counter.
  final int value;

  /// Text style for the numeric value.
  final TextStyle style;

  /// Duration of the animation.
  final Duration duration;

  /// Constructor for the AnimatedCounter widget.
  const AnimatedCounter({
    super.key,
    required this.value,
    required this.style,
    required this.height,
    required this.duration,
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  @override
  Widget build(BuildContext context) {
    // Create a TextPainter to measure the size of the text for layout purposes.
    final prototypeDigit = TextPainter(
      text: TextSpan(text: widget.value.toString(), style: widget.style),
      textDirection: TextDirection.ltr,
      textScaler: MediaQuery.of(context).textScaler,
    )..layout();

    // Get the size of the text.
    final size = prototypeDigit.size;

    // Calculate the offset to vertically center the text within the given height.
    final heightOffset = (widget.height - size.height) / 2;

    return Center(
      child: DefaultTextStyle.merge(
        style: widget.style,
        child: TweenAnimationBuilder<double>(
          curve: Curves.linear,
          duration: widget.duration,
          tween: Tween(end: widget.value.toDouble()),
          builder: (_, double value, __) {
            final whole = value.floor();
            final decimal = value - whole;
            final hei = size.height + heightOffset;
            return SizedBox(
              height: double.infinity,
              child: Stack(
                children: [
                  // Render the current digit with decreasing opacity.
                  DigitBuilder(
                    value: whole,
                    textStyle: widget.style,
                    offset: (hei * decimal) + heightOffset,
                    opacity: 1 - decimal,
                  ),
                  // Render the next digit with increasing opacity.
                  DigitBuilder(
                    value: whole + 1,
                    textStyle: widget.style,
                    offset: (hei * decimal - hei) + heightOffset,
                    opacity: decimal,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// DigitBuilder widget to render individual digits with animation.
/// This class is responsible for displaying a single digit and managing its position, opacity, and styling.
class DigitBuilder extends StatelessWidget {
  /// Numeric value to render.
  final int value;

  /// Text style for the digit.
  final TextStyle textStyle;

  /// Opacity of the digit.
  final double opacity;

  /// Vertical offset of the digit.
  final double offset;

  /// Constructor for the DigitBuilder widget.
  const DigitBuilder({
    super.key,
    required this.value,
    required this.textStyle,
    required this.offset,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    final Widget child;
    child = textStyle.color?.a == 1
        ? Text(
            '$value',
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
              color: textStyle.color?.withAlpha(
                (255.0 * opacity.clamp(0, 1)).round(),
                // Ensure opacity is within valid range.
              ),
            ),
          )
        : Opacity(
            opacity: opacity.clamp(0, 1),
            child: Text(
              '$value',
              textAlign: TextAlign.center,
            ),
          );
    // Position the digit based on the calculated offset.
    return Positioned(
      bottom: offset,
      left: 0,
      right: 0,
      child: child,
    );
  }
}
