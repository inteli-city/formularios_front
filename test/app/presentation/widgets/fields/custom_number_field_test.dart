import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_number_field.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'custom_number_field_test.mocks.dart';

@GenerateMocks([FormController])
void main() {
  group('CustomNumberFormField Tests', () {
    late FormController formController;

    setUp(
      () {
        Modular.bindModule(HomeModule());
        formController = MockFormController();
        Modular.replaceInstance<FormController>(formController);

        when(formController.getIsSendingForm()).thenReturn(true);
      },
    );
    testWidgets('Displays initial value and placeholder',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = NumberFieldEntity(
        placeholder: 'Enter number',
        key: 'testField',
        isRequired: true,
        decimal: false,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomNumberFormField(
              field: field,
              onChanged: (value) {},
            ),
          ),
        ),
      );
      await tester.enterText(find.byType(TextFormField), '123');
      expect(find.text('123'), findsOneWidget);
      expect(find.text('Enter number'), findsOneWidget);
    });

    testWidgets('Displays required field error when clicking in send option',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = NumberFieldEntity(
        placeholder: 'Enter number',
        key: 'testField',
        isRequired: true,
        decimal: false,
      );
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomNumberFormField(
                    field: field,
                    onChanged: (value) {},
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
        'Does not display required field error when field is filled and clicking in send option ',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = NumberFieldEntity(
        placeholder: 'Enter number',
        key: 'testField',
        isRequired: true,
        decimal: false,
      );

      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomNumberFormField(
                    field: field,
                    onChanged: (value) {},
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

      expect(find.text('Este campo é obrigatório'), findsNothing);
    });

    testWidgets('Validates max value when clicking in send form',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = NumberFieldEntity(
        placeholder: 'Enter number',
        key: 'testField',
        isRequired: false,
        maxValue: 100,
        decimal: false,
      );
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomNumberFormField(
                    field: field,
                    onChanged: (value) {},
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

      await tester.enterText(find.byType(TextFormField), '101');
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();
      expect(find.text('Este campo deve ser menor que 100'), findsOneWidget);
    });

    testWidgets('Validates min value when clicking in send form',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = NumberFieldEntity(
        placeholder: 'Enter number',
        key: 'testField',
        isRequired: false,
        minValue: 10,
        decimal: false,
      );
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomNumberFormField(
                    field: field,
                    onChanged: (value) {},
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

      await tester.enterText(find.byType(TextFormField), '9');
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();
      print(find.byType(Text).evaluate().map((e) => e.widget).toList());

      expect(find.text('Este campo deve ser maior que 10'), findsOneWidget);
    });
  });
}
