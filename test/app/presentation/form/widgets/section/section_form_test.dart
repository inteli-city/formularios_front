import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/check_box_group_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_file_picker_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_number_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_switch_button_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_text_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/radio_group_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/type_ahead_field.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/presentation/form/widgets/section/section_form.dart';

import 'section_form_test.mocks.dart';

@GenerateMocks([SingleFormProvider])
void main() {
  late MockSingleFormProvider mocksingleFormProvider = MockSingleFormProvider();

  Modular.bindModule(HomeModule());
  Modular.bindModule(AppModule());
  Modular.replaceInstance<SingleFormProvider>(mocksingleFormProvider);

  testWidgets('SectionForm Test', (WidgetTester tester) async {
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    initializeDateFormatting();
    when(mocksingleFormProvider.isSendingForm).thenReturn(false);
    when(mocksingleFormProvider.getFieldValue(any, any)).thenReturn(null);

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
        SwitchButtonFieldEntity(
          fieldType: FieldTypeEnum.SWITCH_BUTTON_FIELD,
          placeholder: 'Switch',
          isRequired: true,
          key: 'switch-field',
        ),
        RadioGroupFieldEntity(
          fieldType: FieldTypeEnum.RADIO_GROUP_FIELD,
          placeholder: 'Radio',
          isRequired: true,
          key: 'radio-field',
          options: ['Option 1', 'Option 2'],
        ),
      ],
    );

    final form = FormEntity(
      formTitle: 'formTitle',
      formId: 'formId',
      creatorUserId: 'creatorUserId',
      userId: 'userId',
      canVinculate: false,
      template: 'template',
      area: 'area',
      system: 'system',
      street: 'street',
      city: 'city',
      number: 0,
      latitude: 0,
      longitude: 0,
      region: ' region',
      priority: PriorityEnum.EMERGENCY,
      status: FormStatusEnum.CANCELED,
      expirationDate: 0,
      creationDate: 0,
      justification: JustificationEntity(
        options: [
          JustificationOptionEntity(
              option: 'Option 1', requiredImage: true, requiredText: false),
        ],
        selectedOption: 'Option 1',
        justificationText: 'justificationText',
        justificationImage: 'justificationImage',
      ),
      sections: [section],
    );

    when(mocksingleFormProvider.form).thenReturn(form);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SectionForm(
            singleFormProvider: mocksingleFormProvider,
            section: section,
            lastSection: true,
            formKey: GlobalKey<FormState>(),
          ),
        ),
      ),
    );

    expect(find.byType(CustomTextFormField), findsOneWidget);
    expect(find.byType(CustomNumberFormField), findsOneWidget);
    expect(find.byType(CustomSwitchButtonField), findsOneWidget);
    expect(find.byType(CustomRadioGroupFormField), findsOneWidget);

    expect(find.text('Salvar'), findsOneWidget);
  });

  testWidgets('SectionForm Test', (WidgetTester tester) async {
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    initializeDateFormatting();
    when(mocksingleFormProvider.isSendingForm).thenReturn(false);
    when(mocksingleFormProvider.getFieldValue(any, any)).thenReturn(null);

    final section = SectionEntity(
      sectionId: 'section-01',
      fields: [
        DateFieldEntity(
            placeholder: 'placeholder', key: 'date-field', isRequired: true),
        FileFieldEntity(
            fileType: FileTypeEnum.IMAGE,
            minQuantity: 0,
            maxQuantity: 2,
            placeholder: 'placeholder',
            key: 'file-field',
            isRequired: true),
        TypeAheadFieldEntity(
            options: ['Option 1', 'Option 2'],
            placeholder: 'placeholder',
            key: 'typeahead-field',
            isRequired: true),
        CheckBoxGroupFieldEntity(
          options: ['Option 1', 'Option 2'],
          fieldType: FieldTypeEnum.CHECKBOX_GROUP_FIELD,
          placeholder: 'Checkbox',
          key: 'checkbox-field',
          isRequired: true,
        ),
      
      ],
    );

    final form = FormEntity(
      formTitle: 'formTitle',
      formId: 'formId',
      creatorUserId: 'creatorUserId',
      userId: 'userId',
      canVinculate: false,
      template: 'template',
      area: 'area',
      system: 'system',
      street: 'street',
      city: 'city',
      number: 0,
      latitude: 0,
      longitude: 0,
      region: ' region',
      priority: PriorityEnum.EMERGENCY,
      status: FormStatusEnum.CANCELED,
      expirationDate: 0,
      creationDate: 0,
      justification: JustificationEntity(
        options: [
          JustificationOptionEntity(
              option: 'Option 1', requiredImage: true, requiredText: false),
        ],
        selectedOption: 'Option 1',
        justificationText: 'justificationText',
        justificationImage: 'justificationImage',
      ),
      sections: [section],
    );

    when(mocksingleFormProvider.form).thenReturn(form);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SectionForm(
            singleFormProvider: mocksingleFormProvider,
            section: section,
            lastSection: true,
            formKey: GlobalKey<FormState>(),
          ),
        ),
      ),
    );

    expect(find.byType(CustomFilePickerFormField), findsOneWidget);
    expect(find.byType(CustomTypeAheadFormField), findsOneWidget);
    expect(find.byType(CustomCheckBoxGroupFormField), findsOneWidget);
    expect(find.byType(CustomFilePickerFormField), findsOneWidget);
  });
}
