import 'package:formularios_front/app/data/datasources/form_datasource.dart';
import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/data/models/section_model.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/shared/helpers/network/http_clients/http_client.dart';
import 'package:formularios_front/app/shared/helpers/network/model/http_client_error.dart';

class FormDatasourceImpl implements IFormDatasource {
  final IHttpClient _httpClient;

  FormDatasourceImpl(this._httpClient);

  @override
  Future<List<FormEntity>> getUserForms() async {
    try {
      final response = await _httpClient.get('/get-form-by-user-id');

      return FormModel.fromMaps(response.data['form_list']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
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
      final response = await _httpClient.post('/complete-form', data: {
        'form_id': formId,
        'sections':
            sections.map((e) => SectionModel.fromEntity(e).toMap()).toList(),
      });

      return FormModel.fromMap(response.data['form']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw CompleteFormError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<FormEntity> updateFormStatus(
      {required FormStatusEnum status, required String formId}) async {
    try {
      final response = await _httpClient.post('/update-form-status', data: {
        'form_id': formId,
        'status': status.name,
      });

      return FormModel.fromMap(response.data['form']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw UpdateFormStatusError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }
}
