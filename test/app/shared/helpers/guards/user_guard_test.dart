import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/shared/helpers/guards/user_guard.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart';

import 'user_guard_test.mocks.dart';

@GenerateMocks([UserProvider])
void main() {
  late MockUserProvider mockUserProvider;
  late UserGuard userGuard;

  setUp(() {
    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());

    mockUserProvider = MockUserProvider();
    userGuard = UserGuard();
    Modular.replaceInstance<UserProvider>(mockUserProvider);
    
  });

  tearDown(() {
    Modular.destroy();
  });

  test('should allow access if user is logged in', () async {
    // when(mockUserProvider.isLogged).thenReturn(true);
    // when(mockUserProvider.)

    // final result =
    //     await userGuard.canActivate('/home', ParallelRoute(name: '/login'));
    // print(result);
    // expect(result, true);
  });

  test('should not allow access if user is not logged in', () async {
    when(mockUserProvider.isLogged).thenReturn(false);

    final result =
        await userGuard.canActivate('/home', ParallelRoute(name: ''));

    expect(result, false);
  });
}
