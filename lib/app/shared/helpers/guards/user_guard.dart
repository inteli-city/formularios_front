import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/stores/providers/user_provider.dart';

class UserGuard extends RouteGuard {
  UserGuard({String redirectTo = '/'}) : super(redirectTo: redirectTo);
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    log('passando pelo guarda');

    var provider = Modular.get<UserProvider>();
    if (provider.isLogged) {
      await provider.loginUser();
      return provider.isLogged;
    }
    return false;
  }
}
