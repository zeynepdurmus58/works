// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateListPicker extends StatefulWidget {
  const DateListPicker({super.key});

  @override
  State<DateListPicker> createState() => _DateListPickerState();
}

class _DateListPickerState extends State<DateListPicker> {
  List<DateTime> selectedDays = [];

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
            selectionMode: DateRangePickerSelectionMode.multiple,
            onSelectionChanged: (e) {
              List<DateTime> x = e.value;
              selectedDays = x;
              setState(() {});
            },
          ),
          Text("Seçilen Tarih: "),
          ...selectedDays
              .map(
                (e) => Text(DateFormat("E d MMMM yyyy").format(e)),
              )
              .toList()
        ],
      ),
    );
  }
}
