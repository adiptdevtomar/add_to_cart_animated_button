import 'dart:async';

import 'package:add_to_cart_animated_button/add_to_cart_controller.dart';
import 'package:add_to_cart_animated_button/add_to_cart_theme.dart';
import 'package:add_to_cart_animated_button/animated_counter.dart';
import 'package:flutter/foundation.dart'
    show DiagnosticPropertiesBuilder, FlagProperty, IntProperty;
import 'package:flutter/material.dart';

/// A customizable and animated "Add to Cart" widget that transitions between an
/// initial "Add" state and a counter state.
class AddToCart extends StatefulWidget {
  /// Creates an [AddToCart] whose [value] is owned by the caller. The caller
  /// is expected to update [value] (e.g. via `setState`) in response to
  /// [onIncrement]/[onDecrement].
  const AddToCart({
    Key? key,
    required int value,
    required FutureOr<void> Function() onIncrement,
    required FutureOr<void> Function() onDecrement,
    required int maxValue,
    int minValue = 0,
    VoidCallback? onMaxValueReached,
    VoidCallback? onMinValueReached,
    bool enabled = true,
    String? errorText,
    bool enableLongPressRepeat = false,
    Duration longPressRepeatInterval = const Duration(milliseconds: 150),
    Widget? loadingIndicator,
    String incrementSemanticLabel = 'Increase quantity',
    String decrementSemanticLabel = 'Decrease quantity',
    String addSemanticLabel = 'Add to cart',
    String Function(int value)? counterSemanticLabelBuilder,
    Text? initialText,
    TextStyle? counterTextStyle,
    Duration duration = const Duration(milliseconds: 100),
    BoxDecoration? initialBoxDecoration,
    BoxDecoration? counterBoxDecoration,
    Icon? incrementIcon,
    Icon? decrementIcon,
    double heightScaleFactor = 1,
    double widthScaleFactor = 1,
    double width = 150,
    double height = 50,
  }) : this._(
          key: key,
          value: value,
          controller: null,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
          maxValue: maxValue,
          minValue: minValue,
          onMaxValueReached: onMaxValueReached,
          onMinValueReached: onMinValueReached,
          enabled: enabled,
          errorText: errorText,
          enableLongPressRepeat: enableLongPressRepeat,
          longPressRepeatInterval: longPressRepeatInterval,
          loadingIndicator: loadingIndicator,
          incrementSemanticLabel: incrementSemanticLabel,
          decrementSemanticLabel: decrementSemanticLabel,
          addSemanticLabel: addSemanticLabel,
          counterSemanticLabelBuilder: counterSemanticLabelBuilder,
          initialText: initialText,
          counterTextStyle: counterTextStyle,
          duration: duration,
          initialBoxDecoration: initialBoxDecoration,
          counterBoxDecoration: counterBoxDecoration,
          incrementIcon: incrementIcon,
          decrementIcon: decrementIcon,
          heightScaleFactor: heightScaleFactor,
          widthScaleFactor: widthScaleFactor,
          width: width,
          height: height,
        );

  /// Creates an [AddToCart] whose value is owned by [controller] instead of
  /// a caller-managed `value`. The widget advances [controller]'s value
  /// itself once [onIncrement]/[onDecrement] resolve successfully; use
  /// [AddToCartController.reset] for out-of-band changes (e.g. clearing a
  /// cart) from a parent widget.
  const AddToCart.controller({
    Key? key,
    required AddToCartController controller,
    required FutureOr<void> Function() onIncrement,
    required FutureOr<void> Function() onDecrement,
    required int maxValue,
    int minValue = 0,
    VoidCallback? onMaxValueReached,
    VoidCallback? onMinValueReached,
    bool enabled = true,
    String? errorText,
    bool enableLongPressRepeat = false,
    Duration longPressRepeatInterval = const Duration(milliseconds: 150),
    Widget? loadingIndicator,
    String incrementSemanticLabel = 'Increase quantity',
    String decrementSemanticLabel = 'Decrease quantity',
    String addSemanticLabel = 'Add to cart',
    String Function(int value)? counterSemanticLabelBuilder,
    Text? initialText,
    TextStyle? counterTextStyle,
    Duration duration = const Duration(milliseconds: 100),
    BoxDecoration? initialBoxDecoration,
    BoxDecoration? counterBoxDecoration,
    Icon? incrementIcon,
    Icon? decrementIcon,
    double heightScaleFactor = 1,
    double widthScaleFactor = 1,
    double width = 150,
    double height = 50,
  }) : this._(
          key: key,
          value: null,
          controller: controller,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
          maxValue: maxValue,
          minValue: minValue,
          onMaxValueReached: onMaxValueReached,
          onMinValueReached: onMinValueReached,
          enabled: enabled,
          errorText: errorText,
          enableLongPressRepeat: enableLongPressRepeat,
          longPressRepeatInterval: longPressRepeatInterval,
          loadingIndicator: loadingIndicator,
          incrementSemanticLabel: incrementSemanticLabel,
          decrementSemanticLabel: decrementSemanticLabel,
          addSemanticLabel: addSemanticLabel,
          counterSemanticLabelBuilder: counterSemanticLabelBuilder,
          initialText: initialText,
          counterTextStyle: counterTextStyle,
          duration: duration,
          initialBoxDecoration: initialBoxDecoration,
          counterBoxDecoration: counterBoxDecoration,
          incrementIcon: incrementIcon,
          decrementIcon: decrementIcon,
          heightScaleFactor: heightScaleFactor,
          widthScaleFactor: widthScaleFactor,
          width: width,
          height: height,
        );

  const AddToCart._({
    super.key,
    this.value,
    this.controller,
    required this.onIncrement,
    required this.onDecrement,
    required this.maxValue,
    this.minValue = 0,
    this.onMaxValueReached,
    this.onMinValueReached,
    this.enabled = true,
    this.errorText,
    this.enableLongPressRepeat = false,
    this.longPressRepeatInterval = const Duration(milliseconds: 150),
    this.loadingIndicator,
    this.incrementSemanticLabel = 'Increase quantity',
    this.decrementSemanticLabel = 'Decrease quantity',
    this.addSemanticLabel = 'Add to cart',
    this.counterSemanticLabelBuilder,
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
  });

  /// Current value of the counter. Null when [controller] drives the value.
  final int? value;

  /// Controller that owns the counter value instead of [value]. When
  /// non-null, the widget advances [AddToCartController.value] itself after
  /// [onIncrement]/[onDecrement] resolve successfully.
  final AddToCartController? controller;

  /// Callback triggered when the increment button is pressed. May return a
  /// [Future]; if it does, the widget awaits it and shows [loadingIndicator]
  /// while pending, disabling further taps until it resolves. Never called
  /// once `value` reaches [maxValue] — see [onMaxValueReached].
  final FutureOr<void> Function() onIncrement;

  /// Callback triggered when the decrement button is pressed. Same
  /// async/loading semantics as [onIncrement]. Never called once `value`
  /// reaches [minValue] — see [onMinValueReached].
  final FutureOr<void> Function() onDecrement;

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

  /// Called when a tap on the increment control is blocked because the
  /// current value already equals [maxValue].
  final VoidCallback? onMaxValueReached;

  /// Called when a tap on the decrement control is blocked because the
  /// current value already equals [minValue].
  final VoidCallback? onMinValueReached;

  /// Whether the widget responds to taps. When `false`, both controls are
  /// disabled and the whole widget is rendered at reduced opacity.
  final bool enabled;

  /// Optional error message rendered below the widget in the theme's error
  /// color. Null (the default) renders nothing extra.
  final String? errorText;

  /// When `true`, press-and-hold on the increment/decrement controls repeats
  /// the action every [longPressRepeatInterval] until release or a bound is
  /// hit.
  final bool enableLongPressRepeat;

  /// Repeat cadence used when [enableLongPressRepeat] is `true`.
  final Duration longPressRepeatInterval;

  /// Widget shown in place of the counter row while an async
  /// [onIncrement]/[onDecrement] call is pending. Defaults to a small
  /// [CircularProgressIndicator].
  final Widget? loadingIndicator;

  /// Semantics label for the increment control.
  final String incrementSemanticLabel;

  /// Semantics label for the decrement control.
  final String decrementSemanticLabel;

  /// Semantics label for the initial "Add" control.
  final String addSemanticLabel;

  /// Builds the semantics label announced for the current value. Defaults to
  /// `'Quantity: $value'`.
  final String Function(int value)? counterSemanticLabelBuilder;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> with TickerProviderStateMixin {
  bool _isLoading = false;
  Timer? _repeatTimer;

  int get _currentValue => widget.controller?.value ?? widget.value!;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(AddToCart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onControllerChanged);
      widget.controller?.addListener(_onControllerChanged);
    }
    if (!widget.enableLongPressRepeat) {
      _stopRepeat();
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerChanged);
    _repeatTimer?.cancel();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(IntProperty('value', widget.value));
    properties.add(IntProperty('minValue', widget.minValue));
    properties.add(IntProperty('maxValue', widget.maxValue));
    properties
        .add(FlagProperty('enabled', value: widget.enabled, ifFalse: 'disabled'));
    properties.add(FlagProperty('controller',
        value: widget.controller != null, ifTrue: 'controller-driven'));
    super.debugFillProperties(properties);
  }

  void _onControllerChanged() {
    if (mounted) setState(() {});
  }

  Future<bool> _handleIncrement() async {
    if (!widget.enabled || _isLoading) return false;
    if (_currentValue >= widget.maxValue) {
      widget.onMaxValueReached?.call();
      return false;
    }
    setState(() => _isLoading = true);
    try {
      await widget.onIncrement();
      final AddToCartController? controller = widget.controller;
      if (controller != null) {
        controller.value = controller.value + 1;
      }
      return true;
    } catch (error, stackTrace) {
      FlutterError.reportError(FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'add_to_cart_animated_button',
      ));
      return false;
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<bool> _handleDecrement() async {
    if (!widget.enabled || _isLoading) return false;
    // Captured before the async gap: unlike the increment side, the widget
    // collapses back to its "Add" state as soon as value <= minValue (its
    // existing, intentional behavior), which hides the decrement control
    // entirely — so a "blocked tap" can never actually reach minValue's
    // control once there. Predicting the post-decrement value here lets
    // onMinValueReached fire on the decrement that *lands on* minValue,
    // which is the only reachable trigger point for that event.
    final int valueBeforeDecrement = _currentValue;
    if (valueBeforeDecrement <= widget.minValue) {
      widget.onMinValueReached?.call();
      return false;
    }
    setState(() => _isLoading = true);
    try {
      await widget.onDecrement();
      final AddToCartController? controller = widget.controller;
      if (controller != null) {
        controller.value = controller.value - 1;
      }
      if (valueBeforeDecrement - 1 <= widget.minValue) {
        widget.onMinValueReached?.call();
      }
      return true;
    } catch (error, stackTrace) {
      FlutterError.reportError(FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'add_to_cart_animated_button',
      ));
      return false;
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _startRepeat(Future<bool> Function() action) {
    _stopRepeat();
    action();
    _repeatTimer = Timer.periodic(widget.longPressRepeatInterval, (_) async {
      final bool acted = await action();
      if (!acted) _stopRepeat();
    });
  }

  void _stopRepeat() {
    _repeatTimer?.cancel();
    _repeatTimer = null;
  }

  Widget _buildControl({
    required bool isAdded,
    required bool interactive,
    required bool blocked,
    required Offset offset,
    required Icon icon,
    required String semanticLabel,
    required VoidCallback? onBlocked,
    required Future<bool> Function() action,
  }) {
    final Widget inkWell = InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: !interactive
          ? null
          : blocked
              ? (onBlocked == null ? null : () => onBlocked())
              : () => action(),
      child: icon,
    );
    final Widget gestureWrapped = !widget.enableLongPressRepeat
        ? inkWell
        : GestureDetector(
            onLongPressStart: (!interactive || blocked)
                ? null
                : (_) => _startRepeat(action),
            onLongPressEnd: (_) => _stopRepeat(),
            onLongPressCancel: _stopRepeat,
            child: inkWell,
          );
    return Expanded(
      child: AnimatedSlide(
        duration: widget.duration,
        offset: isAdded ? const Offset(0, 0) : offset,
        child: Opacity(
          opacity: blocked ? 0.6 : 1,
          child: Semantics(
            button: true,
            enabled: interactive && !blocked,
            label: semanticLabel,
            child: gestureWrapped,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int currentValue = _currentValue;
    // Check if the item is already added to the cart.
    final bool isAdded = currentValue > widget.minValue;
    final bool incrementBlocked = currentValue >= widget.maxValue;
    final bool decrementBlocked = currentValue <= widget.minValue;
    final bool interactive = widget.enabled && !_isLoading;

    final AddToCartThemeData? addToCartTheme =
        Theme.of(context).extension<AddToCartThemeData>();
    final BoxDecoration resolvedInitialDecoration = widget.initialBoxDecoration ??
        addToCartTheme?.initialBoxDecoration ??
        const BoxDecoration(
          color: Color.fromRGBO(74, 132, 44, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        );
    final BoxDecoration resolvedCounterDecoration = widget.counterBoxDecoration ??
        addToCartTheme?.counterBoxDecoration ??
        const BoxDecoration(
          color: Color.fromRGBO(74, 132, 44, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        );
    final Icon resolvedIncrementIcon = widget.incrementIcon ??
        addToCartTheme?.incrementIcon ??
        const Icon(Icons.add, color: Colors.white);
    final Icon resolvedDecrementIcon = widget.decrementIcon ??
        addToCartTheme?.decrementIcon ??
        const Icon(Icons.remove, color: Colors.white);
    final TextStyle resolvedCounterTextStyle = (widget.counterTextStyle ??
            addToCartTheme?.counterTextStyle ??
            const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ))
        .copyWith(height: 1);

    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    final Offset decrementOffset =
        isRtl ? const Offset(0.4, 0) : const Offset(-0.4, 0);
    final Offset incrementOffset =
        isRtl ? const Offset(-0.4, 0) : const Offset(0.4, 0);

    final String counterLabel =
        (widget.counterSemanticLabelBuilder ?? (int v) => 'Quantity: $v')(
            currentValue);

    Widget content = AnimatedContainer(
      duration: widget.duration,
      // Adjust size based on whether the item is added.
      height:
          isAdded ? widget.height * widget.heightScaleFactor : widget.height,
      width: isAdded ? widget.width * widget.widthScaleFactor : widget.width,
      decoration: isAdded ? resolvedCounterDecoration : resolvedInitialDecoration,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          // Counter state UI with decrement, counter, and increment buttons.
          // Hidden (rather than just covered) while loading, so the loading
          // indicator doesn't render on top of the counter digits.
          AnimatedOpacity(
            duration: widget.duration,
            opacity: (isAdded && !_isLoading) ? 1 : 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildControl(
                  isAdded: isAdded,
                  interactive: interactive,
                  blocked: decrementBlocked,
                  offset: decrementOffset,
                  icon: resolvedDecrementIcon,
                  semanticLabel: widget.decrementSemanticLabel,
                  onBlocked: widget.onMinValueReached,
                  action: _handleDecrement,
                ),
                // Counter value display.
                Expanded(
                  child: Semantics(
                    label: counterLabel,
                    child: ExcludeSemantics(
                      child: AnimatedCounter(
                        duration: widget.duration,
                        height: isAdded
                            ? widget.height * widget.heightScaleFactor
                            : widget.height,
                        value: currentValue,
                        style: resolvedCounterTextStyle,
                      ),
                    ),
                  ),
                ),
                _buildControl(
                  isAdded: isAdded,
                  interactive: interactive,
                  blocked: incrementBlocked,
                  offset: incrementOffset,
                  icon: resolvedIncrementIcon,
                  semanticLabel: widget.incrementSemanticLabel,
                  onBlocked: widget.onMaxValueReached,
                  action: _handleIncrement,
                ),
              ],
            ),
          ),
          // Initial state UI with "Add" button. Also hidden while loading,
          // for the same reason as the counter row above.
          IgnorePointer(
            ignoring: isAdded,
            child: AnimatedOpacity(
              duration: widget.duration,
              opacity: (!isAdded && !_isLoading) ? 1 : 0,
              child: Semantics(
                button: true,
                enabled: interactive && !incrementBlocked,
                label: widget.addSemanticLabel,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: !interactive
                      ? null
                      : incrementBlocked
                          ? () => widget.onMaxValueReached?.call()
                          : () => _handleIncrement(),
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
          ),
          // Loading overlay shown while an async onIncrement/onDecrement is
          // pending. Only mounted while loading -- an indeterminate
          // CircularProgressIndicator schedules frames forever, so leaving it
          // mounted (even at zero opacity) would keep animating indefinitely.
          if (_isLoading)
            IgnorePointer(
              child: Center(
                child: widget.loadingIndicator ??
                    const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
              ),
            ),
        ],
      ),
    );

    if (!widget.enabled) {
      content = Opacity(opacity: 0.5, child: IgnorePointer(child: content));
    }

    if (widget.errorText == null) {
      return content;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        content,
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            widget.errorText!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
