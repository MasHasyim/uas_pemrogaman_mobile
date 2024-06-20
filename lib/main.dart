import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(GoalGlideApp());
}

class GoalGlideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoalGlide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
