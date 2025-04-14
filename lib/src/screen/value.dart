import 'package:flutter/widgets.dart';

import 'screen.dart';

class ScreenValue<T> extends ChangeNotifier {
  ScreenValue(this._screen, this._value);

  T get value => _value;

  set value(T value) {
    _value = value;
    notifyListeners();
    _screen.updated();
  }

  operator <<(T value) =>
    this.value = value;

  final Screen _screen;

  T _value;
}
