import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/dialogs/fields/dialog_text_field.dart';

void main() {
  group('DialogTextField Widget Tests', () {
    late CancelFormController controller;

    setUp(() {
      controller = CancelFormController();
    });

    testWidgets('should display the DialogTextField widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogTextField(
              label: 'Justification',
              controller: controller,
            ),
          ),
        ),
      );

      expect(find.text('Justification'), findsOneWidget);

      expect(find.text('*'), findsOneWidget);
    });

    testWidgets('should enable and disable the TextFormField', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogTextField(
              label: 'Justification',
              controller: controller,
              isEnabled: false,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextFormField>(find.byType(TextFormField));
      expect(textField.enabled, false);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogTextField(
              label: 'Justification',
              controller: controller,
              isEnabled: true,
            ),
          ),
        ),
      );

      final enabledTextField = tester.widget<TextFormField>(find.byType(TextFormField));
      expect(enabledTextField.enabled, true);
    });

    testWidgets('should update the controller when text changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogTextField(
              label: 'Justification',
              controller: controller,
            ),
          ),
        ),
      );

      final textFieldFinder = find.byType(TextFormField);

      await tester.enterText(textFieldFinder, 'Some justification');
      await tester.pump();

      expect(controller.justificationText, 'Some justification');
    });
  });
}
