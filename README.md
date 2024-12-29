# add_to_cart_animation_button

Add to Cart Button with Animation and Custom Styling for Modern Shopping apps like experience.

See the [install instructions](https://www.google.com).

## Preview with Usage

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

### Outlined Button:

Moving on to where real animation shows up, you can animate the change in button size and it's
style when an item is added. Just provide the widget with both before and after BoxDecorations and watch the magic happen.

```dart

int value = 0;

@override
Widget build(BuildContext context) {
  return AddToCart(
    value: value,
    onIncrement: (newValue) {
      // New Increased Value
      value = newValue;
      setState(() {});
    },
    onDecrement: (newValue) {
      // New Decreased Value
      value = newValue;
      setState(() {});
    },
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

![Basic Button](readme_resources/outlined_button.gif)