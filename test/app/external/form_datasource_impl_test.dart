import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/external/datasources/form_datasource_impl.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart' as gates_l10n;
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/http_clients/http_client.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/model/http_client_error.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/model/http_client_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/data/adapters/form_adapter.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

import 'user_datasource_impl_test.mocks.dart';

@GenerateMocks([IHttpClient])
void main() {
  late FormDatasourceImpl datasource;
  late MockIHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockIHttpClient();
    datasource = FormDatasourceImpl(mockHttpClient);
    Modular.bindModule(AppModule());
  });

  final formJson = {
    'form_id': '1',
    'creator_user_id': '123',
    'user_id': '456',
    'template': 'template1',
    'area': 'area1',
    'system': 'system1',
    'street': 'street1',
    'city': 'city1',
    'number': 1,
    'latitude': 12.34,
    'longitude': 56.78,
    'region': 'region1',
    'priority': 'HIGH',
    'status': 'CONCLUDED',
    'expiration_date': 1627849200000,
    'creation_date': 1627849200000,
    'sections': [
      {
        'section_id': 'section-id',
        'fields': [
          {
            'field_type': 'TEXT_FIELD',
            'placeholder': 'Placeholder Campo',
            'key': 'key',
            'required': true,
            'regex': 'regex',
            'formatting': 'formatting',
            'value': 'Initial value',
            'max_length': 100
          }
        ],
      }
    ],
    'comments': 'some comments',
    'description': 'some description',
    'conclusion_date': 1627849200000,
    'information_fields': [],
    'justification': {
      'options': [],
      'selected_option': '',
      'justification_text': '',
      'justification_image': '',
    },
    'start_date': 1627849200000,
    'vinculation_form_id': 'vinc1',
    'form_title': 'Form Title',
    'can_vinculate': true,
  };

  final form = FormAdapter.fromJson(formJson);

  final section = SectionEntity(sectionId: '1', fields: [
    TextFieldEntity(
      fieldType: FieldTypeEnum.TEXT_FIELD,
      placeholder: 'placeholder',
      key: 'key',
      isRequired: true,
      regex: r'^[a-zA-Z]+$',
      formatting: null,
      value: 'value',
      maxLength: 50,
    ),
  ]);

  group('FormDatasourceImpl', () {
    test('deve retornar lista de FormEntity ao buscar formulários do usuário',
        () async {
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => HttpClientResponse(
          data: {
            'form_list': [formJson]
          },
          statusCode: 200,
        ),
      );

      final result = await datasource.getUserForms();

      expect(result.length, 1);
      expect(result.first.formId, form.formId);
    });

    test(
        'deve lançar NoInternetConnection em caso de TimeOutError ao buscar formulários',
        () async {
      await gates_l10n.S.load(const Locale.fromSubtags(languageCode: 'pt'));

      when(mockHttpClient.get(any)).thenThrow(TimeOutError('Timeout'));

      expect(
        () async => await datasource.getUserForms(),
        throwsA(isA<NoInternetConnectionError>()),
      );
    });

    test('deve lançar FetchFormsError para outros erros ao buscar formulários',
        () async {
      when(mockHttpClient.get(any)).thenThrow(
        HttpClientError('Erro ao buscar formulários'),
      );

      expect(
        () async => await datasource.getUserForms(),
        throwsA(isA<FetchFormsError>()),
      );
    });

    test('deve retornar FormEntity ao enviar formulário', () async {
      when(mockHttpClient.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => HttpClientResponse(
          data: {'form': formJson},
          statusCode: 200,
        ),
      );

      final result =
          await datasource.postForm(formId: '123', sections: [section]);

      expect(result, isA<FormEntity>());
      expect(result.formId, form.formId);
    });

    test(
        'deve lançar InQueueNoInternetConnectionError em caso de TimeOutError ao enviar formulário',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));

      when(mockHttpClient.post(any, data: anyNamed('data')))
          .thenThrow(TimeOutError('Timeout'));

      expect(
        () async =>
            await datasource.postForm(formId: '123', sections: [section]),
        throwsA(isA<InQueueNoInternetConnectionError>()),
      );
    });

    test('deve lançar CompleteFormError para outros erros ao enviar formulário',
        () async {
      when(mockHttpClient.post(any, data: anyNamed('data'))).thenThrow(
        HttpClientError('Erro ao enviar formulário'),
      );

      expect(
        () async =>
            await datasource.postForm(formId: '123', sections: [section]),
        throwsA(isA<CompleteFormError>()),
      );
    });

    test('deve retornar FormEntity ao atualizar status do formulário',
        () async {
      when(mockHttpClient.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => HttpClientResponse(
          data: {'form': formJson},
          statusCode: 200,
        ),
      );

      final result = await datasource.updateFormStatus(
        formId: '123',
        status: FormStatusEnum.CONCLUDED,
      );

      expect(result, isA<FormEntity>());
      expect(result.formId, form.formId);
    });

    test(
        'deve lançar InQueueNoInternetConnectionError em caso de TimeOutError ao atualizar status do formulário',
        () async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));

      when(mockHttpClient.post(any, data: anyNamed('data')))
          .thenThrow(TimeOutError('Timeout'));

      expect(
        () async => await datasource.updateFormStatus(
          formId: '123',
          status: FormStatusEnum.CONCLUDED,
        ),
        throwsA(isA<InQueueNoInternetConnectionError>()),
      );
    });

    test(
        'deve lançar UpdateFormStatusError para outros erros ao atualizar status do formulário',
        () async {
      when(mockHttpClient.post(any, data: anyNamed('data'))).thenThrow(
        HttpClientError('Erro ao atualizar status do formulário'),
      );

      expect(
        () async => await datasource.updateFormStatus(
          formId: '123',
          status: FormStatusEnum.CONCLUDED,
        ),
        throwsA(isA<UpdateFormStatusError>()),
      );
    });
    group('createForm', () {
      test('deve retornar FormEntity ao criar um novo formulário', () async {
        when(mockHttpClient.post(any, data: anyNamed('data'))).thenAnswer(
          (_) async => HttpClientResponse(
            data: {'form': formJson},
            statusCode: 200,
          ),
        );

        final result = await datasource.createForm(
          form: FormEntity(
            formId: 'existent_form_id',
            userId: 'existent_user_id',
            sections: [
              SectionEntity(
                sectionId: 'section_id',
                fields: [
                  TextFieldEntity(
                    placeholder: 'placeholder',
                    key: 'key',
                    isRequired: true,
                  ),
                ],
              )
            ],
            latitude: 0,
            longitude: 0,
            number: 0,
            priority: PriorityEnum.EMERGENCY,
            region: 'region',
            status: FormStatusEnum.CANCELED,
            street: 'street',
            system: 'system',
            template: 'template',
            comments: null,
            conclusionDate: null,
            description: null,
            informationFields: null,
            startDate: null,
            vinculationFormId: null,
            area: 'area',
            canVinculate: false,
            city: 'city',
            creationDate: 0,
            creatorUserId: 'user_id',
            expirationDate: 0,
            formTitle: 'form_title',
            justification: JustificationEntity(
              options: [],
              selectedOption: null,
              justificationText: 'text',
              justificationImage: '',
            ),
          ),
        );

        expect(result, isA<FormEntity>());
        expect(result.formId, form.formId);
      });
      test('deve retornar erro ao tentar criar um novo formulário', () async {
        when(mockHttpClient.post(any, data: anyNamed('data'))).thenThrow(
          HttpClientError('Erro ao criar um novo formulário'),
        );

        expect(
          () async => await datasource.createForm(
              form: FormEntity(
            formId: 'existent_form_id',
            userId: 'existent_user_id',
            sections: [
              SectionEntity(
                sectionId: 'section_id',
                fields: [
                  TextFieldEntity(
                    placeholder: 'placeholder',
                    key: 'key',
                    isRequired: true,
                  ),
                ],
              )
            ],
            latitude: 0,
            longitude: 0,
            number: 0,
            priority: PriorityEnum.EMERGENCY,
            region: 'region',
            status: FormStatusEnum.CANCELED,
            street: 'street',
            system: 'system',
            template: 'template',
            comments: null,
            conclusionDate: null,
            description: null,
            informationFields: null,
            startDate: null,
            vinculationFormId: null,
            area: 'area',
            canVinculate: false,
            city: 'city',
            creationDate: 0,
            creatorUserId: 'user_id',
            expirationDate: 0,
            formTitle: 'form_title',
            justification: JustificationEntity(
              options: [],
              selectedOption: null,
              justificationText: 'text',
              justificationImage: '',
            ),
          )),
          throwsA(isA<CreateFormStatusError>()),
        );
      });
    });

    group('cancelForm', () {
      test('deve retornar FormEntity ao cancelar um formulário', () async {
        when(mockHttpClient.post(any, data: anyNamed('data'))).thenAnswer(
          (_) async => HttpClientResponse(
            data: {'form': formJson},
            statusCode: 200,
          ),
        );

        final result = await datasource.cancelForm(
            justification: JustificationEntity(
                options: [
                  JustificationOptionEntity(
                      option: 'Option 1',
                      requiredImage: true,
                      requiredText: true)
                ],
                selectedOption: 'selectedOption',
                justificationText: 'justificationText',
                justificationImage: 'justificationImage'),
            formId: '123');

        expect(result, isA<FormEntity>());
        expect(result.formId, form.formId);
      });

      test('deve retornar erro ao tentar cancelar um formulário', () async {
        when(mockHttpClient.post(any, data: anyNamed('data'))).thenThrow(
          HttpClientError('Erro ao cancelar um formulário'),
        );

        expect(
          () async => await datasource.cancelForm(
              justification: JustificationEntity(
                  options: [
                    JustificationOptionEntity(
                        option: 'Option 1',
                        requiredImage: true,
                        requiredText: true)
                  ],
                  selectedOption: 'selectedOption',
                  justificationText: 'justificationText',
                  justificationImage: 'justificationImage'),
              formId: '123'),
          throwsA(isA<CancelFormError>()),
        );
      });
    });
  });
}
