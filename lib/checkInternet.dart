import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:randomdex/screens/homescreen.dart';
import 'package:randomdex/screens/noInternet.dart';

Future<void> checkConnection(BuildContext context) async{
  var connection = await (Connectivity().checkConnectivity());
  if(connection == ConnectivityResult.mobile || connection == ConnectivityResult.wifi){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const HomePage(),
        ));
  }
  else{
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const NoInternet(),
        ));
  }
}