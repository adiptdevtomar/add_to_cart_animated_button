import 'package:example/buttons_type/add_button.dart';
import 'package:example/buttons_type/basic_button.dart';
import 'package:example/buttons_type/expanding_button.dart';
import 'package:example/buttons_type/outline_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              BasicButton(),
              SizedBox(
                height: 20,
              ),
              OutlineButton(),
              SizedBox(
                height: 20,
              ),
              ExpandingButton(),
              SizedBox(
                height: 20,
              ),
              AddButton(),
            ],
          ),
        ),
      ),
    );
  }
}
