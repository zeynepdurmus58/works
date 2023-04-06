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

  List<Widget> userList = [];

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

    getUsers();
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("kullanıcı eklendi")));
  }

  getUsers() async {
    final users = await isar.users.where().findAll();
    userList = users
        .map(
          (e) => Row(
            children: [
              Text(e.name!),
              SizedBox(width: 5,),
              Text(e.id.toString()),
              SizedBox(width: 5,),
              Text("Yaş: " + e.age.toString()),
            ],
          ),
        )
        .toList();
    setState(() {});
  }

  getYoungUsers() async {
    final users = await isar.users.filter().ageLessThan(10).findAll();
    userList = users
        .map(
          (e) => Row(
            children: [
              Text(e.name!),
              SizedBox(width: 5,),
              Text(e.id.toString()),
              SizedBox(width: 5,),
              Text("Yaş: " + e.age.toString()),
            ],
          ),
        )
        .toList();
    setState(() {});
  }

  getOldUsers() async {
    final users = await isar.users.filter().ageGreaterThan(10).findAll();
    userList = users
        .map(
          (e) => Row(
            children: [
              Text(e.name!),
              SizedBox(width: 5,),
              Text(e.id.toString()),
              SizedBox(width: 5,),
              Text("Yaş: " + e.age.toString()),
            ],
          ),
        )
        .toList();
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
                onPressed: getYoungUsers, child: Text("10 yaşından küçükleri listele")),
             ElevatedButton(
                onPressed: getOldUsers, child: Text("10 yaşından büyükleri listele")),
            Expanded(
              child: 
                ListView(
                  children: userList,
                )
            ),
          ],
        ),
      ),
    );
  }
}
