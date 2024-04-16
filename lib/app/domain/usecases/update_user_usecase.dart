import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class IUpdateUserUsecase {
  Future<Either<Failure, UserEntity>> call(UserEntity user);
}

class UpdateUserUsecase implements IUpdateUserUsecase {
  final UserRepository repository;

  UpdateUserUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.update(user);
  }
}
