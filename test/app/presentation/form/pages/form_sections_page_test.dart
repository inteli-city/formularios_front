import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/form/widgets/section/section_form.dart';
import 'package:formularios_front/app/presentation/form/widgets/stepper/stepper_progress.dart';
import 'package:mockito/annotations.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/form/controllers/stepper_controller.dart';
import 'package:formularios_front/app/presentation/form/pages/form_sections_page.dart';
import 'package:mockito/mockito.dart';

import 'form_sections_page_test.mocks.dart';

@GenerateMocks([FormController, StepperController])
void main() {
  MockFormController formController = MockFormController();
  StepperController stepperController = MockStepperController();
  ScrollController scrollController = ScrollController();

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
      text: null,
      image: null,
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

    Modular.replaceInstance<FormController>(formController);
    Modular.replaceInstance<StepperController>(stepperController);

    when(formController.form).thenReturn(form);
    when(formController.isSendingForm).thenReturn(false);
    when(stepperController.currentStep).thenReturn(0);
    when(stepperController.listViewController).thenReturn(scrollController);

    when(formController.form).thenReturn(form);
    when(stepperController.listViewController).thenReturn(ScrollController());
  });

  testWidgets('FormSectionsPage Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FormSectionsPage(),
      ),
    );
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    expect(find.text('Poda de Árvore 3 - Poda de Árvore 3'), findsOneWidget);

    expect(find.byType(StepperProgress), findsOneWidget);

    expect(form.sections.length, 2);
  });
}
