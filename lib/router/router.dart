import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:figwp/mvoas/view/home/home_page.dart';
import 'package:figwp/mvoas/view/welcome/welcome_page.dart';
import 'package:figwp/playground/playground.dart';

class Router {
  static Route generator(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomePage(),
        );
      case RouteName.playground:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => GriffelPlayground(),
        );
      case RouteName.welcome:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => WelcomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => WelcomePage(),
        );
    }
  }
}

class RouteName {
  static const homePage = '/';
  static const playground = 'playground';
  static const welcome = 'welcome';
}
