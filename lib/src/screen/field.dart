import 'package:flutter/material.dart';

import 'screen.dart';

class ScreenField {
  ScreenField(this._screen, [String value = ''])
    : controller = TextEditingController(text: value) {
      controller.addListener(_screen.updated);
    }

  final TextEditingController controller;

  bool get isEmpty => value.isEmpty;

  bool get isNotEmpty => value.isNotEmpty;

  String get value => controller.text;

  set value(String value) {
    controller.text = value;
  }

  operator <<(String value) =>
    this.value = value;

  final Screen _screen;
}
