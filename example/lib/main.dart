import 'package:example/buttons_type/basic_button.dart';
import 'package:example/buttons_type/custom_styling.dart';
import 'package:example/buttons_type/expanding_button.dart';
import 'package:example/buttons_type/plus_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
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
                ExpandingButton(),
                SizedBox(
                  height: 20,
                ),
                PlusButton(),
                SizedBox(
                  height: 20,
                ),
                CustomStyling(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
