import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

abstract class IIntiliazeUserFormStatusUseCase {
  Future<Either<Failure, FormEntity>> call({required FormEntity form});
}

class IntiliazeUserFormStatusUseCase
    implements IIntiliazeUserFormStatusUseCase {
  final IFormRepository repository;

  IntiliazeUserFormStatusUseCase({required this.repository});

  @override
  Future<Either<Failure, FormEntity>> call({required FormEntity form}) async {
    return await repository.initializeUserFormStatus(form: form);
  }
}
