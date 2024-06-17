import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:formularios_front/app/domain/usecases/login_user_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_user_usecase_test.mocks.dart';


@GenerateMocks([IUserRepository])
void main() {
  Modular.bindModule(AppModule());
  late MockIUserRepository mockUserRepository;
  late LoginUserUsecase usecase;

  setUp(() {
    mockUserRepository = MockIUserRepository();
    usecase = LoginUserUsecase(repository: mockUserRepository);
  });

  group('InitializedUserFormStatus', () {
    final userEntity = UserEntity(
        name: 'Test User',
        userId: '123',
        email: 'test@example.com',
        enabled: false,
        role: RoleEnum.COORDINATOR,
        groups: []);
    final failure = Failure(message: 'Login Failed');

    test('should return UserEntity when login is successful', () async {
      when(mockUserRepository.loginUser())
          .thenAnswer((_) async => Right(userEntity));

      final result = await usecase.call();

      expect(result.isRight(), true);
      expect(result.fold((l) => null, (r) => r), isA<UserEntity>());
      expect(result.fold((l) => null, (r) => r.userId), '123');
    });

    test('should return Failure when login fails', () async {
      when(mockUserRepository.loginUser())
          .thenAnswer((_) async => Left(failure));

      final result = await usecase.call();

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => null), isA<Failure>());
      verify(mockUserRepository.loginUser());
    });
  });
}
