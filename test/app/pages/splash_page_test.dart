import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/pages/splash_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_page_test.mocks.dart';

@GenerateMocks([IModularNavigator])
void main() {
  Modular.bindModule(AppModule());
  final navigator = MockIModularNavigator();
  Modular.navigatorDelegate = navigator;

  testWidgets('should display CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashPage(),
      ),
    );

    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
