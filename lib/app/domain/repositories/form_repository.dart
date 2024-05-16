import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class IFormRepository {
  Future<Either<Failure, List<FormEntity>>> getUserForms(
      {required String userId});

  Future<Either<Failure, FormEntity>> updateFormStatus({
    required FormStatusEnum status,
    required String externFormId,
  });
}
