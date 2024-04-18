import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

abstract class IFetchUserFormsUsecase {
  Future<Either<Failure, List<FormEntity>>> call({required String userId});
}

class FetchUserFormsUsecase implements IFetchUserFormsUsecase {
  final IFormRepository repository;

  FetchUserFormsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<FormEntity>>> call(
      {required String userId}) async {
    return await repository.getUserForms(userId: userId);
  }
}
