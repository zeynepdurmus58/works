// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RangePicker extends StatefulWidget {
  const RangePicker({super.key});

  @override
  State<RangePicker> createState() => _RangePickerState();
}

class _RangePickerState extends State<RangePicker> {

    DateTime? startDate = DateTime.now();
    DateTime? endDate = DateTime.now();
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Tarih Aralığı Seçimi"),
          //takvim
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (e) {
              PickerDateRange x = e.value;
              if (x.startDate != null && x.endDate != null) {
                //hem başlangıç seçmiş hem bitiş
                startDate = x.startDate!;
                endDate = x.endDate!;
              } else if (x.startDate != null && x.endDate == null) {
                //kullanıcı tek bir gün seçmiş
                startDate = x.startDate!;
                endDate = null;
              } else {
                //kullanıcı bir şey seçmemiş
              }
              startDate = x.startDate;
              endDate = x.endDate;
              setState(() {});
            },
          ),
          Text("Başlangıç Tarihi: "),
          Text(DateFormat("E d MMMM yyyy").format(startDate!)),
          Text("Bitiş Tarihi: "),
          endDate != null ? Text(DateFormat("E d MMMM yyyy").format(endDate!))
          : Text("Bitiş tarihi seçilmedi")
        ],
      ),
    );
  }
}