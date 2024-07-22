import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/landing/controllers/splash_controller.dart';
import 'package:formularios_front/app/presentation/landing/pages/splash_page.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';

import 'splash_page_test.mocks.dart';

@GenerateMocks([SplashController])
void main() {
  SplashController mockSplashController = MockSplashController();
  Modular.bindModule(AppModule());
  Modular.replaceInstance<SplashController>(mockSplashController);

  testWidgets('should display CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));

    await tester.pumpWidget(
      const MaterialApp(
        home: SplashPage(),
      ),
    );

    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
  
}
