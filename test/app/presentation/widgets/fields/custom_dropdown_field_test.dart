import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/fields/custom_dropdown_field.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

import 'custom_dropdown_field_test.mocks.dart';

@GenerateMocks([FormController])
void main() {
  late MockFormController mockFormController;
  setUp(() {
    mockFormController = MockFormController();
    when(mockFormController.getIsSendingForm()).thenReturn(false);
    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());
    Modular.replaceInstance<FormController>(mockFormController);
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
      regex: r'^[a-zA-Z]+$',
      key: '',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomDropDownFormField(
            field: field,
            onChanged: (value) {},
          ),
        ),
      ),
    );

    expect(find.text('Select an option'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField2<String>));
    await tester.pumpAndSettle();
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
  });
}
