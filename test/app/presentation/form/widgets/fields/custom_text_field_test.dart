import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_text_field.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'custom_text_field_test.mocks.dart';

@GenerateMocks([FormController])
void main() {
  group('CustomTextFormField Tests', () {
    late FormController formController;

    setUp(
      () {
        Modular.bindModule(HomeModule());
        formController = MockFormController();
        Modular.replaceInstance<FormController>(formController);

        when(formController.isSendingForm).thenReturn(true);
      },
    );

    testWidgets('Displays initial value and placeholder',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = TextFieldEntity(
        placeholder: 'Enter text',
        key: 'testField',
        isRequired: true,
        maxLength: 10,
        value: 'Initial text',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextFormField(
              field: field,
              onChanged: (value) {},
              formController: formController,
            ),
          ),
        ),
      );

      expect(find.text('Initial text'), findsOneWidget);
      expect(find.text('Enter text'), findsOneWidget);
    });

    testWidgets('Displays required field error when clicking in send option',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);

      final field = TextFieldEntity(
        placeholder: 'Enter text',
        key: 'testField',
        isRequired: true,
      );
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    field: field,
                    onChanged: (value) {},
                    formController: formController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formController.setIsSendingForm(true);
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
        'Does not display required field error when field is filled and clicking in send option',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = TextFieldEntity(
        placeholder: 'Enter text',
        key: 'testField',
        isRequired: true,
      );
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    field: field,
                    onChanged: (value) {},
                    formController: formController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formController.setIsSendingForm(true);
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

      await tester.enterText(find.byType(TextFormField), 'text');
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();

      expect(find.text('Este campo é obrigatório'), findsNothing);
    });

    testWidgets('Validates regex pattern when clicking in sending form',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = TextFieldEntity(
        placeholder: 'Enter text',
        key: 'testField',
        isRequired: false,
        regex: r'^[a-zA-Z]+$',
      );
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    field: field,
                    onChanged: (value) {},
                    formController: formController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formController.setIsSendingForm(true);
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

      await tester.enterText(find.byType(TextFormField), '123');
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();

      expect(find.text('Formato inválido'), findsOneWidget);
    });
  });
}
