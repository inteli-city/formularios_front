import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/data/models/section_model.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/repositories/form_storage.dart';
import 'package:formularios_front/app/shared/helpers/services/http_service.dart';
import 'package:formularios_front/app/data/repositories/form_dio_repository.dart';

import 'form_dio_mock_repository_test.mocks.dart';

@GenerateMocks([IHttpService, IFormStorage])
void main() {
  late MockIHttpService mockHttpService;
  late MockIFormStorage mockFormStorage;
  late FormDioRepository repository;

  setUp(() {
    mockHttpService = MockIHttpService();
    mockFormStorage = MockIFormStorage();
    repository = FormDioRepository(mockHttpService, mockFormStorage);
    Modular.bindModule(HomeModule());
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

  final formModel = FormModel.fromEntity(form).toMap();
  group('getUserForms', () {
    test(
        'should return list of forms when the call to remote data source is successful',
        () async {
      final response = Response(
        data: {
          'form_list': [formModel],
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: '/get-form-by-user-id'),
      );

      when(mockHttpService.get(any)).thenAnswer((_) async => response);

      final result = await repository.getUserForms();

      expect(result, isA<Right>());
      expect(result.getOrElse(() => []), isNotEmpty);
    });

    test(
        'should return Failure when the call to remote data source is unsuccessful',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockHttpService.get(any)).thenThrow(DioException(
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
      when(mockFormStorage.getForms()).thenAnswer((_) async => []);

      final result = await repository.getUserFormsLocally();

      verify(mockFormStorage.getForms());

      expect(result, isA<Right>());
      expect(result.getOrElse(() => []), isEmpty);
    });

    test('should return Failure when there is an error accessing local storage',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockFormStorage.getForms())
          .thenThrow(Exception('Local storage error'));

      final result = await repository.getUserFormsLocally();

      expect(result, isA<Left>());
    });
  });

  group('postForm', () {
    test('should return FormEntity when the form is posted successfully',
        () async {
      final response = Response(
        data: {'form': formModel},
        statusCode: 200,
        requestOptions: RequestOptions(path: '/complete-form'),
      );

      when(mockHttpService.post('/complete-form', data: {
        'form_id': formModel['form_id'],
        'sections': formModel['sections'],
      })).thenAnswer((_) async => response);

      when(mockFormStorage.updateForm(form: formModel))
          .thenAnswer((_) async {});

      final result = await repository.postForm(
          formId: formModel['form_id'],
          sections: form.sections);

      expect(result, isA<Right>());
    });

    test('should return Failure when the form post is unsuccessful', () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockHttpService.post(any, data: anyNamed('data')))
          .thenThrow(DioException(
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
      when(mockFormStorage.updateForm(form: anyNamed('form')))
          .thenAnswer((_) async {});

      final result = await repository.updateFormLocally(form: form);

      expect(result, isA<Right>());
    });

    test('should return Failure when there is an error updating form locally',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockFormStorage.updateForm(form: anyNamed('form')))
          .thenThrow(Exception('Local storage error'));

      final result = await repository.updateFormLocally(form: form);

      expect(result, isA<Left>());
    });
  });

  group('updateFormStatus', () {
    test(
        'should return FormEntity when the form status is updated successfully',
        () async {
      final response = Response(
        data: {'form': formModel},
        statusCode: 200,
        requestOptions: RequestOptions(path: '/update-form-status'),
      );

      when(mockHttpService.post('/update-form-status', data: {
        'form_id': formModel['form_id'],
        'status': FormStatusEnum.CANCELED.name
      })).thenAnswer((_) async => response);

      when(mockFormStorage.updateForm(form: formModel))
          .thenAnswer((_) async {});

      final result = await repository.updateFormStatus(
          status: FormStatusEnum.CANCELED, formId: formModel['form_id']);

      expect(result, isA<Right>());
    });

    test('should return Failure when the form status update is unsuccessful',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      initializeDateFormatting();
      when(mockHttpService.post(any, data: anyNamed('data')))
          .thenThrow(DioException(
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
}
