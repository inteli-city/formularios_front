import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/data/datasources/user_datasource.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

class UserRepositoryImpl implements IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepositoryImpl(this._userDatasource);

  @override
  Future<Either<Failure, UserEntity>> loginUser() async {
    try {
      final result = await _userDatasource.loginUser();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }
}
