// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 155, 52),
        leading: Icon(Icons.access_alarm_sharp),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("Assistant")),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/test'),
                  child: CategoryWidget(
                    category: "users",
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/categories'),
                  child: CategoryWidget(
                    category: "Kategoriler"
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/incomes'),
                  child: CategoryWidget(
                    category: "Gelir - Gider"
                  ),
                ),
                CategoryWidget(
                  category: "category4"
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
