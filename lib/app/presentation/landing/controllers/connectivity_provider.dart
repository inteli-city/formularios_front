import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';

class ConnectivityProvider with ChangeNotifier {
  Timer? _timer;

  ConnectivityProvider() {
    _startPeriodicCheck();
  }

  List<ConnectivityResult> _result = [ConnectivityResult.wifi];

  bool get isConnected => !_result.contains(ConnectivityResult.none);

  Color get indicatorColor => _result.contains(ConnectivityResult.none)
      ? AppColors.red
      : AppColors.primaryBlue;

  void _startPeriodicCheck() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _checkConnectivity();
    });
  }

  Future<void> _checkConnectivity() async {
    try {
      _result = await Connectivity().checkConnectivity();
    } catch (e) {
      _result = [ConnectivityResult.none];
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
