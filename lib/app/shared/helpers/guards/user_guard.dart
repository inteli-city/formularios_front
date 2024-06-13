import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';

class UserGuard extends RouteGuard {
  UserGuard({String redirectTo = '/login'}) : super(redirectTo: redirectTo);
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    return Modular.get<AuthController>().isLogged;
  }
}
