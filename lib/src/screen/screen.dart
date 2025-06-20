import 'dart:async';

import 'package:flutter/widgets.dart';

import 'event.dart';
import 'field.dart';
import 'page.dart';
import 'transition.dart';
import 'value.dart';


abstract class Screen extends ChangeNotifier {
  @override
  String toString() => '$runtimeType$key';

  Stream<ScreenEvent> get events => _events.stream;

  final key = UniqueKey();

  ScreenPage get page => ScreenPage(this);

  ScreenTransition get transition => ScreenTransition.standard;

  Widget get view;

  void close([ScreenEvent? last]) {
    if (last != null) {
      event(last);
    }
    _events.close();
  }

  void event(ScreenEvent event) =>
    _events.add(event);

  ScreenField field([String initialValue = '']) =>
    ScreenField(this, initialValue);

  ScreenValue<T> value<T>(T initialValue) =>
    ScreenValue(this, initialValue);

  void updated() {
    notifyListeners();
  }

  Future<void> wait() async {
    await events.drain();
  }

  final _events = StreamController<ScreenEvent>();
}