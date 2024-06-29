import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:formularios_front/app/domain/usecases/create_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/fetch_forms_locally_usecase.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/domain/usecases/save_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/send_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/update_form_usecase.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:gates_microapp_flutter/shared/helpers/functions/global_snackbar.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/home/states/form_user_state.dart';
import 'package:dartz/dartz.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

import 'forms_provider_test.mocks.dart';

@GenerateMocks([
  FetchUserFormsUsecase,
  FetchFormsLocallyUsecase,
  IUpdateFormStatusUseCase,
  FilterFormsController,
  ISendFormUsecase,
  ISaveFormUsecase,
  ICreateFormUsecase,
])
void main() {
  MockFilterFormsController mockFilterFormsController =
      MockFilterFormsController();
  late MockFetchUserFormsUsecase mockFetchUserFormsUsecase;
  late MockFetchFormsLocallyUsecase mockFetchFormsLocallyUsecase;
  late MockIUpdateFormStatusUseCase mockUpdateFormStatusUseCase;
  late MockISendFormUsecase mockSendFormUsecase;
  late MockISaveFormUsecase mockSaveFormUsecase;
  late MockICreateFormUsecase mockCreateFormUsecase;
  late FormsProvider provider;

  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());
  Modular.replaceInstance<FilterFormsController>(mockFilterFormsController);

  final forms = [
    FormEntity(
      formId: '1',
      creatorUserId: 'creatorUserId',
      userId: 'userId',
      vinculationFormId: 'vinculationFormId',
      template: 'template',
      area: 'area',
      system: 'system',
      street: 'street',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      description: 'description',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.IN_PROGRESS,
      expirationDate: 1,
      creationDate: 1,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
        justificationImage: null,
        options: [],
        selectedOption: '',
        justificationText: '',
      ),
      comments: 'comments',
      sections: [
        SectionEntity(sectionId: 'section-01', fields: [
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
        ])
      ],
      formTitle: 'formTitle',
      canVinculate: false,
    ),
    FormEntity(
      formId: '2',
      creatorUserId: 'creatorUserId2',
      userId: 'userId2',
      vinculationFormId: 'vinculationFormId2',
      template: 'template2',
      area: 'area2',
      system: 'system2',
      street: 'street2',
      city: 'city2',
      number: 2,
      latitude: 2.0,
      longitude: 2.0,
      region: 'region',
      description: 'description',
      priority: PriorityEnum.LOW,
      status: FormStatusEnum.CONCLUDED,
      expirationDate: 2,
      creationDate: 2,
      startDate: 2,
      conclusionDate: 2,
      justificative: JustificativeEntity(
        justificationImage: null,
        options: [],
        selectedOption: '',
        justificationText: '',
      ),
      comments: 'comments',
      sections: [
        SectionEntity(sectionId: 'section-01', fields: [
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
        ])
      ],
      formTitle: 'formTitle',
      canVinculate: false,
    ),
  ];
  setUp(() {
    mockFetchUserFormsUsecase = MockFetchUserFormsUsecase();
    when(mockFetchUserFormsUsecase.call())
        .thenAnswer((_) async => Right(forms));
    mockFetchFormsLocallyUsecase = MockFetchFormsLocallyUsecase();
    mockUpdateFormStatusUseCase = MockIUpdateFormStatusUseCase();
    mockSendFormUsecase = MockISendFormUsecase();
    mockSaveFormUsecase = MockISaveFormUsecase();
    mockCreateFormUsecase = MockICreateFormUsecase();

    provider = FormsProvider(
      mockFetchUserFormsUsecase,
      mockFetchFormsLocallyUsecase,
      mockUpdateFormStatusUseCase,
      mockSendFormUsecase,
      mockSaveFormUsecase,
      mockCreateFormUsecase,
    );
  });
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('fetchUserForms', () {
    test('should set state to FormUserSuccessState when fetch is successful',
        () async {
      await provider.syncForms();

      expect(provider.state, isA<FormUserSuccessState>());
      final state = provider.state as FormUserSuccessState;
      expect(state.forms, forms);
    });

    test(
        'should set state to FormUserSuccessState when fetch locally is successful',
        () async {
      when(mockFetchFormsLocallyUsecase.call())
          .thenAnswer((_) async => Right(forms));
      await provider.fetchFormsLocally();

      expect(provider.state, isA<FormUserSuccessState>());
      final state = provider.state as FormUserSuccessState;
      expect(state.forms, forms);
    });

    testWidgets('should set state to FormUserErrorState when fetch fails',
        (WidgetTester tester) async {
      final failure = UnknownError();
      when(mockFetchUserFormsUsecase.call())
          .thenAnswer((_) async => Left(failure));

      await tester.pumpWidget(createWidgetForTesting(child: Container()));
      await provider.syncForms();

      expect(provider.state, isA<FormUserErrorState>());
      final state = provider.state as FormUserErrorState;
      expect(state.error, failure);
    });
  });

  group('order forms | filter forms | getFormsCountByStatus', () {
    test('should return the number of forms by status', () async {
      when(mockFilterFormsController.activeFiltersAmount).thenReturn(0);
      await provider.syncForms();

      expect(provider.getFormsCountByStatus(forms[0].status), '1');
    });

    test('should filter forms by any filter', () async {
      await provider.syncForms();

      provider.filterForms(
          template: forms[0].template,
          street: forms[0].street,
          city: forms[0].city,
          system: forms[0].system,
          enumStatus: forms[0].status);

      expect((provider.state as FormUserSuccessState).forms.length, 1);
    });

    test('should order forms by any order', () async {
      await provider.syncForms();

      provider.orderForms(OrderEnum.PRIORIDADE_BAIXO_ALTO);

      expect((provider.state as FormUserSuccessState).forms[0], forms[1]);
    });
  });

  group('updateFormStatus', () {
    final form = FormEntity(
      formId: '1',
      creatorUserId: 'creatorUserId',
      userId: 'userId',
      vinculationFormId: 'vinculationFormId',
      template: 'template',
      area: 'area',
      system: 'system',
      street: 'street',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      description: 'description',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.IN_PROGRESS,
      expirationDate: 1,
      creationDate: 1,
      startDate: 1,
      conclusionDate: 1,
      justificative: JustificativeEntity(
          options: [],
          selectedOption: '',
          justificationText: '',
          justificationImage: null),
      comments: 'comments',
      sections: [
        SectionEntity(sectionId: 'section-01', fields: [
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
        ])
      ],
      formTitle: 'formTitle',
      canVinculate: false,
    );

    testWidgets(
        'should call updateFormStatus and fetchUserForms when update is successful',
        (WidgetTester tester) async {
      when(
        mockUpdateFormStatusUseCase.call(
          formId: anyNamed('formId'),
          status: anyNamed('status'),
        ),
      ).thenAnswer(
        (_) async => Right(form),
      );
      when(mockFetchUserFormsUsecase.call()).thenAnswer(
        (_) async => Right([form]),
      );

      await tester.pumpWidget(
        createWidgetForTesting(child: Container()),
      );
    });
  });
}
