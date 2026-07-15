import 'package:add_to_cart_animated_button/add_to_cart_animated_button.dart';
import 'package:flutter/material.dart';

class CustomStyling extends StatefulWidget {
  const CustomStyling({super.key});

  @override
  State<CustomStyling> createState() => _CustomStylingState();
}

class _CustomStylingState extends State<CustomStyling> {
  // Default value of cart item
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return AddToCart(
      value: value,
      onIncrement: () {
        // New Increased Value
        value = value + 1;
        setState(() {});
      },
      onDecrement: () {
        // New Decreased Value
        value = value - 1;
        setState(() {});
      },
      onMaxValueReached: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Max quantity Reached for this products.'),
          ),
        );
      },
      width: 180,
      height: 60,
      counterTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      heightScaleFactor: 1.2,
      widthScaleFactor: 3.4,
      incrementIcon: Icon(
        Icons.arrow_upward,
        size: 25,
        color: Colors.white,
      ),
      decrementIcon: Icon(
        Icons.arrow_downward,
        size: 25,
        color: Colors.white,
      ),
      duration: Duration(milliseconds: 100),
      initialBoxDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color.fromRGBO(221, 81, 115, 1),
          width: 2,
        ),
      ),
      counterBoxDecoration: BoxDecoration(
        color: Color.fromRGBO(221, 81, 115, 1),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color.fromRGBO(221, 81, 115, 1),
          width: 2,
        ),
      ),
      initialText: Text(
        'ADD TO CART',
        style: TextStyle(
          color: Color.fromRGBO(221, 81, 115, 1),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      maxValue: 2,
    );
  }
}
