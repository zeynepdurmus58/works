import 'package:flutter/material.dart';
import 'package:work0/screens/home_screen.dart';
import 'package:work0/screens/test_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home' :(context) => HomeScreen(),
        '/test' :(context) => TestScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}