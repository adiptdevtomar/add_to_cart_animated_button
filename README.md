# add_to_cart_animation_button

Add to Cart Button with Animation and Custom Styling for Modern Shopping apps like experience.

See the [install instructions](https://pub.dev/packages/add_to_cart_animated_button/example).

## References

Here is a cheatsheet of parameters available for customization 

- **`value`**: *(int)*  
  The current value of the counter. Omit when using `AddToCart.controller` (see [Controller-based Usage](#controller-based-usage)).

- **`controller`**: *(AddToCartController?)*  
  Only available via the `AddToCart.controller` constructor. Owns the counter value instead of `value` — see [Controller-based Usage](#controller-based-usage).

- **`onIncrement`**: *(FutureOr<void> Function())*  
  Callback triggered when the increment button is pressed. Read the new value from your own state/controller inside the callback. May return a `Future`; if it does, the widget awaits it and shows a loading indicator while pending (see [Async / Loading State](#async--loading-state)). Not triggered once `value` reaches `maxValue` — see `onMaxValueReached`.

- **`onDecrement`**: *(FutureOr<void> Function())*  
  Callback triggered when the decrement button is pressed. Same read-the-new-value and async/loading semantics as `onIncrement`. Not triggered once `value` reaches `minValue` — see `onMinValueReached`.

- **`onMaxValueReached`** / **`onMinValueReached`**: *(VoidCallback?)*  
  Called instead of `onIncrement`/`onDecrement` when a tap is blocked at `maxValue`/`minValue` (for `onMinValueReached`, since the widget collapses back to its "Add" state at `minValue`, this fires on the decrement that lands there instead).

- **`enabled`**: *(bool, default `true`)*  
  When `false`, both controls are disabled and the widget is rendered at reduced opacity.

- **`errorText`**: *(String?)*  
  Optional message rendered below the widget in the theme's error color.

- **`enableLongPressRepeat`**: *(bool, default `false`)* and **`longPressRepeatInterval`**: *(Duration, default 150ms)*  
  When enabled, press-and-hold on increment/decrement repeats the action on an interval until release or a bound is hit.

- **`loadingIndicator`**: *(Widget?)*  
  Shown in place of the counter row while an async `onIncrement`/`onDecrement` call is pending. Defaults to a small `CircularProgressIndicator`.

- **`incrementSemanticLabel`** / **`decrementSemanticLabel`** / **`addSemanticLabel`**: *(String)*  
  Screen-reader labels for the increment/decrement/initial "Add" controls.

- **`counterSemanticLabelBuilder`**: *(String Function(int value)?)*  
  Builds the screen-reader label announced for the current value. Defaults to `'Quantity: $value'`.

- **`initialText`**: *(Text?)*  
  Text displayed in the initial state.

- **`counterTextStyle`**: *(TextStyle?)*  
  Style for the counter text.

- **`duration`**: *(Duration?)*  
  Duration for the animations.

- **`initialBoxDecoration`**: *(BoxDecoration?)*  
  Box decoration for the initial state.

- **`counterBoxDecoration`**: *(BoxDecoration?)*  
  Box decoration for the counter state.

- **`incrementIcon`**: *(Icon?)*  
  Icon for the increment button.

- **`decrementIcon`**: *(Icon?)*  
  Icon for the decrement button.

- **`height`**: *(double)*  
  Height of the widget.

- **`width`**: *(double)*  
  Width of the widget.

- **`heightScaleFactor`**: *(double)*  
  Scale factor for height during the counter state.

- **`widthScaleFactor`**: *(double)*  
  Scale factor for width during the counter state.

- **`minValue`**: *(int)*  
  Minimum value allowed for the counter.

- **`maxValue`**: *(int)*  
  Maximum value allowed for the counter.

The increment/decrement slide animation automatically respects `Directionality` — it flips direction under RTL locales with no extra configuration.

Style defaults for every `AddToCart` in your app can also be set once via `AddToCartThemeData`, registered in `ThemeData.extensions` — see [Theming](#theming).

## Possibilities

### Basic Button:

The most basic button will increment and decrement the count by 1 with an animation after you
override the required functions. When count is 0, a standard 'ADD' Text is used as a placeholder.

```dart
// Default value of cart item
int value = 0;

@override
Widget build(BuildContext context) {
  return AddToCart(
    value: value,
    onIncrement: () {
      value++;
      setState(() {});
    },
    onDecrement: () {
      value--;
      setState(() {});
    },
    maxValue: 8,
  );
}
```

<img src="https://github.com/adiptdevtomar/add_to_cart_animated_button/blob/master/readme_resources/basic_button.gif?raw=true" width="300px">


### Expanding Button:

Moving on to where real animation shows up, you can animate the change in button size and it's
style when an item is added. Just provide the widget with both before and after BoxDecorations and watch the magic happen.

Use the `widthScaleFactor` and `heightScaleFactor` parameter to scale size of button after item is added.

```dart
int value = 0;

@override
Widget build(BuildContext context) {
  return AddToCart(
    value: value,
    onIncrement: () {
      // New Increased Value
      value++;
      setState(() {});
    },
    onDecrement: () {
      // New Decreased Value
      value--;
      setState(() {});
    },
    width: 80,
    widthScaleFactor: 1.7,
    duration: Duration(milliseconds: 100),
    initialBoxDecoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Color.fromRGBO(74, 132, 44, 1),
        width: 2,
      ),
    ),
    initialText: Text(
      'ADD',
      style: TextStyle(
        color: Color.fromRGBO(74, 132, 44, 1),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    maxValue: 8,
  );
}
```

<img src="https://github.com/adiptdevtomar/add_to_cart_animated_button/blob/master/readme_resources/expanding_button.gif?raw=true" width="300px">


### Plus Button:

Change the default 'ADD' Text to any other widget, like in this example where a Plus Button is used as a placeholder which later expands into a counter widget.

Setting the initial `height` and `width` of the button to form a square.

```dart
int value = 0;

@override
Widget build(BuildContext context) {
  return AddToCart(
    value: value,
    onIncrement: () {
      // New Increased Value
      value++;
      setState(() {});
    },
    onDecrement: () {
      // New Decreased Value
      value--;
      setState(() {});
    },
    width: 40,
    height: 40,
    heightScaleFactor: 1.2,
    widthScaleFactor: 3.4,
    duration: Duration(milliseconds: 100),
    initialBoxDecoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Color.fromRGBO(74, 132, 44, 1),
        width: 2,
      ),
    ),
    initialText: Text(
      '+',
      style: TextStyle(
        color: Color.fromRGBO(74, 132, 44, 1),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    maxValue: 8,
  );
}
```

<img src="https://github.com/adiptdevtomar/add_to_cart_animated_button/blob/master/readme_resources/plus_button.gif?raw=true" width="300px">


### Custom Styling:

Experiment with colors, styles, and decorations to bring your animations to life and making Add to Cart action for a user fun.

Add custom SnackBar handling on `onMaxValueReached` and many more!

Code for this can be found in the [example](https://github.com/adiptdevtomar/add_to_cart_animated_button/tree/master/example) project

<img src="https://github.com/adiptdevtomar/add_to_cart_animated_button/blob/master/readme_resources/styling.gif?raw=true" width="300px">


### Async / Loading State

`onIncrement`/`onDecrement` may return a `Future`. While it's pending, the widget shows a built-in loading indicator and ignores further taps — handy for confirming a change with a server before committing to it.

```dart
int value = 0;

@override
Widget build(BuildContext context) {
  return AddToCart(
    value: value,
    onIncrement: () async {
      await cartApi.increment(); // your own async call
      setState(() => value++);
    },
    onDecrement: () async {
      await cartApi.decrement();
      setState(() => value--);
    },
    maxValue: 8,
  );
}
```

### Controller-based Usage

Use `AddToCart.controller` with an `AddToCartController` (a `ValueNotifier<int>`) when you want to drive or reset the count imperatively from outside the widget — no `setState` plumbing required. The widget itself advances the controller's value once `onIncrement`/`onDecrement` resolve; only mutate the controller directly for out-of-band changes like resets.

```dart
final controller = AddToCartController();

@override
void dispose() {
  controller.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      AddToCart.controller(
        controller: controller,
        onIncrement: () {},
        onDecrement: () {},
        maxValue: 8,
      ),
      TextButton(
        onPressed: () => controller.reset(),
        child: const Text('Reset from parent'),
      ),
    ],
  );
}
```

### Theming

Register `AddToCartThemeData` once via `ThemeData.extensions` to set defaults for every `AddToCart` in your app. Explicit constructor parameters always take precedence over the theme.

```dart
MaterialApp(
  theme: ThemeData(
    extensions: const [
      AddToCartThemeData(
        counterBoxDecoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ],
  ),
  home: const HomePage(),
);
```

## Bugs or Requests
If you encounter any problems feel free to open an issue. If you feel the library is missing a feature, please raise a ticket on GitHub and i'll look into it.

