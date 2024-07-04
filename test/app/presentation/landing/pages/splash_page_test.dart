import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([IModularNavigator])
void main() {
  Modular.bindModule(AppModule());

  // testWidgets('should display CircularProgressIndicator when loading',
  //     (WidgetTester tester) async {
  //   await S.load(const Locale.fromSubtags(languageCode: 'en'));
  //   Modular.navigatorDelegate = navigator;

  //   await tester.pumpWidget(
  //     const MaterialApp(
  //       home: SplashPage(),
  //     ),
  //   );

  //   await tester.pump(const Duration(seconds: 2));

  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
  // });
}
