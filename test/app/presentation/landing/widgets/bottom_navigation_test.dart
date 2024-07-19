import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/landing/widgets/bottom_navigation_widget.dart';
import 'package:formularios_front/generated/l10n.dart';

void main() {
  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
  });

  testWidgets('BottomNavigationWidget loads widgets correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BottomNavigationWidget())));

    final homeIconButtonFinder = find.byKey(const Key('HomeIconButton'));
    final publicIconButtonFinder = find.byKey(const Key('PublicIconButton'));
    final addIconButtonFinder = find.byKey(const Key('AddIconButton'));
    final settingsIconButtonFinder =
        find.byKey(const Key('SettingsIconButton'));

    expect(homeIconButtonFinder, findsOneWidget);
    expect(publicIconButtonFinder, findsOneWidget);
    expect(addIconButtonFinder, findsOneWidget);
    expect(settingsIconButtonFinder, findsOneWidget);

    expect(find.widgetWithIcon(IconButton, Icons.home), findsOneWidget);
    expect(find.widgetWithIcon(IconButton, Icons.public), findsOneWidget);
    expect(find.widgetWithIcon(IconButton, Icons.add), findsOneWidget);
    expect(find.widgetWithIcon(IconButton, Icons.settings), findsOneWidget);
  });

  testWidgets('should tap on HomeIconButton', (WidgetTester tester) async {
    await tester.pumpWidget(ModularApp(
      module: AppModule(),
      child: const MaterialApp(
        home: Scaffold(
          body: BottomNavigationWidget(),
        ),
      ),
    ));

    await tester.tap(
      find.byKey(
        const Key('HomeIconButton'),
      ),
    );
    
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.home), findsOneWidget);
  });
}
