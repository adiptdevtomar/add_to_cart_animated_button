import 'package:add_to_cart_animated_button/add_to_cart_animated_button.dart';
import 'package:flutter/material.dart';

class ExpandingButton extends StatefulWidget {
  const ExpandingButton({super.key});

  @override
  State<ExpandingButton> createState() => _ExpandingButtonState();
}

class _ExpandingButtonState extends State<ExpandingButton> {
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
}
