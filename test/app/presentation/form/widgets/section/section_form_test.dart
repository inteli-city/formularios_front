import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_number_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_text_field.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/presentation/form/widgets/section/section_form.dart';

import 'section_form_test.mocks.dart';

@GenerateMocks([FormController])
void main() {
  late MockFormController mockFormController = MockFormController();

  Modular.bindModule(HomeModule());
  Modular.bindModule(AppModule());
  Modular.replaceInstance<FormController>(mockFormController);

  testWidgets('SectionForm Test', (WidgetTester tester) async {
    when(mockFormController.isSendingForm).thenReturn(false);

    final section = SectionEntity(
      sectionId: 'section-01',
      fields: [
        TextFieldEntity(
          fieldType: FieldTypeEnum.TEXT_FIELD,
          placeholder: 'Texto',
          isRequired: true,
          key: 'text-field',
        ),
        NumberFieldEntity(
          fieldType: FieldTypeEnum.NUMBER_FIELD,
          placeholder: 'Número',
          isRequired: true,
          key: 'number-field',
          decimal: false,
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SectionForm(
            formController: mockFormController,
            section: section,
            lastSection: true,
            formKey: GlobalKey<FormState>(),
          ),
        ),
      ),
    );

    expect(find.byType(CustomTextFormField), findsOneWidget);
    expect(find.byType(CustomNumberFormField), findsOneWidget);

    expect(find.text('Salvar'), findsOneWidget);
    expect(find.text('Enviar'), findsOneWidget);
  });
}
