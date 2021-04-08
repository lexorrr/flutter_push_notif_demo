import 'package:flutter/material.dart';
import 'package:flutter_push_notif_demo/main.dart';

class RouteGenerator {
  RouteGenerator._();

  static const String homePage = '/';

  // Expose a key to use a navigator without a context
  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );

      default:
        throw FormatException('Route not found');
    }
  }

}