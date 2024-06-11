import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/check_box_field.dart';

void main() {
  testWidgets('CustomCheckBoxFormField Test', (WidgetTester tester) async {
    final field = CheckBoxFieldEntity(
      key: 'checkBoxField',
      placeholder: 'Aceito os termos',
      value: false,
      isRequired: true,
    );

    bool? checkBoxValue = field.value;

    void onChanged(bool? value) {
      checkBoxValue = value;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCheckBoxFormField(
            field: field,
            onChanged: onChanged,
          ),
        ),
      ),
    );

    expect(find.text('Aceito os termos'), findsOneWidget);

    expect(find.byType(CheckboxListTile), findsOneWidget);
    expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value, false);

    await tester.tap(find.byType(CheckboxListTile));
    await tester.pump();

    expect(checkBoxValue, true);
  });
}
