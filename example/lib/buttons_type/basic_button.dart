import 'package:add_to_cart_animated_button/add_to_cart_animated_button.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatefulWidget {
  const BasicButton({super.key});

  @override
  State<BasicButton> createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {

  // Default value of cart item
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
      maxValue: 8,
    );
  }
}
