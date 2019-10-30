import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_hub/character/character_page.dart';
import 'package:rick_and_morty_hub/home/home.dart';
import 'route_path.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var data = settings.arguments;

    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(
          settings: RouteSettings(name: HOME),
          builder: (_) => Home(),
        );
      case CHARACTER:
        return MaterialPageRoute(
          settings: RouteSettings(name: CHARACTER),
          builder: (_) => Character(data),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
