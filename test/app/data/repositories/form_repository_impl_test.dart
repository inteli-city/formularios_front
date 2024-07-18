import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/data/adapters/form_adapter.dart';
import 'package:formularios_front/app/data/datasources/form_datasource.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/data/datasources/form_local_datasource.dart';
import 'package:formularios_front/app/data/repositories/form_repository_impl.dart';

import 'form_repository_impl_test.mocks.dart';

@GenerateMocks([IFormDatasource, IFormLocalDatasource])
void main() {
  late MockIFormDatasource mockFormDatasource;
  late MockIFormLocalDatasource mockFormLocalDatasource;
  late FormRepositoryImpl repository;

  setUp(() {
    Modular.bindModule(AppModule());
    mockFormDatasource = MockIFormDatasource();
    mockFormLocalDatasource = MockIFormLocalDatasource();
    repository =
        FormRepositoryImpl(mockFormDatasource, mockFormLocalDatasource);
  });

  final form = FormEntity(
    formTitle: 'formTitle',
    formId: 'formId',
    creatorUserId: 'creatorUserId',
    userId: 'userId',
    canVinculate: false,
    template: 'template',
    area: 'area',
    system: 'system',
    street: 'street',
    city: 'city',
    number: 0,
    latitude: 0,
    longitude: 0,
    region: ' region',
    priority: PriorityEnum.EMERGENCY,
    status: FormStatusEnum.CANCELED,
    expirationDate: 0,
    creationDate: 0,
    justificative: JustificativeEntity(
      options: [
        JustificativeOptionEntity(
            option: 'Option 1', requiredImage: true, requiredText: false),
      ],
      selectedOption: 'Option 1',
      justificationText: 'justificationText',
      justificationImage: 'justificationImage',
    ),
    sections: [
      SectionEntity(
        sectionId: 'section-01',
        fields: [
          TextFieldEntity(
            fieldType: FieldTypeEnum.TEXT_FIELD,
            placeholder: 'Texto',
            isRequired: true,
            key: 'text-field',
          ),
        ],
      ),
    ],
  );

  final formModel = FormAdapter.toJson(form);
  group('getUserForms', () {
    test(
        'should return list of forms when the call to remote data source is successful',
        () async {
      when(mockFormDatasource.getUserForms()).thenAnswer((_) async => [form]);

      final result = await repository.getUserForms();

      expect(result, isA<Right>());
      expect(result.getOrElse(() => []), isNotEmpty);
    });

    test(
        'should return Failure when the call to remote data source is unsuccessful',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockFormDatasource.getUserForms()).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/get-form-by-user-id'),
        response: Response(
          data: {'message': 'Error occurred'},
          statusCode: 400,
          requestOptions: RequestOptions(path: '/get-form-by-user-id'),
        ),
      ));

      final result = await repository.getUserForms();

      expect(result, isA<Left>());
    });
  });

  group('getUserFormsLocally', () {
    test('should return list of forms from local storage', () async {
      when(mockFormLocalDatasource.getForms()).thenAnswer((_) async => []);

      final result = await repository.getUserFormsLocally();

      verify(mockFormLocalDatasource.getForms());

      expect(result, isA<Right>());
      expect(result.getOrElse(() => []), isEmpty);
    });

    test('should return Failure when there is an error accessing local storage',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockFormLocalDatasource.getForms())
          .thenThrow(Exception('Local storage error'));

      final result = await repository.getUserFormsLocally();

      expect(result, isA<Left>());
    });
  });

  group('postForm', () {
    test('should return FormEntity when the form is posted successfully',
        () async {
      when(mockFormDatasource.postForm(
        formId: form.formId,
        sections: form.sections,
      )).thenAnswer((_) async => form);

      when(mockFormLocalDatasource.updateForm(form: form))
          .thenAnswer((_) async {});

      final result = await repository.postForm(
          formId: formModel['form_id'], sections: form.sections);

      expect(result, isA<Right>());
    });

    test('should return Failure when the form post is unsuccessful', () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockFormDatasource.postForm(
        formId: '1',
        sections: [],
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/complete-form'),
        response: Response(
          data: {'message': 'Error occurred'},
          statusCode: 400,
          requestOptions: RequestOptions(path: '/complete-form'),
        ),
      ));

      final result = await repository.postForm(formId: '1', sections: []);

      expect(result, isA<Left>());
    });
  });

  group('updateFormLocally', () {
    test('should return FormEntity when the form is updated locally', () async {
      when(mockFormLocalDatasource.updateForm(form: anyNamed('form')))
          .thenAnswer((_) async {});

      final result = await repository.updateFormLocally(form: form);

      expect(result, isA<Right>());
    });

    test('should return Failure when there is an error updating form locally',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockFormLocalDatasource.updateForm(form: anyNamed('form')))
          .thenThrow(Exception('Local storage error'));

      final result = await repository.updateFormLocally(form: form);

      expect(result, isA<Left>());
    });
  });

  group('updateFormStatus', () {
    test(
        'should return FormEntity when the form status is updated successfully',
        () async {
      when(mockFormDatasource.updateFormStatus(
              formId: form.formId, status: FormStatusEnum.CANCELED))
          .thenAnswer((_) async => form);

      when(mockFormLocalDatasource.updateForm(form: form))
          .thenAnswer((_) async {});

      final result = await repository.updateFormStatus(
          status: FormStatusEnum.CANCELED, formId: formModel['form_id']);

      expect(result, isA<Right>());
    });

    test('should return Failure when the form status update is unsuccessful',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockFormDatasource.updateFormStatus(
        status: FormStatusEnum.CANCELED,
        formId: '1',
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/update-form-status'),
        response: Response(
          data: {'message': 'Error occurred'},
          statusCode: 400,
          requestOptions: RequestOptions(path: '/update-form-status'),
        ),
      ));

      final result = await repository.updateFormStatus(
          status: FormStatusEnum.CANCELED, formId: '1');

      expect(result, isA<Left>());
    });
  });

  group('createForm', () {
    test('should return FormEntity when form creation is successful', () async {
      // Arrange
      when(mockFormDatasource.createForm(form: form))
          .thenAnswer((_) async => form);
      when(mockFormLocalDatasource.addForm(form: form))
          .thenAnswer((_) async {});

      // Act
      final result = await repository.createForm(form: form);

      // Assert
      expect(result, Right(form));
      verify(mockFormDatasource.createForm(form: form));
      verify(mockFormLocalDatasource.addForm(form: form));
      verifyNoMoreInteractions(mockFormDatasource);
      verifyNoMoreInteractions(mockFormLocalDatasource);
    });

    test('should return Failure when datasource throws Failure', () async {
      final failure = UnknownError();
      when(mockFormDatasource.createForm(form: form)).thenThrow(failure);

      final result = await repository.createForm(form: form);

      expect(result, Left(failure));
      verify(mockFormDatasource.createForm(form: form));
      verifyZeroInteractions(mockFormLocalDatasource);
      verifyNoMoreInteractions(mockFormDatasource);
    });

    test('should return UnknownError when an exception is thrown', () async {
      final exception = Exception('Unexpected error');
      when(mockFormDatasource.createForm(form: form)).thenThrow(exception);

      final result = await repository.createForm(form: form);

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<UnknownError>()),
        (_) => fail('Expected a failure'),
      );
      verify(mockFormDatasource.createForm(form: form));
      verifyZeroInteractions(mockFormLocalDatasource);
      verifyNoMoreInteractions(mockFormDatasource);
    });
  });
}
