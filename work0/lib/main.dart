// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:work0/screens/calendar_screen.dart';
import 'package:work0/screens/categories_screen.dart';
import 'package:work0/screens/home_screen.dart';
import 'package:work0/screens/income_screen.dart';
import 'package:work0/screens/test_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);



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
        '/categories' :(context) => CategoriesScreen(),
        '/incomes' :(context) => IncomesScreen(),
        '/calendar' :(context) => CalendarScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}