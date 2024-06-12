import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/radio_group_field.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'radio_group_field_test.mocks.dart';

@GenerateMocks([SingleFormProvider])
void main() {
  SingleFormProvider singleFormProvider = MockSingleFormProvider();
  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());
  Modular.replaceInstance<SingleFormProvider>(singleFormProvider);
  group('CustomRadioGroupFormField Tests', () {
    setUp(() {
      when(singleFormProvider.isSendingForm).thenReturn(true);
    });

    testWidgets('Displays initial value and placeholder',
        (WidgetTester tester) async {
      final field = RadioGroupFieldEntity(
        placeholder: 'Choose an option',
        key: 'testRadioGroup',
        isRequired: true,
        options: ['Option 1', 'Option 2'],
        value: 'Option 1',
      );
      final section = SectionEntity(
        sectionId: 'testSection',
        fields: [field],
      );
      when(singleFormProvider.getFieldValue(section.sectionId, field.key))
          .thenReturn('Option 2');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomRadioGroupFormField(
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

      expect(find.text('Choose an option'), findsOneWidget);
      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Option 2'), findsOneWidget);
    });

    testWidgets('Selects an option and updates the form controller',
        (WidgetTester tester) async {
      final field = RadioGroupFieldEntity(
        placeholder: 'Choose an option',
        key: 'testRadioGroup',
        isRequired: true,
        options: ['Option 1', 'Option 2'],
        value: 'Option 1',
      );
      final section = SectionEntity(
        sectionId: 'testSection',
        fields: [field],
      );

      when(singleFormProvider.getFieldValue(section.sectionId, field.key))
          .thenReturn('Option 2');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomRadioGroupFormField(
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

      await tester.tap(find.text('Option 2'));
      await tester.pumpAndSettle();

      expect(singleFormProvider.getFieldValue(section.sectionId, field.key),
          'Option 2');
    });

    testWidgets(
        'Displays required field error when no option is selected and send option is clicked',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = RadioGroupFieldEntity(
        placeholder: 'Choose an option',
        key: 'testRadioGroup',
        isRequired: true,
        options: ['Option 1', 'Option 2'],
      );
      final section = SectionEntity(
        sectionId: 'testSection',
        fields: [field],
      );
      final formKey = GlobalKey<FormState>();

      when(singleFormProvider.getFieldValue(section.sectionId, field.key))
          .thenReturn('Option 2');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomRadioGroupFormField(
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

      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();

      expect(find.text('Este campo é obrigatório'), findsOneWidget);
    });

    testWidgets(
        'Does not display required field error when an option is selected and send option is clicked',
        (WidgetTester tester) async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = RadioGroupFieldEntity(
        placeholder: 'Choose an option',
        key: 'testRadioGroup',
        isRequired: true,
        options: ['Option 1', 'Option 2'],
      );
      final section = SectionEntity(
        sectionId: 'testSection',
        fields: [field],
      );
      final formKey = GlobalKey<FormState>();

      when(singleFormProvider.getFieldValue(section.sectionId, field.key))
          .thenReturn('Option 2');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomRadioGroupFormField(
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
      await tester.pumpAndSettle();
      await tester.tap(find.text('Option 1'));
      await tester.tap(find.text('Enviar'));

      expect(find.text('Este campo é obrigatório'), findsNothing);
    });
  });
}
