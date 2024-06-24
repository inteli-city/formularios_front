import 'package:formularios_front/app/data/datasources/user_datasource.dart';
import 'package:formularios_front/app/data/models/user_model.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/shared/helpers/network/http_clients/http_client.dart';
import 'package:formularios_front/app/shared/helpers/network/model/http_client_error.dart';

class UserDatasourceImpl implements IUserDatasource {
  final IHttpClient _httpClient;

  UserDatasourceImpl(this._httpClient);
  @override
  Future<UserEntity> loginUser() async {
    try {
      final response = await _httpClient.post('/login-profile');

      return UserModel.fromMap(response.data['profile']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw UserLoginError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }
}
