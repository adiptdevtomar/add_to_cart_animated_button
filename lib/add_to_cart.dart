import 'package:add_to_cart_animated_button/animated_counter.dart';
import 'package:flutter/material.dart';

/// A customizable and animated "Add to Cart" widget that transitions between an
/// initial "Add" state and a counter state.
class AddToCart extends StatefulWidget {
  /// Current value of the counter.
  final int value;

  /// Callback triggered when the increment button is pressed.
  final Function(int) onIncrement;

  /// Callback triggered when the decrement button is pressed.
  final Function(int) onDecrement;

  /// Text displayed in the initial state.
  final Text? initialText;

  /// Style for the counter text.
  final TextStyle? counterTextStyle;

  /// Duration for the animations.
  final Duration duration;

  /// Box decoration for the initial state.
  final BoxDecoration? initialBoxDecoration;

  /// Box decoration for the counter state.
  final BoxDecoration? counterBoxDecoration;

  /// Icon for the increment button.
  final Icon? incrementIcon;

  /// Icon for the decrement button.
  final Icon? decrementIcon;

  /// Height of the widget.
  final double height;

  /// Width of the widget.
  final double width;

  /// Scale factor for height during the counter state.
  final double heightScaleFactor;

  /// Scale factor for width during the counter state.
  final double widthScaleFactor;

  /// Minimum value allowed for the counter.
  final int minValue;

  /// Maximum value allowed for the counter.
  final int maxValue;

  /// Constructor for the AddToCart widget.
  const AddToCart({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    required this.maxValue,
    this.initialText,
    this.counterTextStyle,
    this.duration = const Duration(milliseconds: 100),
    this.initialBoxDecoration,
    this.counterBoxDecoration,
    this.incrementIcon,
    this.decrementIcon,
    this.heightScaleFactor = 1,
    this.widthScaleFactor = 1,
    this.width = 150,
    this.height = 50,
    this.minValue = 0,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // Check if the item is already added to the cart.
    final bool isAdded = widget.value > widget.minValue;

    return AnimatedContainer(
      duration: widget.duration,
      // Adjust size based on whether the item is added.
      height:
          isAdded ? widget.height * widget.heightScaleFactor : widget.height,
      width: isAdded ? widget.width * widget.widthScaleFactor : widget.width,
      // Use the appropriate box decoration for the state.
      decoration: (isAdded
              ? widget.counterBoxDecoration
              : widget.initialBoxDecoration) ??
          const BoxDecoration(
            color: Color.fromRGBO(74, 132, 44, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          // Counter state UI with decrement, counter, and increment buttons.
          AnimatedOpacity(
            duration: widget.duration,
            opacity: isAdded ? 1 : 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Decrement button.
                Expanded(
                  child: AnimatedSlide(
                    duration: widget.duration,
                    offset:
                        isAdded ? const Offset(0, 0) : const Offset(-0.4, 0),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () => widget.onDecrement.call(widget.value - 1),
                      child: widget.decrementIcon ??
                          const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                // Counter value display.
                Expanded(
                  child: AnimatedCounter(
                    duration: widget.duration,
                    height: isAdded
                        ? widget.height * widget.heightScaleFactor
                        : widget.height,
                    value: widget.value,
                    style: widget.counterTextStyle?.copyWith(height: 1) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1,
                          color: Colors.white,
                        ),
                  ),
                ),
                // Increment button.
                Expanded(
                  child: AnimatedSlide(
                    duration: widget.duration,
                    offset: isAdded ? const Offset(0, 0) : const Offset(0.4, 0),
                    child: Opacity(
                      opacity: (widget.value >= widget.maxValue) ? 0.6 : 1,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () => widget.onIncrement.call(
                            (widget.value >= widget.maxValue)
                                ? widget.value
                                : widget.value + 1),
                        child: widget.incrementIcon ??
                            const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Initial state UI with "Add" button.
          IgnorePointer(
            ignoring: isAdded,
            child: AnimatedOpacity(
              duration: widget.duration,
              opacity: isAdded ? 0 : 1,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () => widget.onIncrement.call(widget.value + 1),
                child: Center(
                  child: widget.initialText ??
                      const Text(
                        'ADD',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
