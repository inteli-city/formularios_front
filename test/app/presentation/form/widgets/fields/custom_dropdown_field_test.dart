import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_dropdown_field.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

import 'custom_dropdown_field_test.mocks.dart';

@GenerateMocks([SingleFormProvider])
void main() {
  late SingleFormProvider singleFormProvider;
  setUp(() {
    singleFormProvider = MockSingleFormProvider();
    when(singleFormProvider.isSendingForm).thenReturn(false);
    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());
    Modular.replaceInstance<SingleFormProvider>(singleFormProvider);
  });

  tearDown(() {
    Modular.destroy();
  });

  testWidgets('Teste do CustomDropDownFormField', (WidgetTester tester) async {
    final field = DropDownFieldEntity(
      placeholder: 'Select an option',
      value: null,
      options: ['Option 1', 'Option 2'],
      isRequired: true,
      key: '',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomDropDownFormField(
            field: field,
            onChanged: (value) {},
            singleFormProvider: singleFormProvider,
          ),
        ),
      ),
    );
    await tester.tap(find.byType(DropdownButtonFormField2<String>));
    await tester.pumpAndSettle();
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
  });
}
