import 'dart:ui';

import 'package:bible_trivia/application/theme/colors.dart';
import 'package:bible_trivia/presentation/router/router_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: TextTheme(bodyText2: TextStyle(color: white))),
      // home: Dashboard(),
      onGenerateRoute: RouterNavigator.generateRoute,
    );
  }
}
