import 'package:add_to_cart_animated_button/add_to_cart_animated_button.dart';
import 'package:flutter/material.dart';

class PlusButton extends StatefulWidget {
  const PlusButton({super.key});

  @override
  State<PlusButton> createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
  // Default value of cart item
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return AddToCart(
      value: value,
      onIncrement: (newValue) {
        // No value increment when max value is reached
        if (newValue == value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Max quantity Reached for this products.'),
            ),
          );
          return;
        }

        // New Increased Value
        value = newValue;
        setState(() {});
      },
      onDecrement: (newValue) {
        // New Decreased Value
        value = newValue;
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
}
