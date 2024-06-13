import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

abstract class IFetchFormsLocallyUsecase {
  Future<Either<Failure, List<FormEntity>>> call();
}

class FetchFormsLocallyUsecase implements IFetchFormsLocallyUsecase {
  final IFormRepository repository;

  FetchFormsLocallyUsecase({required this.repository});

  @override
  Future<Either<Failure, List<FormEntity>>> call() async {
    return await repository.getUserFormsLocally();
  }
}
