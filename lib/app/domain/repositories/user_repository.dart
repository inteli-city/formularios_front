import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> loginUser();
}
