import 'package:flutter/material.dart';
import 'package:shop/ui/widgets/auth/auth_widget.dart';
import 'package:shop/ui/widgets/home/home_screen.dart';
import 'package:shop/ui/widgets/auth/loader_widget.dart';
import 'package:shop/ui/widgets/product_list/product_list_screen.dart';

abstract class MainNavigationRouteNames {
  static const loader = 'loader';
  static const auth = 'auth';
  static const home = '/';
  static const productList = '/product_list';
}

class MainNavigation {
  static void showLoader(BuildContext context) =>
      Navigator.of(context).pushNamedAndRemoveUntil('loader', (_) => false);

  static Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.loader:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              LoaderWidget.create(),
          transitionDuration: Duration.zero,
        );
      case MainNavigationRouteNames.auth:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              AuthWidget.create(),
          transitionDuration: Duration.zero,
        );
      case MainNavigationRouteNames.home:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              HomeScreen(),
          transitionDuration: Duration.zero,
        );
      case MainNavigationRouteNames.productList:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              ProductListScreen(),
          transitionDuration: Duration.zero,
        );
      default:
        const widget = Text('Navigation error');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.loader,
          (route) => false,
    );
  }
}