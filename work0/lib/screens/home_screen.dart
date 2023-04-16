// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../widgets/category_widget.dart';
import 'package:go_router/go_router.dart';

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
          //user - kategoriler
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //user ekranı
                InkWell(
                  onTap: () => GoRouter.of(context).push('/test'),
                  child: CategoryWidget(
                    category: "users",
                  ),
                ),
                //category ekranı
                InkWell(
                  onTap: () => GoRouter.of(context).push('/categories'),
                  child: CategoryWidget(
                    category: "Kategoriler"
                  ),
                ),
              ],
            ),
          ),
          //gelir,gider - dateTime
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //gelir gider ekranı
                InkWell(
                  onTap: () => GoRouter.of(context).push('/incomes'),
                  child: CategoryWidget(
                    category: "Gelir - Gider"
                  ),
                ),
                //date time ekranı
                InkWell(
                  onTap: () => GoRouter.of(context).push('/datetime'),
                  child: CategoryWidget(
                    category: "Date Time"
                  ),
                ),
              ],
            ),
          ),
          //Date Picker - Range Picker
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //date picker
                InkWell(
                  onTap: () => GoRouter.of(context).push('/datepicker'),
                  child: CategoryWidget(
                    category: "Date Picker"
                  ),
                ),
                //range picker
                InkWell(
                  onTap: () => GoRouter.of(context).push('/rangepicker'),
                  child: CategoryWidget(
                    category: "range picker"
                  ),
                ),
              ],
            ),
          ),
          //Date List Picker - Boş
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //date list picker
                InkWell(
                  onTap: () => GoRouter.of(context).push('/datelistpicker'),
                  child: CategoryWidget(
                    category: "Date List Picker"
                  ),
                ),
                //bos
                InkWell(
                  onTap: () => GoRouter.of(context).push('/rangepicker'),
                  child: CategoryWidget(
                    category: "bos"
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
