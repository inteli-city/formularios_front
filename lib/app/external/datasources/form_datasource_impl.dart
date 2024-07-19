import 'dart:async';

import 'package:formularios_front/app/data/adapters/form_adapter.dart';
import 'package:formularios_front/app/data/adapters/justificative_adapter.dart';
import 'package:formularios_front/app/data/adapters/section_adapter.dart';
import 'package:formularios_front/app/data/datasources/form_datasource.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/http_clients/http_client.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/model/http_client_error.dart';

class FormDatasourceImpl implements IFormDatasource {
  final IHttpClient _httpClient;

  FormDatasourceImpl(this._httpClient);

  @override
  Future<List<FormEntity>> getUserForms() async {
    try {
      final response = await _httpClient.get('/get-form-by-user-id');
      return FormAdapter.fromJsonList(response.data['form_list']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnectionError();
      } else {
        throw FetchFormsError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<FormEntity> postForm({
    required String formId,
    required List<SectionEntity> sections,
    String? vinculationFormId,
  }) async {
    try {
      final response = await _httpClient.post(
        '/complete-form',
        data: {
          'form_id': formId,
          'sections': sections.map((e) => SectionAdapter.toJson(e)).toList(),
        },
      );

      return FormAdapter.fromJson(response.data['form']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw InQueueNoInternetConnectionError();
      } else {
        throw CompleteFormError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<FormEntity> updateFormStatus({
    required FormStatusEnum status,
    required String formId,
  }) async {
    try {
      final response = await _httpClient.post(
        '/update-form-status',
        data: {
          'form_id': formId,
          'status': status.name,
        },
      );

      return FormAdapter.fromJson(response.data['form']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw InQueueNoInternetConnectionError();
      } else {
        throw UpdateFormStatusError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<FormEntity> createForm({required FormEntity form}) async {
    try {
      var json = FormAdapter.toJson(form);

      json.remove('user_id');

      final response = await _httpClient.post(
        '/create-form',
        data: json,
      );

      return FormAdapter.fromJson(response.data['form']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnectionError();
      } else {
        throw CreateFormStatusError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<JustificativeEntity> cancelForm(
      {required JustificativeEntity justificative,
      required String formId}) async {
    try {
      await updateFormStatus(status: FormStatusEnum.CANCELED, formId: formId);

      final response = await _httpClient.post(
        '/cancel-form',
        data: {
          'form_id': formId,
          'selected_option': justificative.selectedOption,
          "justification_text": justificative.justificationText,
          "justification_image": justificative.justificationImage,
        },
      );

      return JustificativeAdapter.fromJson(response.data['justificative']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw InQueueNoInternetConnectionError();
      } else {
        throw UpdateFormStatusError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }
}
