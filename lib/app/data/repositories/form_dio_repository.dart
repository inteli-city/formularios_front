import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/shared/helpers/services/http_service.dart';

class FormDioRepository implements IFormRepository {
  final IHttpService _httpService = Modular.get<IHttpService>();

  @override
  Future<Either<Failure, List<FormEntity>>> getUserForms(
      {required String userId}) async {
    try {
      return _httpService.get('/get-form-by-user-id').then((response) {
        if (response.statusCode == 200) {
          return Right(FormModel.fromMaps(response.data['forms']));
        }
        throw Exception();
      });
    } on DioException catch (e) {
      return left(ErrorRequest(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, FormEntity>> updateFormStatus(
      {required FormStatusEnum status, required String formId}) async {
    try {
      return _httpService.post('/update-form-status', data: {
        'status': status.index,
        'formId': formId,
      }).then((response) {
        if (response.statusCode == 200) {
          return Right(FormModel.fromMap(response.data['form']));
        }
        throw Exception();
      });
    } on DioException catch (e) {
      return left(ErrorRequest(message: e.message!));
    }
  }
}
