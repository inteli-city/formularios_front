import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_file_picker_field.dart';

void main() {
  testWidgets('CustomFilePickerFormField Test', (WidgetTester tester) async {
    final field = FileFieldEntity(
      key: 'filePickerField',
      placeholder: 'Selecione um arquivo',
      value: ['file.png', 'file2.png', 'file3.png'],
      fileType: FileTypeEnum.IMAGE,
      isRequired: true,
      minQuantity: 1,
      maxQuantity: 3,
    );

    void onChanged(DateTime? value) {}

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomFilePickerFormField(
            field: field,
            onChanged: onChanged,
          ),
        ),
      ),
    );

    expect(find.text('Selecione um arquivo'), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);

    expect(find.text('Selecionar Arquivos'), findsOneWidget);
  });
}
