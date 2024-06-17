import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';

abstract class ILoginUserUsecase {
  Future<Either<Failure, UserEntity>> call();
}

class LoginUserUsecase implements ILoginUserUsecase {
  final IUserRepository repository;

  LoginUserUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call() async {
    return await repository.loginUser();
  }
}