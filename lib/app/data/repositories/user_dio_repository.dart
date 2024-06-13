import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/data/models/user_model.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:formularios_front/app/shared/helpers/services/http_service.dart';

class UserDioRepository implements UserRepository {
  final IHttpService _httpService = Modular.get<IHttpService>();

  @override
  Future<Either<Failure, UserEntity>> loginUser() async {
    try {
      return await _httpService.post('/login-profile').then((response) {
        if (response.statusCode == 200) {
          return Right(UserModel.fromJson(response.data['profile']));
        }
        throw Exception();
      });
    } on DioException catch (e) {
      // HttpStatusCodeEnum errorType = getHttpStatusFunction(
      //   e.response?.statusCode ?? HttpStatus.badRequest,
      // );
      return left(ErrorRequest(message: e.message!));
    }
  }
}
