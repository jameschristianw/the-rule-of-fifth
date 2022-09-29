import 'package:flutter/material.dart';
import 'package:the_rule_of_fifth/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Rule of Fifth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.amber),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.black),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
