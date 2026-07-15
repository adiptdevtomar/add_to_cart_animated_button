import 'package:example/buttons_type/basic_button.dart';
import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: BasicButton(),
      ),
    );
  }
}
