import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/data/models/section_model.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/repositories/form_storage.dart';
import 'package:formularios_front/app/shared/helpers/services/http_service.dart';

class FormDioRepository extends IFormRepository {
  final IHttpService _httpService;
  final IFormStorage _formStorage;
  FormDioRepository(this._httpService, this._formStorage);

  @override
  Future<Either<Failure, List<FormEntity>>> getUserForms() async {
    try {
      var response = await _httpService.get('/get-form-by-user-id');
      if (response.statusCode == 200) {
        // await _formStorage.saveForms(forms: response.data['form_list']);
        return Right(FormModel.fromMaps(response.data['form_list']));
      }
      throw Exception();
    } on DioException catch (e) {
      return left(ErrorRequest(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, FormEntity>> postForm(
      {required String formId,
      required List<SectionEntity> sections,
      String? vinculationFormId}) async {
    try {
      return await _httpService.post('/complete-form', data: {
        'form_id': formId,
        'sections':
            sections.map((e) => SectionModel.fromEntity(e).toMap()).toList(),
        'vinculation_form_id': vinculationFormId,
      }).then((response) async {
        if (response.statusCode == 200) {
          // await _formStorage.deleteForm(formId: formId);
          return Right(FormModel.fromMap(response.data['form']));
        }
        throw Exception();
      });
    } on DioException catch (e) {
      return left(ErrorRequest(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, FormEntity>> updateFormLocally({
    required FormEntity form,
  }) async {
    try {
      // await _formStorage.updateForm(form: FormModel.fromEntity(form).toMap());
      return Right(form);
    } catch (e) {
      return left(LocalStorageFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FormEntity>> updateFormStatus(
      {required FormStatusEnum status, required String formId}) async {
    try {
      return await _httpService.post('/update-form-status', data: {
        'form_id': formId,
        'status': status.name,
      }).then((response) async {
        if (response.statusCode == 200) {
          // await _formStorage.updateForm(form: response.data['form']);
          return Right(FormModel.fromMap(response.data['form']));
        }
        throw Exception();
      });
    } on DioException catch (e) {
      return left(ErrorRequest(message: e.message!));
    }
  }
}
