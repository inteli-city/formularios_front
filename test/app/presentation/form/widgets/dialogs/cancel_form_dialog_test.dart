import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/dialogs/cancel_form_dialog.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'cancel_form_dialog_test.mocks.dart';

@GenerateMocks([
  SingleFormProvider,
  FormsProvider,
  CancelFormController,
  IModularNavigator
])
void main() {
  late SingleFormProvider mockSingleFormProvider;
  late FormsProvider mockFormsProvider;
  late IModularNavigator navigator;
  late CancelFormController cancelFormController;

  setUp(() {
    mockSingleFormProvider = MockSingleFormProvider();
    mockFormsProvider = MockFormsProvider();
    cancelFormController = MockCancelFormController();
    navigator = MockIModularNavigator();

    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());

    Modular.replaceInstance<SingleFormProvider>(mockSingleFormProvider);
    Modular.replaceInstance<FormsProvider>(mockFormsProvider);
    Modular.replaceInstance<CancelFormController>(cancelFormController);

    Modular.navigatorDelegate = navigator;
  });

  testWidgets('CancelFormDialog shows title and close button',
      (WidgetTester tester) async {
    JustificationEntity justification = JustificationEntity(
      options: [
        JustificationOptionEntity(
            option: 'Option 1', requiredImage: false, requiredText: true),
      ],
      justificationImage: 'image',
      justificationText: 'text',
      selectedOption: null,
    );

    await S.load(const Locale.fromSubtags(languageCode: 'en'));

    when(cancelFormController.selectedOption)
        .thenReturn(justification.options.first);

    when(mockSingleFormProvider.form).thenReturn(FormEntity(
      formId: '123',
      justification: justification,
      formTitle: 'formTitle',
      area: 'area',
      canVinculate: false,
      city: 'city',
      creationDate: 0,
      creatorUserId: 'id',
      expirationDate: 1,
      latitude: 0.0,
      longitude: 0.0,
      number: 0,
      priority: PriorityEnum.HIGH,
      region: 'region',
      sections: [
        SectionEntity(
          fields: [
            TextFieldEntity(
                placeholder: 'placeholder', key: 'key', isRequired: true)
          ],
          sectionId: 'sectionId',
        ),
      ],
      status: FormStatusEnum.CONCLUDED,
      street: 'street',
      system: 'system',
      template: 'template',
      userId: 'userId',
      vinculationFormId: 'vinculationFormId',
      description: 'description',
      startDate: 0,
      conclusionDate: 0,
      comments: 'comments',
      informationFields: null,
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SingleFormProvider>.value(
              value: mockSingleFormProvider),
          ChangeNotifierProvider<FormsProvider>.value(value: mockFormsProvider),
          Provider<CancelFormController>.value(value: cancelFormController),
        ],
        child: const MaterialApp(
          home: CancelFormDialog(),
        ),
      ),
    );

    expect(find.text('Preencher Justificativa'), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
  });

  testWidgets('CancelFormDialog shows dropdown and updates selection',
      (WidgetTester tester) async {
    JustificationEntity justification = JustificationEntity(
      options: [
        JustificationOptionEntity(
            option: 'Option 1', requiredImage: true, requiredText: true),
      ],
      justificationImage: 'image',
      justificationText: 'text',
      selectedOption: null,
    );

    await S.load(const Locale.fromSubtags(languageCode: 'en'));

    when(cancelFormController.selectedOption)
        .thenReturn(justification.options.first);

    when(mockSingleFormProvider.form).thenReturn(
      FormEntity(
        formId: '123',
        justification: justification,
        formTitle: 'formTitle',
        area: 'area',
        canVinculate: false,
        city: 'city',
        creationDate: 0,
        creatorUserId: 'id',
        expirationDate: 1,
        latitude: 0.0,
        longitude: 0.0,
        number: 0,
        priority: PriorityEnum.HIGH,
        region: 'region',
        sections: [
          SectionEntity(
            fields: [
              TextFieldEntity(
                  placeholder: 'placeholder', key: 'key', isRequired: true)
            ],
            sectionId: 'sectionId',
          ),
        ],
        status: FormStatusEnum.CONCLUDED,
        street: 'street',
        system: 'system',
        template: 'template',
        userId: 'userId',
        vinculationFormId: 'vinculationFormId',
        description: 'description',
        startDate: 0,
        conclusionDate: 0,
        comments: 'comments',
        informationFields: null,
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SingleFormProvider>.value(
              value: mockSingleFormProvider),
          ChangeNotifierProvider<FormsProvider>.value(value: mockFormsProvider),
          Provider<CancelFormController>.value(value: cancelFormController),
        ],
        child: const MaterialApp(
          home: CancelFormDialog(),
        ),
      ),
    );

    expect(find.byType(DropdownButtonFormField2<JustificationOptionEntity>),
        findsOneWidget);

    await tester
        .tap(find.byType(DropdownButtonFormField2<JustificationOptionEntity>));

    await tester.pumpAndSettle();

    await tester.tap(find.text('Option 1').first);

    await tester.pumpAndSettle();

    expect(cancelFormController.selectedOption,
        mockSingleFormProvider.form.justification.options.first);
  });

  testWidgets('should display justification image',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(2000, 2000));
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));

    
  });
}
