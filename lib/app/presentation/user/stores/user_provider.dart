import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/usecases/login_user_usecase.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';

class UserProvider extends ChangeNotifier {
  final AuthController _authController;
  final ILoginUserUsecase _loginUser;
  UserProvider(
    this._authController,
    this._loginUser,
  ) {
    if (_authController.isLogged) {
      loginUser();
    } else {
      Modular.to.navigate('./home/');
    }
  }

  bool get isLogged => _authController.isLogged;

  UserEntity? user;

  Future<void> loginUser() async {
    final user = await _loginUser();
    user.fold((l) => this.user = null, (r) => this.user = r);
  }
}
