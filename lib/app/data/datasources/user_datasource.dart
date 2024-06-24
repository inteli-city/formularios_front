import 'package:formularios_front/app/domain/entities/user_entity.dart';

abstract class IUserDatasource {
  Future<UserEntity> loginUser();
}
