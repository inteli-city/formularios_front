import 'package:flutter/material.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';

class UserProvider extends ChangeNotifier {
  final AuthController _authController;
  UserProvider(
    this._authController,
  );

  bool get isLogged => _authController.isLogged;
}
