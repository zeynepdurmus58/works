// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  late Isar isar;

  TextEditingController nameController = TextEditingController();
  TextEditingController orderController = TextEditingController();

  bool addMode = true;
  String name = "";
  int order = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Text("      Kategori Adı: "),
          SizedBox(
            height: 8,
          ),
           TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.abc),
              hintText: 'Kategori Adı',
              labelText: 'Kategori',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          )
        ],
      ),
    );
  }
}
 