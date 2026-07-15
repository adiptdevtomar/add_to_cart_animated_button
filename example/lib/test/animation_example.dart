import 'package:example/inherited/base_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseValue>(
      builder: (context, value, child) {
        return TextChange(value: value.count);
      },
    );
  }
}

class TextChange extends StatefulWidget {
  final int value;

  const TextChange({
    super.key,
    required this.value,
  });

  @override
  State<TextChange> createState() => _TextChangeState();
}

class _TextChangeState extends State<TextChange>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TextChange oldWidget) {
    if (oldWidget.value != widget.value){
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Text(
          widget.value.toString(),
          style: TextStyle(
            fontSize: _controller.value * 40,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
