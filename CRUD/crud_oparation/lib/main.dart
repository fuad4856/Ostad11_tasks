import 'package:flutter/material.dart';
import 'package:crud_oparation/screens/home_screen.dart';

void main() {
  runApp(CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue
      ),
      home: HomeScreen(),
    );
  }
}