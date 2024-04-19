import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/widgets/search_filter_tab.dart';

void main() {
  group('SearchFilterTab Tests', () {
    testWidgets('SearchFilterTab builds correctly with expected elements',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: SearchFilterTab(),
        ),
      ));

      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
      expect(find.byIcon(Icons.filter_alt_sharp), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);

      final TextField textField = tester.firstWidget(find.byType(TextField));
      expect(textField.decoration?.prefixIcon, isNotNull);
      expect(textField.decoration?.suffixIcon, isNotNull);
    });
  });
}
