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
          // Simulates an API call before confirming the change -- the
          // widget shows its built-in loading indicator and ignores
          // further taps until this resolves.
          onIncrement: () async {
            await Future.delayed(const Duration(milliseconds: 600));
            value.updateCount(value.count + 1);
          },
          onDecrement: () async {
            await Future.delayed(const Duration(milliseconds: 600));
            value.updateCount(value.count - 1);
          },
          // A custom loader in place of the default CircularProgressIndicator.
          loadingIndicator: const SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.amber,
            ),
          ),
          maxValue: 8,
        );
      },
    );
  }
}