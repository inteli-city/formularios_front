import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/widgets/default_order_widget.dart';

void main() {
  group('DefaultOrderWidget Tests', () {
    testWidgets('Should display title and count correctly',
        (WidgetTester tester) async {
      const testTitle = 'Concluídos';
      const testCount = 0;
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: DefaultOrderWidget(
              keyValue: testTitle,
              defaultOrderTitle: testTitle,
              count: testCount),
        ),
      ));

      expect(find.text('$testTitle\n($testCount)'), findsOneWidget);
    });
  });
}
