// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class SalesData {
  String date = "";
  double amount = 0.0;
  SalesData(this.date, this.amount);
}

class Wallet {
  String incomeName = "";
  int count = 0;
  //Color incomeColor = Colors.blue;
  Wallet(this.incomeName, this.count);
}

class _ChartScreenState extends State<ChartScreen> {
  String chart_type = "line";

  var salesData = <SalesData>[
    SalesData('19/04', 3500),
    SalesData('20/04', 2800),
    SalesData('21/04', 3400),
    SalesData('22/04', 3200),
    SalesData('23/04', 400)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Wrap(
              children: [
                //line
                ElevatedButton(
                  onPressed: () {
                    chart_type = "line";
                    setState(() {});
                  },
                  child: Text("Line Chart"),
                ),
                //spark
                ElevatedButton(
                  onPressed: () {
                    chart_type = "spark";
                    setState(() {});
                  },
                  child: Text("Spark Chart"),
                ),
                //spline
                ElevatedButton(
                  onPressed: () {
                    chart_type = "spline";
                    setState(() {});
                  },
                  child: Text("Spline"),
                ),
                //pie
                ElevatedButton(
                  onPressed: () {
                    chart_type = "pie";
                    setState(() {});
                  },
                  child: Text("Pie"),
                ),
              ],
            ),
            chart_type == "line"
                ? LineChart(
                    data: salesData,
                  )
                : chart_type == "spark"
                    ? SparkChart()
                    : chart_type == "spline"
                        ? SplineChart(
                            data: salesData,
                          )
                        : chart_type == "pie"
                            ? PieChart()
                            : Text("henüz yapmadım")
          ],
        ));
  }
}


class LineChart extends StatelessWidget {
  
  List<SalesData> data;

  LineChart({
    super.key,
    required this.data,
  }) {
    //throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(

        // Initialize category axis
        primaryXAxis: CategoryAxis(),

        // Chart title
        title: ChartTitle(text: "Günlük Gelir - Gider Raporu"),

        // Enable legend
        legend: Legend(isVisible: true),

        // Enable tooltip
        tooltipBehavior: TooltipBehavior(
          enable: true,
          //animationDuration: 10000,
          //header: "Detay:"
        ),
        series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
            name: "gelir",
            // Enable data label
            //dataLabelSettings: DataLabelSettings(isVisible: true),

            // Bind data source
            dataSource: data,
            xValueMapper: (SalesData sales, _) => sales.date,
            yValueMapper: (SalesData sales, _) => sales.amount,
          ),
          LineSeries<SalesData, String>(
            name: "gider",
            // Enable data label
            //dataLabelSettings: DataLabelSettings(isVisible: true),

            // Bind data source
            dataSource: <SalesData>[
              SalesData('19/04', 1000),
              SalesData('20/04', 1800),
              SalesData('21/04', 2000),
              SalesData('22/04', 500),
              SalesData('23/04', 40)
            ],
            xValueMapper: (SalesData sales, _) => sales.date,
            yValueMapper: (SalesData sales, _) => sales.amount,
          ),
          LineSeries<SalesData, String>(
            name: "uyduruk bir şey",
            // Enable data label
            //dataLabelSettings: DataLabelSettings(isVisible: true),

            // Bind data source
            dataSource: <SalesData>[
              SalesData('19/04', 500),
              SalesData('20/04', 1500),
              SalesData('21/04', 800),
              SalesData('22/04', 900),
              SalesData('23/04', 650)
            ],
            xValueMapper: (SalesData sales, _) => sales.date,
            yValueMapper: (SalesData sales, _) => sales.amount,
          ),
        ]);
  }
}

class SparkChart extends StatelessWidget {
  const SparkChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfSparkLineChart(
      //Enable the trackball
      trackball: const SparkChartTrackball(
          activationMode: SparkChartActivationMode.tap),

      //Enable marker
      marker:
          const SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),

      //Enable data label
      labelDisplayMode: SparkChartLabelDisplayMode.all,

      data: <double>[
        1,
        5,
        -6,
        0,
        1,
        -2,
        7,
        -7,
        -4,
        -10,
        13,
        -6,
        7,
        5,
        11,
        5,
        3
      ],
    );
  }
}

class SplineChart extends StatelessWidget {
  List<SalesData> data;

  SplineChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(

            // Initialize category axis
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
          // Initialize line series
          LineSeries<SalesData, String>(
            dataSource: data,
            xValueMapper: (SalesData data, _) => data.date,
            yValueMapper: (SalesData data, _) => data.amount,
          )
        ]));
  }
}

class PieChart extends StatelessWidget {
  PieChart({
    super.key,
  });

  List<Wallet> data = [
    Wallet("Banka", 90000),
    Wallet("Maaş", 30000),
    Wallet("alacak", 5000),
    Wallet("araba satışı", 100000),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        title: ChartTitle(text: "gelir gider tablosu ama eh işte olanından"),
        tooltipBehavior: TooltipBehavior(enable: true),
        legend: Legend(isVisible: true),
        series: <CircularSeries>[
          // Render pie chart
          PieSeries<Wallet, String>(
              dataSource: data,
              //pointColorMapper:(Wallet data,  _) => data.color,
              xValueMapper: (Wallet data, _) => data.incomeName,
              yValueMapper: (Wallet data, _) => data.count)
        ]);
  }
}





