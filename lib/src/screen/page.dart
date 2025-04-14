import 'package:flutter/material.dart';

import 'screen.dart';
import 'transition.dart';

class ScreenPage extends Page {
  ScreenPage(this.screen) : super(key: screen.key);

  final Screen screen;

  @override
  Route createRoute(BuildContext context) =>
    switch (screen.transition) {
      ScreenTransition.dialog =>
        DialogRoute(
          barrierColor: Colors.black45,
          barrierDismissible: true,
          builder: (_) => screen.view,
          context: context,
          settings: this,
        ),

      ScreenTransition.fade =>
        PageRouteBuilder(
          fullscreenDialog: true,
          pageBuilder: (_, __, ___) => screen.view,
          settings: this,
          transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        ),
        
      ScreenTransition.standard =>
        MaterialPageRoute(
          builder: (_) => screen.view,
          fullscreenDialog: true,
          settings: this,
        ),
    };
}
