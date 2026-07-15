import 'package:flutter/cupertino.dart';

class BaseValue extends ChangeNotifier {
  int count = 0;

  void updateCount(int value) {
    count = value;
    notifyListeners();
  }
}