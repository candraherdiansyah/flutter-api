import 'package:flutter/material.dart';
import 'package:flutter_api/screens/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Belajar API",
      // home: ListScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(),
      },
    );
  }
}
