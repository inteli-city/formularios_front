import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/create-form/states/template_state.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/create-form/stores/template_provider.dart';
import 'package:formularios_front/app/domain/usecases/get_templates_usecase.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:dartz/dartz.dart';

import 'template_provider_test.mocks.dart';

@GenerateMocks([IGetTemplatesUsecase, FormsProvider])
void main() {
  late MockIGetTemplatesUsecase mockGetTemplatesUsecase;
  late MockFormsProvider mockFormsProvider;

  setUp(() {
    mockGetTemplatesUsecase = MockIGetTemplatesUsecase();
    mockFormsProvider = MockFormsProvider();
    Modular.bindModule(AppModule());
  });

  final templates = [
    TemplateEntity(
      canVinculate: true,
      formTitle: 'Form Title',
      justificative: JustificativeEntity(
          options: [
            JustificativeOptionEntity(
                option: 'option', requiredImage: true, requiredText: true)
          ],
          selectedOption: null,
          justificationText: 'justificationText',
          justificationImage: 'justificationImage'),
      template: '',
      system: '',
      sections: [
        SectionEntity(sectionId: '123', fields: [
          TextFieldEntity(
              placeholder: 'placeholder', key: 'kye', isRequired: true)
        ])
      ],
    ),
  ];

  test('Should start with initial state', () {
    when(mockGetTemplatesUsecase.call())
        .thenAnswer((_) async => Right(templates));
    final provider =
        TemplateProvider(mockGetTemplatesUsecase, mockFormsProvider);
    expect(provider.state, isA<TemplateLoadingState>());
  });

  group('fetchTemplates', () {
    test('Should emit loading and then success state', () async {
      when(mockGetTemplatesUsecase.call())
          .thenAnswer((_) async => Right(templates));
      final provider =
          TemplateProvider(mockGetTemplatesUsecase, mockFormsProvider);

      expectLater(provider.state, isA<TemplateLoadingState>());
      await provider.fetchTemplates();
      expect(provider.state, isA<TemplateSuccessState>());
      expect(provider.templates, equals(templates));
    });

    test('Should emit loading and then error state on failure', () async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));
      when(mockGetTemplatesUsecase.call())
          .thenAnswer((_) async => Left(UnknownError()));
      
      final provider =
          TemplateProvider(mockGetTemplatesUsecase, mockFormsProvider);

      await Future.delayed(const Duration(seconds: 1));

      expect(provider.state, isA<TemplateErrorState>());
    });
  });

  group('createForm', () {
    test('Should handle createForm action correctly', () async {
      when(mockFormsProvider.createForm(
        template: templates[0],
        area: anyNamed('area'),
        city: anyNamed('city'),
        street: anyNamed('street'),
        number: anyNamed('number'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
        region: anyNamed('region'),
        priority: anyNamed('priority'),
        description: anyNamed('description'),
      )).thenAnswer((_) async => const Right('Form Created'));
      when(mockGetTemplatesUsecase.call())
          .thenAnswer((_) async => Right(templates));
      final provider =
          TemplateProvider(mockGetTemplatesUsecase, mockFormsProvider);

      await provider.createForm(
        template: templates[0],
        area: "Test Area",
        city: "Test City",
        street: "Test Street",
        number: 123,
        latitude: 1.23,
        longitude: 4.56,
        region: "Test Region",
        priority: PriorityEnum.LOW,
        description: "Test Description",
      );

      verify(mockFormsProvider.createForm(
        template: templates[0],
        area: "Test Area",
        city: "Test City",
        street: "Test Street",
        number: 123,
        latitude: 1.23,
        longitude: 4.56,
        region: "Test Region",
        priority: PriorityEnum.LOW,
        description: "Test Description",
      )).called(1);
      expect(provider.isLoading, isFalse);
    });
  });
}
