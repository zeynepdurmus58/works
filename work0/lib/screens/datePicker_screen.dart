// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

    DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Tek Gün Seçimi"),
          //takvim
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.single,
            onSelectionChanged: (e) {
              selectedDate = e.value;
              setState(() {});
            },
          ),
          Text("Seçilen Tarih: "),
          Text(DateFormat("E d MMMM yyyy").format(selectedDate!)),
        ],
      ),
    );
  }
}