import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_file_picker_field.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'custom_file_picker_field_test.mocks.dart';

@GenerateMocks([SingleFormProvider, FilePicker])
void main() {
  late SingleFormProvider mockSingleFormProvider;
  late FilePicker mockFilePicker;

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
      mockSingleFormProvider = MockSingleFormProvider();
      mockFilePicker = MockFilePicker();
    },
  );

  testWidgets('CustomFilePickerFormField Test', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(2000, 2000));
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));

    final field = FileFieldEntity(
      key: 'filePickerField',
      placeholder: 'Selecione um arquivo',
      value: ['file.png', 'file2.png', 'file3.png'],
      fileType: FileTypeEnum.IMAGE,
      isRequired: true,
      minQuantity: 1,
      maxQuantity: 1,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomFilePickerFormField(
            field: field,
            onChanged: (DateTime? value) {},
            singleFormProvider: mockSingleFormProvider,
            section: section,
            filePicker: mockFilePicker,
          ),
        ),
      ),
    );

    expect(find.text('Selecione um arquivo:'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Selecionar Arquivos'), findsOneWidget);

    when(
      mockFilePicker.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
      ),
    ).thenAnswer((_) async {
      return FilePickerResult([
        PlatformFile(
          name: 'file.png',
          path: '/path/to/file.png',
          bytes: null,
          size: 1024,
        )
      ]);
    });

    await tester.pumpAndSettle();

    await tester.tap(find.byType(ElevatedButton));

    await tester.pumpAndSettle();

    verify(mockSingleFormProvider.setFieldValue(
      'section',
      'filePickerField',
      ['file.png', 'file2.png', 'file3.png', '/path/to/file.png'],
    )).called(1);
  });
}
