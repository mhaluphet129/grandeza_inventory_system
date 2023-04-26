import 'package:flutter/material.dart';
import 'package:grandeza_inventory_system/utilities/initialize.dart';
import 'package:grandeza_inventory_system/screens/user/auth.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Initialize());
      case '/auth':
        return MaterialPageRoute(builder: (_) => Auth());

      default:
        return _error404();
    }
  }

  static Route<dynamic> _error404() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error in the App.'),
        ),
      );
    });
  }
}
