import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String sonuclar = "";

  late StreamSubscription<ConnectivityResult> subscription;

  bilgilariAl() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      sonuclar = "CELLULAR";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      sonuclar = "WIFI";
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      // I am connected to a ethernet network.
      sonuclar = "ETHERNET";
    } else if (connectivityResult == ConnectivityResult.vpn) {
      // I am connected to a vpn network.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
      sonuclar = "VPN";
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      // I am connected to a bluetooth.
      sonuclar = "BLUETOOTH";
    } else if (connectivityResult == ConnectivityResult.other) {
      // I am connected to a network which is not in the above mentioned networks.
      sonuclar = "OTHER";
    } else if (connectivityResult == ConnectivityResult.none) {
      // I am not connected to any network.
      sonuclar = "YOK";
    } else {
      sonuclar = connectivityResult.name;
    }
    setState(() {});
  }

  @override
  void initState() {
    bilgilariAl();
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      print("Yeni durum");
    });
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(sonuclar),
          ],
        ));
  }
}
