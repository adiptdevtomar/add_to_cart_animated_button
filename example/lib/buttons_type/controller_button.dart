import 'package:add_to_cart_animated_button/add_to_cart_animated_button.dart';
import 'package:flutter/material.dart';

class ControllerButton extends StatefulWidget {
  const ControllerButton({super.key});

  @override
  State<ControllerButton> createState() => _ControllerButtonState();
}

class _ControllerButtonState extends State<ControllerButton> {
  final AddToCartController _controller = AddToCartController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddToCart.controller(
          controller: _controller,
          onIncrement: () {},
          onDecrement: () {},
          maxValue: 8,
        ),
        TextButton(
          onPressed: () => _controller.reset(),
          child: const Text('Reset from parent'),
        ),
      ],
    );
  }
}
