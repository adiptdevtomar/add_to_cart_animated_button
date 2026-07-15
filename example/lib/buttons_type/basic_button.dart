import 'package:add_to_cart_animated_button/add_to_cart_animated_button.dart';
import 'package:example/inherited/base_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<BaseValue>(
      builder: (context, value, child) {
        return AddToCart(
          value: value.count,
          onIncrement: () {
            // New Increased Value
            value.updateCount(value.count + 1);
          },
          onDecrement: () {
            // New Decreased Value
            value.updateCount(value.count - 1);
          },
          maxValue: 8,
        );
      },
    );
  }
}