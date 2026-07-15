import 'dart:async';

import 'package:add_to_cart_animated_button/add_to_cart_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) {
  return MaterialApp(home: Scaffold(body: Center(child: child)));
}

void main() {
  testWidgets(
      'onIncrement is never called once value reaches maxValue; '
      'onMaxValueReached fires instead', (tester) async {
    var incrementCalls = 0;
    var maxReachedCalls = 0;

    await tester.pumpWidget(_wrap(AddToCart(
      value: 3,
      maxValue: 3,
      onIncrement: () => incrementCalls++,
      onDecrement: () {},
      onMaxValueReached: () => maxReachedCalls++,
    )));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(incrementCalls, 0);
    expect(maxReachedCalls, 1);
  });

  testWidgets(
      'onMinValueReached fires on the decrement that lands on minValue, and '
      'the widget collapses back to its "Add" state once there', (tester) async {
    var decrementCalls = 0;
    var minReachedCalls = 0;

    await tester.pumpWidget(_wrap(AddToCart(
      value: 1,
      maxValue: 3,
      onIncrement: () {},
      onDecrement: () => decrementCalls++,
      onMinValueReached: () => minReachedCalls++,
    )));

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle();

    expect(decrementCalls, 1);
    expect(minReachedCalls, 1);

    // Simulate the parent applying the decrement (value now at minValue) --
    // the widget collapses back to its "Add" state, which sits on top of
    // (and intercepts taps ahead of) the now-invisible counter row.
    var incrementCalls = 0;
    await tester.pumpWidget(_wrap(AddToCart(
      value: 0,
      maxValue: 3,
      onIncrement: () => incrementCalls++,
      onDecrement: () => decrementCalls++,
      onMinValueReached: () => minReachedCalls++,
    )));
    await tester.pumpAndSettle();

    expect(find.text('ADD'), findsOneWidget);
    await tester.tap(find.text('ADD'));
    await tester.pumpAndSettle();

    expect(incrementCalls, 1);
    expect(decrementCalls, 1);
  });

  testWidgets(
      'a pending async onIncrement blocks a second tap until it resolves',
      (tester) async {
    var incrementCalls = 0;
    final completer = Completer<void>();

    await tester.pumpWidget(_wrap(AddToCart(
      value: 1,
      maxValue: 5,
      onIncrement: () {
        incrementCalls++;
        return completer.future;
      },
      onDecrement: () {},
    )));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    // Second tap while the first call is still pending must be ignored.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(incrementCalls, 1);

    completer.complete();
    await tester.pumpAndSettle();
  });

  testWidgets(
      'AddToCart.controller only advances controller.value after '
      'onIncrement resolves', (tester) async {
    final controller = AddToCartController(initialValue: 1);
    final completer = Completer<void>();
    addTearDown(controller.dispose);

    await tester.pumpWidget(_wrap(AddToCart.controller(
      controller: controller,
      maxValue: 5,
      onIncrement: () => completer.future,
      onDecrement: () {},
    )));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(controller.value, 1);

    completer.complete();
    await tester.pumpAndSettle();

    expect(controller.value, 2);
  });
}
