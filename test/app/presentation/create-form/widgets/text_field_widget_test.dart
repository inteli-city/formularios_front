import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/create-form/widgets/text_field_widget.dart';

void main() {
  testWidgets('TextFieldWidget validation test', (WidgetTester tester) async {
    const key = Key('test-textfield');
    TextEditingController controller = TextEditingController();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TextFieldWidget(
          controller: controller,
          key: key,
          label: 'Test Label',
          isRequired: true,
        ),
      ),
    ));

    await tester.enterText(find.byKey(key), '');
    await tester.pump();

    var formField = tester.widget<TextFormField>(find.byType(TextFormField));
    var validationMessage = formField.validator!('');
    expect(validationMessage, 'Campo obrigatório');

    await tester.enterText(find.byKey(key), 'Test');
    await tester.pump();

    validationMessage = formField.validator!('Test');
    expect(validationMessage, isNull);
  });
}
