import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/usecases/login_user_usecase.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:dartz/dartz.dart';

import 'user_provider_test.mocks.dart';

@GenerateMocks([AuthController, LoginUserUsecase, UserProvider])
void main() {
  late MockAuthController mockAuthController;
  late MockLoginUserUsecase mockLoginUserUsecase;
  late MockUserProvider provider;

  setUp(() {
    Modular.bindModule(AppModule());
    mockAuthController = MockAuthController();
    mockLoginUserUsecase = MockLoginUserUsecase();
    provider = MockUserProvider();
  });

  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('UserProvider', () {
    final userEntity = UserEntity(
        name: 'Test User',
        userId: '',
        email: '',
        enabled: false,
        role: RoleEnum.COORDINATOR,
        groups: []);

    testWidgets('should set user to UserEntity when login is successful',
        (WidgetTester tester) async {
      when(mockAuthController.isLogged).thenReturn(true);
      when(provider.user).thenReturn(userEntity);
      when(mockLoginUserUsecase()).thenAnswer((_) async => Right(userEntity));

      await tester.pumpWidget(createWidgetForTesting(child: Container()));

      expect(provider.user, userEntity);
    });

    test('should load user successfully when usecase returns a user', () async {
      var user = UserEntity(
          name: 'Test User',
          userId: '1',
          email: 'test@example.com',
          enabled: true,
          role: RoleEnum.COORDINATOR,
          groups: []);

      when(provider.user).thenReturn(user);

      when(mockLoginUserUsecase()).thenAnswer((_) async => Right(user));

      await provider.loadUser();

      expect(provider.user, equals(user));
    });

    test('should show an error when usecase returns a failure', () async {
      when(provider.user).thenReturn(null);
      when(mockLoginUserUsecase())
          .thenAnswer((_) async => Left(UnknownError()));

      await provider.loadUser();

      expect(provider.user, isNull);
    });
  });
}
