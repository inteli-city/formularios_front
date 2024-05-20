import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

abstract class UpdateFormStatusUseCase {
  Future<Either<Failure, FormEntity>> call(
      {required FormStatusEnum status, required String formId});
}

class InitiliazeUserFormStatusUseCase implements UpdateFormStatusUseCase {
  final IFormRepository repository;

  InitiliazeUserFormStatusUseCase({required this.repository});

  @override
  Future<Either<Failure, FormEntity>> call(
      {required FormStatusEnum status, required String formId}) async {
    return await repository.updateFormStatus(
      formId: formId,
      status: status,
    );
  }
}
