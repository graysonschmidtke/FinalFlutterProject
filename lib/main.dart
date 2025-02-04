import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(HappyBird2App());

class HappyBird2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HappyBird2App',
      home: HomePage(),
    );
  }

}