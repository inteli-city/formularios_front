import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/landing/pages/splash_page.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:mockito/annotations.dart';

import 'splash_page_test.mocks.dart';

@GenerateMocks([IModularNavigator])
void main() {
  Modular.bindModule(AppModule());
  final navigator = MockIModularNavigator();

  testWidgets('should display CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    Modular.navigatorDelegate = navigator;

    await tester.pumpWidget(
      const MaterialApp(
        home: SplashPage(),
      ),
    );

    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
