import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';

class SplashController extends ChangeNotifier {
  final UserProvider _userProvider;
  final AuthController _authController;

  SplashController(this._userProvider, this._authController) {
    _authController.checkLogin().then((value) {
      if (!value) {
        Modular.to.navigate('/login/');
      } else {
        loadUser();
      }
    });
  }

  Future<void> loadUser() async {
    await _userProvider.loadUser();
    Modular.to.navigate('/home/forms');
  }
}
