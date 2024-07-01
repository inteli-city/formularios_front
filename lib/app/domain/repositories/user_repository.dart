import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

abstract class IUserRepository {
  Future<Either<Failure, UserEntity>> loginUser();
}
