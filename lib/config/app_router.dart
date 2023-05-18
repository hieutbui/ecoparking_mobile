import 'package:ecoparking_mobile/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case "/":
        return HomeScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('error'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
