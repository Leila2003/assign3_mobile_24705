import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  late Stream<ConnectivityResult> connectivityStream;

  ConnectivityService() {
    connectivityStream = _connectivity.onConnectivityChanged;
  }

  void initialize(BuildContext context) {
    connectivityStream.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No internet connection"),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Connected to the internet"),
        ));
      }
    });
  }
}