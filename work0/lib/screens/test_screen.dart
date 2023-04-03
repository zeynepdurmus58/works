import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:work0/db/user.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Isar isar;

  addUser(String name, String motherName, String fatherName, int age, String birthPlace, String phone) async {
    

    //veritabanı işlemleri burda yapılacak

    final newUser = User()
      ..name = name
      ..fatherName = fatherName
      ..motherName = motherName
      ..age = age
      ..birthPlace = birthPlace
      ..phone = phone;

      await isar.writeTxn(() async => await isar.users.put(newUser));

    //isar.close();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("kullanıcı eklendi")));
  }

  openConnection() async {
    isar = await Isar.open([UserSchema]);
    setState(() {});
  }

  closeConnection() async {
    await isar.close();
  }

    @override
  void initState() {
    print("ekran çalıştı");
    openConnection();
    super.initState();
  }

  @override
  void dispose() {
    print("ekran kapandı");
    closeConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => addUser(
                  "Zeynep Durmuş", "X", "Y", 20, "İstanbul", "5580585858"),
              child: Text("ekle")),
        ],
      ),
    );
  }
}
