import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionCheckerService {
  StreamSubscription<ConnectivityResult>? _subscription;
  bool _isDeviceConnected = false;
  bool _isAlertSet = false;
  BuildContext? _context;

  void startListening(BuildContext context) {
    _context = context;
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      _isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!_isDeviceConnected && !_isAlertSet) {
        _showDialogBox();
        _isAlertSet = true;
      }
    });
  }

  void dispose() {
    _subscription?.cancel();
  }

  void _showDialogBox() {
    if (_context == null) return;
    showCupertinoDialog<String>(
      context: _context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('No Connection'),
        content: const Text('Please check your internet connectivity'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'Cancel');
              _isAlertSet = false;
              _isDeviceConnected =
                  await InternetConnectionChecker().hasConnection;
              if (!_isDeviceConnected && !_isAlertSet) {
                _showDialogBox();
                _isAlertSet = true;
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
