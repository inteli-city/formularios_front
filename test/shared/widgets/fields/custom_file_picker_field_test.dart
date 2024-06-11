import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_file_picker_field.dart';
import 'package:mockito/annotations.dart';

import 'custom_file_picker_field_test.mocks.dart';

@GenerateMocks([FormController])
void main() {
  late FormController mockFormController;
  SectionEntity section = SectionEntity(fields: [
    FileFieldEntity(
        fileType: FileTypeEnum.IMAGE,
        minQuantity: 1,
        maxQuantity: 2,
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true),
  ], sectionId: 'section');
  setUp(
    () {
      mockFormController = MockFormController();
    },
  );
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
            controller: mockFormController,
            section: section,
          ),
        ),
      ),
    );

    expect(find.text('Selecione um arquivo'), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);

    expect(find.text('Selecionar Arquivos'), findsOneWidget);
  });
}
