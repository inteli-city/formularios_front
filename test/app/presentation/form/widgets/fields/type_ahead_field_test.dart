import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/type_ahead_field.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'type_ahead_field_test.mocks.dart';

@GenerateMocks([SingleFormProvider])
void main() {
  SingleFormProvider singleFormProvider = MockSingleFormProvider();
  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());
  Modular.replaceInstance<SingleFormProvider>(singleFormProvider);

  group('CustomTypeAheadFormField Tests', () {
    setUp(() {
      when(singleFormProvider.isFormStateLoading).thenReturn(true);
    });
    testWidgets('Displays initial value and placeholder',
        (WidgetTester tester) async {
      final field = TypeAheadFieldEntity(
        placeholder: 'Enter text',
        key: 'testTypeAhead',
        isRequired: true,
        options: ['Option 1', 'Option 2'],
        value: 'Initial value',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTypeAheadFormField(
              field: field,
              onChanged: (value) {},
              singleFormProvider: singleFormProvider,
            ),
          ),
        ),
      );

      expect(find.text('Initial value'), findsOneWidget);
    });

    testWidgets('Displays suggestions when typing',
        (WidgetTester tester) async {
      final field = TypeAheadFieldEntity(
        placeholder: 'Enter text',
        key: 'testTypeAhead',
        isRequired: true,
        options: ['Option 1', 'Option 2'],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTypeAheadFormField(
              field: field,
              onChanged: (value) {},
              singleFormProvider: singleFormProvider,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Option');
      await tester.pumpAndSettle();

      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Option 2'), findsOneWidget);
    });

    testWidgets('Selects a suggestion and updates the controller',
        (WidgetTester tester) async {
      final field = TypeAheadFieldEntity(
        placeholder: 'Enter text',
        key: 'testTypeAhead',
        isRequired: true,
        options: ['Option 1', 'Option 2'],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTypeAheadFormField(
              field: field,
              onChanged: (value) {},
              singleFormProvider: singleFormProvider,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Option');

      await tester.pumpAndSettle();

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(find.text('Option 1'), findsOneWidget);
    });

    testWidgets(
        'Displays required field error when no text is entered and send option is clicked',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1500, 1500));
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting('pt_BR', null);
      final field = TypeAheadFieldEntity(
        placeholder: 'Enter text',
        key: 'testTypeAhead',
        isRequired: true,
        options: ['Option 1', 'Option 2'],
      );
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTypeAheadFormField(
                    field: field,
                    onChanged: (value) {},
                    singleFormProvider: singleFormProvider,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      singleFormProvider.setIsFormStateLoading(true);
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
        'Does not display required field error when text is entered and send option is clicked',
        (WidgetTester tester) async {
      final field = TypeAheadFieldEntity(
        placeholder: 'Enter text',
        key: 'testTypeAhead',
        isRequired: true,
        options: ['Option 1', 'Option 2'],
      );
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTypeAheadFormField(
                    field: field,
                    onChanged: (value) {},
                    singleFormProvider: singleFormProvider,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      singleFormProvider.setIsFormStateLoading(true);
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

      await tester.enterText(find.byType(TextFormField), 'Option 1');
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();

      expect(find.text('Este campo é obrigatório'), findsNothing);
    });
  });
}
