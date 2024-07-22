import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

abstract class ICancelFormUseCase {
  Future<Either<Failure, JustificativeEntity>> call(
      {required JustificativeEntity justificative, required String formId});
}

class CancelFormUseCase implements ICancelFormUseCase {
  final IFormRepository repository;

  CancelFormUseCase({required this.repository});

  @override
  Future<Either<Failure, JustificativeEntity>> call(
      {required JustificativeEntity justificative,
      required String formId}) async {
    return await repository.cancelForm(
        formId: formId, justificative: justificative);
  }
}
