import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionService extends ChangeNotifier {
  bool _isConnectedToInternet = true;
  bool get isConnectedToInternet => _isConnectedToInternet;

  StreamSubscription? _internetConnectionStreamSubscription;

  InternetConnectionService() {
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
          switch (event) {
            case InternetStatus.connected:
              _setConnectionStatus(true);
              break;
            case InternetStatus.disconnected:
              _setConnectionStatus(false);
              break;
            default:
              _setConnectionStatus(false);
              break;
          }
        });
  }

  void _setConnectionStatus(bool status) {
    _isConnectedToInternet = status;
    notifyListeners();
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }
}
