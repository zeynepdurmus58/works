// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:work0/screens/dateTime_screen.dart';
import 'package:work0/screens/categories_screen.dart';
import 'package:work0/screens/dateListPicker_screen.dart';
import 'package:work0/screens/home_screen.dart';
import 'package:work0/screens/income_screen.dart';
import 'package:work0/screens/test_screen.dart';
import 'package:go_router/go_router.dart';

import 'screens/datePicker_screen.dart';
import 'screens/rangePicker_screen.dart';

void main() {
  runApp(const MyApp());
}

// GoRouter configuration
/* final _router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) => TestScreen(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => CategoriesScreen(),
    ),
    GoRoute(
      path: '/incomes',
      builder: (context, state) => IncomesScreen(),
    ),
    GoRoute(
      path: '/datetime',
      builder: (context, state) => DateTimeScreen(),
    ),
    GoRoute(
      path: '/datepicker',
      builder: (context, state) => DatePicker(),
    ),
    GoRoute(
      path: '/rangepicker',
      builder: (context, state) => RangePicker(),
    ),
    GoRoute(
      path: '/datelistpicker',
      builder: (context, state) => DateListPicker(),
    ),
  ],
); */



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
        '/datetime' :(context) => DateTimeScreen(),
        '/datepicker' :(context) => DatePicker(),
        '/rangepicker' :(context) => RangePicker(),
        '/datelistpicker' :(context) => DateListPicker(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}