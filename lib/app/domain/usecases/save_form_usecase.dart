import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

abstract class ISaveFormUsecase {
  Future<Either<Failure, FormEntity>> call({
    required FormEntity form,
  });
}

class SaveFormUsecase implements ISaveFormUsecase {
  final IFormRepository repository;

  SaveFormUsecase({required this.repository});

  @override
  Future<Either<Failure, FormEntity>> call({
    required FormEntity form,
  }) async {
    return await repository.updateFormLocally(
      form: form,
    );
  }
}
