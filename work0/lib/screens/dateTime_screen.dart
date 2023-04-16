// ignore_for_file: prefer_const_constructors, unused_local_variable, depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  DateTime? selectedDate;

  //bugün
  getToday() {
    selectedDate = DateTime.now();
    setState(() {});
  }

  //yarın
  getTomorrow() {
    selectedDate = DateTime.now();
    selectedDate = selectedDate!.add(Duration(days: 1));
    setState(() {});
  }

  //30 gün sonra
  getNextMonth() {
    selectedDate = DateTime.now();
    selectedDate = selectedDate!.add(Duration(days: 30));
    setState(() {});
  }

  //sonraki gün sonra
  getNextDay() {
    if (selectedDate == null) {
      selectedDate = DateTime.now();
    } else {
      selectedDate = selectedDate!.add(Duration(days: 1));
    }
    setState(() {});
  }

  //tarihi göster
  showDate() {
    if (selectedDate != null) {
      return Text(selectedDate!.toString());
    } else {
      return Text("Tarih yok");
    }
  }

  showFormatDate() {
    if (selectedDate != null) {
      var tarihim = DateFormat("E d MMMM yyyy dd.MM.yyyy").format(selectedDate!);

      return Text(tarihim.toString());
    } else {
      return Text("Tarih yok");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 48, 173),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //bugün
            ElevatedButton(
              onPressed: () => getToday(),
              child: Text("Bugün"),
            ),
            SizedBox(height: 8),
            //yarın
            ElevatedButton(
              onPressed: () => getTomorrow(),
              child: Text("Yarın"),
            ),
            SizedBox(height: 8),
            //30 gün sonra
            ElevatedButton(
              onPressed: () => getNextMonth(),
              child: Text("30 Gün Sonra"),
            ),
            SizedBox(height: 8),
            //sonraki gün
            ElevatedButton(
              onPressed: () => getNextDay(),
              child: Text("sonraki gün"),
            ),
            SizedBox(height: 8),
            //Text("Tarih :"),
            showDate(),
            showFormatDate(),
            Text(DateFormat("E dd MM yyyy").format(selectedDate!)),
            Text(DateFormat("H").format(selectedDate!)),
            Text(DateFormat("Md").format(selectedDate!)),
            Text(DateFormat("yM").format(selectedDate!)),
            Text(DateFormat("MMM").format(selectedDate!)),
            Text(DateFormat("kk:mm.ss").format(selectedDate!)),
            Text(DateFormat("KK:mm.ss").format(selectedDate!)),
          ],
        ),
      ),
    );
  }
}
