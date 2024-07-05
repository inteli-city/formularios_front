import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/stepper/stepper_component.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/pages/form_sections_page.dart';
import 'package:mockito/mockito.dart';

import 'form_details_page_test.mocks.dart';

@GenerateMocks([SingleFormProvider])
void main() {
  MockSingleFormProvider singleFormProvider = MockSingleFormProvider();

  final form = FormEntity(
    formTitle: 'Poda de Árvore 3',
    formId: 'ID1142342524244',
    creatorUserId: '1',
    userId: '1',
    vinculationFormId: null,
    template: 'Poda de Árvore 3',
    area: 'area',
    system: 'Gaia',
    street: 'Rua Samuel Morse 74',
    city: 'city',
    number: 1,
    latitude: 1.0,
    longitude: 1.0,
    region: 'region',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    priority: PriorityEnum.HIGH,
    status: FormStatusEnum.CONCLUDED,
    expirationDate: 1,
    creationDate: 1,
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
    sections: [
      SectionEntity(
        sectionId: 'section-01',
        fields: [
          TextFieldEntity(
            fieldType: FieldTypeEnum.TEXT_FIELD,
            placeholder: 'TextField 01',
            isRequired: true,
            key: 'key-section-01-1',
          ),
          TextFieldEntity(
            fieldType: FieldTypeEnum.TEXT_FIELD,
            placeholder: 'TextField 02',
            isRequired: true,
            key: 'key-section-01-2',
          ),
        ],
      ),
      SectionEntity(
        sectionId: 'section-02',
        fields: [
          TextFieldEntity(
            fieldType: FieldTypeEnum.TEXT_FIELD,
            placeholder: 'TextField 01',
            isRequired: true,
            key: 'key-section-02-1',
          ),
          TextFieldEntity(
            fieldType: FieldTypeEnum.TEXT_FIELD,
            placeholder: 'TextField 02',
            isRequired: true,
            key: 'key-section-02-2',
          ),
        ],
      ),
    ],
    canVinculate: true,
  );

  setUp(() {
    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());

    Modular.replaceInstance<SingleFormProvider>(singleFormProvider);

    when(singleFormProvider.form).thenReturn(form);
    when(singleFormProvider.isSendingForm).thenReturn(false);

    when(singleFormProvider.form).thenReturn(form);
  });

  testWidgets('FormSectionsPage Test', (WidgetTester tester) async {
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: FormSectionsPage(),
        ),
      );
    });

    // expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    expect(find.text(S.current.fillForm), findsOneWidget);

    expect(find.byType(StepperComponent), findsWidgets);

    expect(form.sections.length, 2);
  });
}
