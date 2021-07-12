import 'package:bible_trivia/presentation/pages/quize.dart';
import 'package:bible_trivia/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<Quizzler>(builder: (context) => Quizzler());

      case quizePageRoute:
        return MaterialPageRoute<Quizzler>(builder: (context) => Quizzler());

      default:
        return MaterialPageRoute<Quizzler>(builder: (context) => Quizzler());
    }
  }
}
