// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, empty_catches, unused_local_variable

import 'package:flutter/cupertino.dart';
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

  TextEditingController nameController = TextEditingController();
  TextEditingController orderController = TextEditingController();

  bool addMode = true;
  String name = "";
  int order = 0;

  List<Category> categories = [];

  addCategory() async {
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text('Kategori adı girmeniz gerekiyor'),
      ));
    } else {
      final newCategory = Category()
        ..categoryName = name
        ..order = order;

      await isar.writeTxn(() async {
        await isar.categorys.put(newCategory);

        nameController = TextEditingController(text: "");
        orderController = TextEditingController(text: "0");
        setState(() {});
      });

      getCategories();
    }
  }

  getCategories() async {
    categories = await isar.categorys.where().sortByOrder().findAll();
    setState(() {});
  }

  removeCategory(int categoryId) async {
    int incomeCount =
        await isar.incomes.filter().categoryEqualTo(categoryId).count();

    if (incomeCount > 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text('Geliri olan kategoriyi silemezsiniz.'),
      ));
      return;
    }

    await isar.writeTxn(() async {
      bool result = await isar.categorys.delete(categoryId);
      if (result) {
        getCategories();
        addMode = true;
        setState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Kategori silinemedi.'),
        ));
      }
    });
  }

  void _showAlertDialog(BuildContext context, int categoryId) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Onay'),
        content: const Text('Kategorini silmek istediğinizden emin misiniz?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Hayır'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              removeCategory(categoryId);
            },
            child: const Text('Evet'),
          ),
        ],
      ),
    );
  }

  List<Widget> categoriesWidget() {
    if (categories.isEmpty) {
      return [Center(child: Text("Kategori bulunamadı"))];
    } else {
      return categories
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.categoryName!),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            addMode = false;
                            name = e.categoryName!;
                            order = e.order;
                            nameController =
                                TextEditingController(text: e.categoryName!);
                            orderController =
                                TextEditingController(text: e.order.toString());
                            setState(() {});
                          },
                          child: Icon(Icons.edit)),
                      SizedBox(width: 5),
                      ElevatedButton(
                          onPressed: () {
                            _showAlertDialog(context, e.id);
                          },
                          child: Icon(Icons.delete)),
                    ],
                  ),
                ],
              ),
            ),
          )
          .toList();
    }
  }

  openConnection() async {
    try {
      isar = await Isar.open([CategorySchema, IncomeSchema]);
      getCategories();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                getCategories();
              },
              icon: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          //kategori adı
          SizedBox(height: 8),
          MyTextField(
            hint: "Kategori",
            label: "Kagetgori Adı",
            controller: nameController,
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          SizedBox(height: 8),
          //sıralama
          MyTextField(
            hint: "Sıralama",
            label: "Sıralama ",
            controller: orderController,
            number: true,
            onChanged: (value) {
              try {
                //order = int.parse(value);
                //setState(() {});
                if (value.isEmpty) {
                  order = 0;
                } else {
                  order = int.parse(value);
                }
                setState(() {});
              } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Siralama Sayi olmasi gerekiyor.'),
                  ));
                }
            },
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        addCategory();
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
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: categoriesWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
