import 'package:flutter/material.dart';
import 'package:frontend/views/pages/home.dart';
import 'package:frontend/views/pages/login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: LoginPage(),
    );
  }
}
