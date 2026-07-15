import 'package:example/buttons_type/basic_button.dart';
import 'package:example/buttons_type/custom_styling.dart';
import 'package:example/buttons_type/expanding_button.dart';
import 'package:example/buttons_type/plus_button.dart';
import 'package:example/inherited/base_value.dart';
import 'package:example/inherited/test_screen.dart' show TextScreen;
import 'package:example/test/animation_example.dart' show AnimationExample;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BaseValue(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              ExpandingButton(),
              SizedBox(
                height: 20,
              ),
              PlusButton(),
              SizedBox(
                height: 20,
              ),
              CustomStyling(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TextScreen(),
                    ),
                  );
                },
                child: Text('Inherited Test'),
              ),
              SizedBox(
                height: 20,
              ),
              AnimationExample(),
            ],
          ),
        ),
      ),
    );
  }
}
