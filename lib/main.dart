import 'package:flutter/material.dart';

import 'screens/new_game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MathIsEasy',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: NewGamePage(title: 'MathIsEasy'),
    );
  }
}
