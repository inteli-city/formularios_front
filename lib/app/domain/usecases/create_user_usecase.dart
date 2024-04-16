import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class ICreateUserUsecase {
  Future<Either<Failure, UserEntity>> call(String name);
}

class CreateUserUsecase implements ICreateUserUsecase {
  final UserRepository repository;

  CreateUserUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(String name) async {
    return await repository.insert(name);
  }
}
