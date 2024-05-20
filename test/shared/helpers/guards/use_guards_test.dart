import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/shared/helpers/guards/user_guard.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/presentation/stores/providers/user_provider.dart';

import 'use_guards_test.mocks.dart';

@GenerateMocks([UserProvider])
void main() {
  late MockUserProvider mockUserProvider;
  late UserGuard userGuard;

  setUp(() {
    Modular.bindModule(UserModule());
    Modular.bindModule(AppModule());

    mockUserProvider = MockUserProvider();
    userGuard = UserGuard();
    Modular.replaceInstance<UserProvider>(mockUserProvider);
  });

  tearDown(() {
    Modular.destroy();
  });

  test('should allow access if user is logged in', () async {
    when(mockUserProvider.isLogged).thenReturn(true);

    final result =
        await userGuard.canActivate('/home', ParallelRoute(name: ''));

    expect(result, true);
  });

  test('should not allow access if user is not logged in', () async {
    when(mockUserProvider.isLogged).thenReturn(false);

    final result =
        await userGuard.canActivate('/home', ParallelRoute(name: ''));

    expect(result, false);
  });
}
