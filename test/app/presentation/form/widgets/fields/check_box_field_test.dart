import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/check_box_field.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'custom_file_picker_field_test.mocks.dart';

@GenerateMocks([SingleFormProvider])
void main() {
  SingleFormProvider formProvider = MockSingleFormProvider();
  final field = CheckBoxFieldEntity(
    key: 'checkBoxField',
    placeholder: 'Aceito os termos',
    value: false,
    isRequired: true,
  );
  final section = SectionEntity(fields: [field], sectionId: 'sectionID');

  final form = FormEntity(
    formTitle: 'Form Title',
    formId: 'ID1142342524242',
    creatorUserId: '1',
    userId: '1',
    vinculationFormId: '10',
    template: 'Poda de Árvore',
    area: 'area',
    system: 'Gaia',
    street: 'Rua Samuel Morse',
    city: 'São Paulo',
    number: 120,
    latitude: -23.61148,
    longitude: -46.69416,
    region: 'region',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
    priority: PriorityEnum.HIGH,
    status: FormStatusEnum.IN_PROGRESS,
    expirationDate: 1715000631000,
    creationDate: 1704561963000,
    startDate: 1,
    conclusionDate: 1,
    justificative: JustificativeEntity(
      options: [
        JustificativeOptionEntity(
          option: 'option',
          requiredImage: true,
          requiredText: true,
        ),
      ],
      selectedOption: null,
      justificationText: null,
      justificationImage: null,
    ),
    comments: 'comments',
    sections: [section],
    canVinculate: true,
  );
  
  when(formProvider.form).thenReturn(form);
  testWidgets('CustomCheckBoxFormField Test', (WidgetTester tester) async {
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
            sectionEntity: section,
            singleFormProvider: formProvider,
          ),
        ),
      ),
    );

    expect(find.text('Aceito os termos'), findsOneWidget);

    expect(find.byType(CheckboxListTile), findsOneWidget);
    expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value,
        false);

    await tester.tap(find.byType(CheckboxListTile));
    await tester.pump();

    expect(checkBoxValue, true);
  });
}
