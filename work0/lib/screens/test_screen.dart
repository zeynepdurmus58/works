// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, use_build_context_synchronously, unused_local_variable

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

  //List<Widget> userList = [];
  List<User> userList = [];

  addUser(String name, String motherName, String fatherName, int age,
      String birthPlace, String phone) async {
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

    getUsers();
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("kullanıcı eklendi")));
  }

//kullanıcı silme
  deleteUsers(int id) async {
    await isar.writeTxn(() async {
      bool result = await isar.users.delete(id);
      if (result) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("kullanıcı silindi")));
        getUsers();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("kullanıcı silme hatalı")));
      }
    });
  }

//kullanıcı güncelleme
  editUser(int id, String name, String motherName, String fatherName, int age,
      String birthPlace, String phone) async {
    //veritabanı işlemleri burda yapılacak

    final user = User()
      ..id = id
      ..name = name
      ..fatherName = fatherName
      ..motherName = motherName
      ..age = age
      ..birthPlace = birthPlace
      ..phone = phone;


    await isar.writeTxn(() async => await isar.users.put(user));

    //isar.close();

    getUsers();
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("kullanıcı eklendi")));
  }

  usersToWidget() {
    return userList
        .map(
          (e) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(e.name.toString()),
                SizedBox(
                  width: 5,
                ),
                Text(e.id.toString()),
                SizedBox(
                  width: 5,
                ),
                Text("Yaş: " + e.age.toString()),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    onPressed: () => deleteUsers(e.id),
                    child: Icon(Icons.delete)),
              ],
            ),
          ),
        )
        .toList();
  }

  getUsers() async {
    final users = await isar.users.where().findAll();
    userList = users;
    setState(() {});
  }

//yaşından küçükleri
  getYoungUsers() async {
    final users = await isar.users.filter().ageLessThan(10).findAll();
    userList = users;
    setState(() {});
  }

//yaşından büyükleri
  getOldUsers() async {
    final users = await isar.users.filter().ageGreaterThan(10).findAll();
    userList = users;
    setState(() {});
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
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => addUser(
                    "Zeynep Durmuş", "X", "Y", 4, "İstanbul", "5580585858"),
                child: Text("ekle")),
            ElevatedButton(
                onPressed: getUsers, child: Text("Kullanıcıları Listele")),
            ElevatedButton(
                onPressed: getYoungUsers,
                child: Text("10 yaşından küçükleri listele")),
            ElevatedButton(
                onPressed: getOldUsers,
                child: Text("10 yaşından büyükleri listele")),
            ElevatedButton(
                onPressed: () => editUser(
                    1, "Zeynep", "X", "Y", 1000, "İstanbul", "5580585858"),
                child: Text("Kullanıcı güncelleme")),
            Expanded(
                child: ListView(
              children: usersToWidget(),
            )),
          ],
        ),
      ),
    );
  }
}
