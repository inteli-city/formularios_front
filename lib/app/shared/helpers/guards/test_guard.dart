import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/stores/providers/user_provider.dart';

class UserGuard extends RouteGuard {
  UserGuard({String redirectTo = '/'}) : super(redirectTo: redirectTo);
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    if (Modular.get<UserProvider>().isLogged) {
      log('logado, acesse o app');
      //logica de pegar o usuário no banco e validar ele
      return true;
    }
    Modular.to.navigate('/login');
    return false;
  }
}
