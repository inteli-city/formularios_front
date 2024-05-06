import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';

class UserRepositoryMock implements UserRepository {
  UserEntity user = UserEntity(
    userId: '125fb34e-aacf-4a47-9914-82ea64ff9f32',
    name: 'Gabriel Godoy',
    email: 'gabriel.godoybz@hotmail.com',
    enabled: true,
    role: RoleEnum.COORDINATOR,
    groups: ['groups'],
  );

  @override
  Future<Either<Failure, UserEntity>> loginUser() async {
    Future.delayed(const Duration(seconds: 2));
    if (user.enabled == false) {
      return Left(ErrorRequest(message: 'Usuário desabilitado'));
    }
    return Right(user);
  }
}
