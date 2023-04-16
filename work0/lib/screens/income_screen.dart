// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/wallet.dart';
import '../widgets/my_text_field.dart';


class IncomesScreen extends StatefulWidget {
  const IncomesScreen({super.key});

  @override
  State<IncomesScreen> createState() => _IncomesScreenState();
}

class _IncomesScreenState extends State<IncomesScreen> {
  late Isar isar;

  List<Category> categories = [];
  List<Income> incomes = [];
  bool addMode = true;
  String name = "";
  double amount = 0.0;
  int? category;
  int order = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController orderController = TextEditingController();

  addIncome() async {
    final newIncome = Income()
      ..name = name
      ..amount = amount
      ..category = category
      ..order = order;
      //..source = source
      //..note = note;


    await isar.writeTxn(() async {
      await isar.incomes.put(newIncome);

      getIncomes();
    });
  }

  getIncomes() async {
    incomes = await isar.incomes.where().sortByAmount().findAll();
    setState(() {});
  }

  removeIncome(int incomeId) async {
    await isar.writeTxn(() async {
      bool result = await isar.incomes.delete(incomeId);
      if (result) {
        getIncomes();
        addMode = true;
        setState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Ürün silinemedi.'),
        ));
      }
    });
  }

  void _showAlertDialog(BuildContext context, int incomesId) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Onay'),
        content: const Text('ürünü silmek istediğinizden emin misiniz?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Hayır'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              removeIncome(incomesId);
            },
            child: const Text('Evet'),
          ),
        ],
      ),
    );
  }

  List<Widget> incomesWidgets() {
    if (incomes.isEmpty) {
      return [Center(child: Text('Ürün Bulunamadi.'))];
    } else {
      return incomes
          .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.name!),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              addMode = false;
                              name = e.name!;
                              order = e.order;
                              nameController =
                                  TextEditingController(text: e.name!);
                              orderController = TextEditingController(
                                  text: e.order.toString());
                              setState(() {});
                            },
                            child: Icon(Icons.edit)),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _showAlertDialog(context, e.id);
                            },
                            child: Icon(Icons.delete)),
                      ],
                    ),
                  ],
                ),
              ))
          .toList();
    }
  }

  getCategories() async {
    categories = await isar.categorys.where().sortByOrder().findAll();
    setState(() {});
  }

  categoriesList() {
    return categories.map((e) {
      return DropdownMenuItem<int>(value: e.id, child: Text(e.categoryName!));
    }).toList();
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gelir - Gider Adı'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    getCategories();
                  },
                  icon: Icon(Icons.refresh)),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text('    Gelir Gider Adı:'),
              SizedBox(height: 8),
              MyTextField(
                label: 'Gelir - Gider Adı',
                hint: 'Gelir - Gider Adı',
                controller: nameController,
                //icon: Icon(Icons.text_fields),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 8),
              Text('    Miktar:'),
              SizedBox(height: 8),
              MyTextField(
                label: "Miktar",
                hint: 'Miktar',
                //icon: Icon(Icons.money),
                controller: amountController,
                onChanged: (value) {
                  try {
                    if (value.isNotEmpty) {
                      amount = double.parse(value);
                      setState(() {});
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Miktar sayı olması gerekli.')));
                  }
                },
              ),
              SizedBox(height: 8),
              Text('    Kategori:'),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<int>(
                        items: categoriesList(),
                        onChanged: (_) {
                          setState(() {
                            category = _;
                          });
                        },
                        value: category,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text('    Siralama: '),
              SizedBox(height: 8),
              MyTextField(
                label: "Gelir Gider Sıralama",
                hint: 'Gelir Gider Sıralama',
                controller: orderController,
                //icon: Icon(Icons.sort),
                number: true,
                onChanged: (value) {
                  try {
                    if (value.isNotEmpty) {
                      order = int.parse(value);
                    } else {
                      order = 0;
                    }
                    setState(() {});
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Sıralama sayı olması gerekli.')));
                  }
                },
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            addIncome();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                Text('Ekle'),
                              ],
                            ),
                          ))),
                ],
              ),
              SizedBox(height: 18),
              Expanded(
                  child: ListView(
                children: incomesWidgets(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
