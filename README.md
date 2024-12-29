# add_to_cart_animation_button

Add to Cart Button with Animation and Custom Styling for Modern Shopping apps like experience.

See the [install instructions](https://www.google.com).

## Preview with Usage

Basic Button:

The most basic button will increment and decrement the count by 1 with an animation after you override the required functions. When count is 0, a standard 'ADD' Text is used as a placeholder.

```dart
// Default value of cart item
int value = 0;

@override
Widget build(BuildContext context) {
  return AddToCart(
    value: value,
    onIncrement: (newValue) {
      value = newValue;
      setState(() {});
    },
    onDecrement: (newValue) {
      value = newValue;
      setState(() {});
    },
    maxValue: 8,
  );
}
```

![Basic Button](readme_resources/basic_button.gif)