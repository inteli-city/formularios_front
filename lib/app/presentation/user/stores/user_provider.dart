import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/usecases/login_user_usecase.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/helpers/functions/global_snackbar.dart';

class UserProvider extends ChangeNotifier {
  final ILoginUserUsecase _loginUser;
  UserProvider(
    this._loginUser,
  );

  UserEntity? user;

  Future<void> loadUser() async {
    await _loginUser().then(
      (value) => value.fold((error) {
        GlobalSnackBar.error(error.errorMessage);
      }, (user) {
        this.user = user;
      }),
    );
    notifyListeners();
  }

  void logout() async {
    user = null;
    await Modular.get<AuthController>().signOut();
    Modular.to.navigate('/');
  }
}
