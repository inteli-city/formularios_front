import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_date_field.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

import 'custom_date_field_test.mocks.dart';

@GenerateMocks([SingleFormProvider])
void main() {
  testWidgets('Teste básico do CustomDateFormField',
      (WidgetTester tester) async {
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    initializeDateFormatting();
    final mockFormController = MockFormController();
    when(mockFormController.isSendingForm).thenReturn(false);

    Modular.bindModule(HomeModule());
    Modular.replaceInstance<SingleFormProvider>(mockFormController);

    final field = DateFieldEntity(
      key: 'dateField',
      placeholder: 'Selecione uma data',
      value: DateTime(2021, 10, 10),
      isRequired: true,
      minDate: DateTime(2000),
      maxDate: DateTime(2100),
    );

    void onChanged(DateTime? value) {}

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', ''),
          Locale.fromSubtags(languageCode: 'zh')
        ],
        home: Scaffold(
          body: CustomDateFormField(
            field: field,
            onChanged: onChanged,
            formController: mockFormController,
          ),
        ),
      ),
    );

    expect(find.text('Selecione uma data'), findsOneWidget);

    expect(find.text('10/10/2021'), findsOneWidget);

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    expect(find.byType(DatePickerDialog), findsOneWidget);

    await tester.tap(find.text('15'));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.text('15/10/2021'), findsOneWidget);
  });
}
