import 'package:flutter/widgets.dart';

import 'screen.dart';
import 'value.dart';

abstract class ScreenView<S extends Screen> extends StatelessWidget {
  const ScreenView(this.screen, {
    super.key,
  });

  final S screen;

  Widget buildListener({
    required WidgetBuilder builder,
  }) =>
    ListenableBuilder(
      builder: (context, _) => builder(context),
      listenable: screen,
    );

  Widget buildValue({
    required ScreenValue value,
    required Widget Function(BuildContext context, ScreenValue value) builder,
  }) =>
    ListenableBuilder(
      builder: (context, _) => builder(context, value),
      listenable: value,
    );
}