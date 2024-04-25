import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/widgets/bottom_navigation_widget.dart';

void main() {
  testWidgets('BottomNavigationWidget loads widgets correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: BottomNavigationWidget())));

    final homeIconButtonFinder = find.byKey(const Key('HomeIconButton'));
    final publicIconButtonFinder = find.byKey(const Key('PublicIconButton'));
    final addIconButtonFinder = find.byKey(const Key('AddIconButton'));
    final settingsIconButtonFinder = find.byKey(const Key('SettingsIconButton'));

    expect(homeIconButtonFinder, findsOneWidget);
    expect(publicIconButtonFinder, findsOneWidget);
    expect(addIconButtonFinder, findsOneWidget);
    expect(settingsIconButtonFinder, findsOneWidget);

    expect(find.widgetWithIcon(IconButton, Icons.home), findsOneWidget);
    expect(find.widgetWithIcon(IconButton, Icons.public), findsOneWidget);
    expect(find.widgetWithIcon(IconButton, Icons.add), findsOneWidget);
    expect(find.widgetWithIcon(IconButton, Icons.settings), findsOneWidget);
  });
}
