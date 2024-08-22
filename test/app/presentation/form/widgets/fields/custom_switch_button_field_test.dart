import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_switch_button_field.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'custom_switch_button_field_test.mocks.dart';

@GenerateMocks([FormsProvider, SingleFormProvider, FormEntity])
void main() {
  SingleFormProvider singleFormProvider = MockSingleFormProvider();
  late FormEntity formEntity;

  MockFormsProvider mockProvider = MockFormsProvider();
  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());
  Modular.replaceInstance<FormsProvider>(mockProvider);
  Modular.replaceInstance<SingleFormProvider>(singleFormProvider);
  group('CustomSwitchButtonField Tests', () {
    setUp(() {
      formEntity = MockFormEntity();
      when(formEntity.formId).thenReturn('externForm1');
      when(formEntity.sections).thenReturn([]);
      when(mockProvider.getFormByExternId(any)).thenReturn(formEntity);
    });

    testWidgets('Displays initial value and placeholder',
        (WidgetTester tester) async {
      final field = SwitchButtonFieldEntity(
        placeholder: 'Enable feature',
        key: 'testSwitch',
        isRequired: true,
        value: false,
      );
      final section = SectionEntity(
        sectionId: 'testSection',
        fields: [field],
      );

      when(singleFormProvider.getFieldValue(section.sectionId, field.key))
          .thenReturn(true);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSwitchButtonField(
              field: field,
              onChanged: (value) {
                singleFormProvider.setFieldValue(
                    section.sectionId, field.key, value);
              },
              sectionEntity: section,
              singleFormProvider: singleFormProvider,
            ),
          ),
        ),
      );

      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('Toggles switch value when clicked',
        (WidgetTester tester) async {
      final field = SwitchButtonFieldEntity(
        placeholder: 'Enable feature',
        key: 'testSwitch',
        isRequired: true,
        value: false,
      );
      final section = SectionEntity(
        sectionId: 'testSection',
        fields: [field],
      );

      when(singleFormProvider.getFieldValue(section.sectionId, field.key))
          .thenReturn(true);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSwitchButtonField(
              field: field,
              onChanged: (value) {
                singleFormProvider.setFieldValue(
                    section.sectionId, field.key, value);
              },
              sectionEntity: section,
              singleFormProvider: singleFormProvider,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(
          singleFormProvider.getFieldValue(section.sectionId, field.key), true);
    });

    testWidgets(
        'Does not display required field error when switch is on and Enviar is clicked',
        (WidgetTester tester) async {
      final field = SwitchButtonFieldEntity(
        placeholder: 'Enable feature',
        key: 'testSwitch',
        isRequired: true,
        value: false,
      );
      final section = SectionEntity(
        sectionId: 'testSection',
        fields: [field],
      );
      final formKey = GlobalKey<FormState>();

      when(singleFormProvider.getFieldValue(section.sectionId, field.key))
          .thenReturn(true);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomSwitchButtonField(
                    field: field,
                    onChanged: (value) {
                      singleFormProvider.setFieldValue(
                          section.sectionId, field.key, value);
                    },
                    sectionEntity: section,
                    singleFormProvider: singleFormProvider,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      singleFormProvider.setIsSendingForm(true);
                      formKey.currentState!.validate();
                    },
                    child: const Text('Enviar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();

      expect(find.text('Este campo é obrigatório'), findsNothing);
    });
  });
}
