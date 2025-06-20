import '../../flutter_screens.dart';

class ScreensView extends StatelessWidget {
  const ScreensView(this.controller, {super.key});

  final Screens controller;

  @override
  Widget build(BuildContext context) {
    // print('Building listener');
    return ListenableBuilder(
      listenable: controller,
      builder: _buildNavigator,
    );
  }

  Widget _buildNavigator(BuildContext context, Widget? child) {
    // print('Building navigator');
    return Navigator(
      pages: controller.pages,
      onDidRemovePage: _onDidRemovePage,
    );
  }

  void _onDidRemovePage(Page page) {
    // print('in _onDidRemovePage: page ${page.runtimeType}');
    if (page is ScreenPage) {
      final screen = page.screen;
      // log.debug('$f: screen is $screen');
      screen.close();
      controller.remove(screen);
    }
  }
}
