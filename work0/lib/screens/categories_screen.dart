// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/wallet.dart';
import '../widgets/my_text_field.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  late Isar isar;

  openConnection() async {
    try {
      isar = await Isar.open([CategorySchema]);
    } catch (e) {}
    setState(() {});
  }

  closeConnection() async {
    try {
      await isar.close();
    } catch (e) {}
    //setState(() {});
  }

  @override
  void initState() {
    openConnection();
    super.initState();
  }

  @override
  void dispose() {
    closeConnection();
    super.dispose();
  }

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
          //Text("      Kategori Adı: "),
          SizedBox(
            height: 8,
          ),
           MyTextField(
            hint: "Kategori",
            label: "Kagetgori Adı",
            onChanged: (value) {
              name = value;
            },
           ),
            SizedBox(
            height: 8,
          ),
          MyTextField(
            hint: "Sıralama",
            label: "Sıralama ",
            onChanged: (value) {
              try {
                if(value.isEmpty) {
                  order = 0;
                } else {
                  order = int.parse(value);
                }
                order = int.parse(value);
                setState(() {});
              } catch(e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sıralama sayı olması gerekiyor")));
              }
            },
           ),
          SizedBox(height: 18,),
          Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          //addCategory();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              Text(addMode ? 'Ekle' : 'Düzenle'),
                            ],
                          ),
                        ))),
                SizedBox(width: 5.0),
                !addMode
                    ? Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              addMode = true;
                              setState(() {});
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.cancel),
                                  Text('Iptal'),
                                ],
                              ),
                            )))
                    : SizedBox(),
              ],
            ),
        ],
      ),
    );
  }
}


 