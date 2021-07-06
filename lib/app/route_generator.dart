import 'package:flutter/material.dart';
import 'package:fl_mvvm_riverpod/app/ui/home/home_view.dart';
import 'package:fl_mvvm_riverpod/app/ui/splash_view.dart';
import 'package:fl_mvvm_riverpod/app/ui/welcome_view.dart';
import 'package:fl_mvvm_riverpod/utils/console_logger.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routeName = settings.name;
    final args = settings.arguments;

    CLog.simple.logInfo("RouteName: $routeName | RouteGenerator.generateRoute: arguments: $args");

    switch (routeName) {
      case RoutePaths.splashView:
        return MaterialPageRoute(builder: (context) => SplashView());
      case RoutePaths.welcomeView:
        return MaterialPageRoute(builder: (context) => WelcomeView());
      case RoutePaths.homeView:
        return MaterialPageRoute(builder: (context) => HomeView());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Column(
              children: [
                Center(
                  child: Text("That page route can't be found!"),
                )
              ],
            ),
          ),
        );
    }
  }
}

class RoutePaths {
  static const String splashView = '/';
  static const String homeView = '/home_view';
  static const String welcomeView = '/welcome_view';
  static const all = <String>{
    splashView,
    homeView,
    welcomeView,
  };
}