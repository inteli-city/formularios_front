import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_mock_repository_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  Modular.bindModule(AppModule());

  late MockUserRepository mockUserRepository;
  late UserEntity userEntity;

  setUp(() {
    mockUserRepository = MockUserRepository();
    userEntity = UserEntity(
      userId: '125fb34e-aacf-4a47-9914-82ea64ff9f32',
      name: 'Gabriel Godoy',
      email: 'gabriel.godoybz@hotmail.com',
      enabled: true,
      role: RoleEnum.COORDINATOR,
      groups: ['groups'],
    );
  });

  test('should return user entity when user is enabled', () async {
    when(mockUserRepository.loginUser())
        .thenAnswer((_) async => Right(userEntity));

    final result = await mockUserRepository.loginUser();

    expect(result.isRight(), true);
    expect(
      result.fold((left) => null, (user) => user),
      isA<UserEntity>(),
    );
    expect(
      result.fold((left) => null, (user) => user.userId),
      '125fb34e-aacf-4a47-9914-82ea64ff9f32',
    );
  });

  test('should return Failure when user is disabled', () async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));

    when(mockUserRepository.loginUser()).thenAnswer(
        (_) async => Left(ErrorRequest(message: 'Usuário desabilitado')));

    final result = await mockUserRepository.loginUser();

    expect(result.isLeft(), true);
    expect(
      result.fold((failure) => failure, (user) => null),
      isA<ErrorRequest>(),
    );
    expect(
      result.fold((failure) => failure.message, (user) => null),
      'Usuário desabilitado',
    );
  });
}
