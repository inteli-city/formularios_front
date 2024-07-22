import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/functions/global_snackbar.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/usecases/login_user_usecase.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:dartz/dartz.dart';

import 'user_provider_test.mocks.dart';

@GenerateMocks([AuthController, LoginUserUsecase])
void main() {
  late MockLoginUserUsecase mockLoginUserUsecase;
  late AuthController mockAuthController;
  late UserProvider userProvider;

  setUp(() {
    Modular.bindModule(AppModule());
    mockLoginUserUsecase = MockLoginUserUsecase();
    mockAuthController = MockAuthController();
    userProvider = UserProvider(mockLoginUserUsecase);

    Modular.replaceInstance<AuthController>(mockAuthController);
  });

  final userEntity = UserEntity(
      name: 'Test User',
      userId: '',
      email: '',
      enabled: false,
      role: RoleEnum.COORDINATOR,
      groups: []);

  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('UserProvider', () {
    testWidgets('should set user to UserEntity when login is successful',
        (WidgetTester tester) async {
      userProvider.user = userEntity;

      when(mockLoginUserUsecase()).thenAnswer((_) async => Right(userEntity));

      await tester.pumpWidget(createWidgetForTesting(child: Container()));

      expect(userProvider.user, userEntity);
    });

    test('should load user successfully when usecase returns a user', () async {
      userProvider.user = userEntity;

      when(mockLoginUserUsecase()).thenAnswer((_) async => Right(userEntity));

      await userProvider.loadUser();

      expect(userProvider.user, equals(userEntity));
    });

    testWidgets('should show an error when usecase returns a failure',
        (WidgetTester tester) async {
      S.load(const Locale.fromSubtags(languageCode: 'en'));
      when(mockLoginUserUsecase())
          .thenAnswer((_) async => Left(UnknownError()));

      await tester.pumpWidget(
        MaterialApp(
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    await userProvider.loadUser();
                  },
                  child: const Text('Show Error SnackBar'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Error SnackBar'));

      expect(userProvider.user, isNull);
    });
    test('should logout user', () async {
      userProvider.user = userEntity;

      when(mockLoginUserUsecase()).thenAnswer((_) async => Right(userEntity));

      userProvider.logout();

      expect(userProvider.user, isNull);
    });
  });
}
