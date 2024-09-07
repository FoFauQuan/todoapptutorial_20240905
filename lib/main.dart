import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapptutorial_20240905/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDoApp',
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}


