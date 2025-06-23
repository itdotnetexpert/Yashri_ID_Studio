import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(YashriIDStudioApp());
}

class YashriIDStudioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yashri ID Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(),
    );
  }
}