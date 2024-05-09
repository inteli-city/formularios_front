import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/stores/providers/user_provider.dart';

class UserGuard extends RouteGuard {
  UserGuard({String redirectTo = '/login'}) : super(redirectTo: redirectTo);
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    return Modular.get<UserProvider>().isLogged;
  }
}
