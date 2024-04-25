import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class IFormRepository {
  Future<Either<Failure, List<FormEntity>>> getUserForms(
      {required String userId});
}
