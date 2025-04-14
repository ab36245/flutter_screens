import 'package:flutter/widgets.dart';

import '../screen/screen.dart';

import 'view.dart';

class Screens<S extends Screen> with ChangeNotifier {
  Screens(S init) {
    _stack.add(init);
  }

  Iterable<S> get bottomUp => _stack;

  List<Page> get pages => _stack.map((s) => s.page).toList();

  S get top => _stack.last;

  Iterable<S> get topDown => _stack.reversed;

  Widget get view => ScreensView(this);

  T add<T extends S>(T screen) {
    if (_stack.contains(screen)) {
      // log.debug('screen $screen already in the stack');
    } else {
      _stack.add(screen);
      // log.debug('added screen $screen to top of stack');
      notifyListeners();
    }
    return screen;
  }

  void remove(S screen) {
    if (_stack.remove(screen)) {
      // log.debug('removed screen $screen from stack');
      notifyListeners();
    } else {
      // log.debug('screen $screen is already not in the stack');
    }
  }

  void replaceAll<T extends S>(Iterable<T> screens) {
    _stack.clear();
    _stack.addAll(screens);
    notifyListeners();
  }

  final _stack = <S>[];
}
