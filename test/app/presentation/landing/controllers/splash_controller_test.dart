import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/landing/controllers/splash_controller.dart';
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_controller_test.mocks.dart';

@GenerateMocks([AuthController, IModularNavigator, UserProvider])
void main() {
  group('SplashController Tests', () {
    late MockUserProvider mockUserProvider;
    late MockAuthController mockAuthController;

    final navigator = MockIModularNavigator();

    Modular.navigatorDelegate = navigator;

    setUp(() {
      mockAuthController = MockAuthController();
      mockUserProvider = MockUserProvider();
    });

    test('should check login status when created', () {
      when(mockAuthController.checkLogin()).thenAnswer((_) async => false);

      SplashController(mockUserProvider, mockAuthController);

      verify(mockAuthController.checkLogin()).called(1);
    });

    test('should navigate to login page if not logged in', () async {
      when(mockAuthController.checkLogin()).thenAnswer((_) async => false);

      SplashController(mockUserProvider, mockAuthController);

      await Future.delayed(Duration.zero);

      verify(navigator.navigate('/login/')).called(1);
    });

    test('should load user data if logged in', () async {
      when(mockAuthController.checkLogin()).thenAnswer((_) async => true);

      SplashController(mockUserProvider, mockAuthController);

      await Future.delayed(Duration.zero);

      verify(mockUserProvider.loadUser()).called(1);
      
      verify(navigator.navigate('/home/forms')).called(1);
    });
  });
}
