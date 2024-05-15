import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/data/models/user_model.dart';
import 'package:formularios_front/app/data/repositories/user_dio_repository.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_dio_repository_test.mocks.dart';

@GenerateMocks([UserDioRepository])
void main() {
  late UserDioRepository mockUserDioRepository;
  late UserModel userModel;

  setUp(() {
    mockUserDioRepository = MockUserDioRepository();

    userModel = UserModel(
      userId: '125fb34e-aacf-4a47-9914-82ea64ff9f32',
      name: 'Gabriel Godoy',
      email: 'gabriel.godoybz@hotmail.com',
      enabled: true,
      role: RoleEnum.COORDINATOR,
      groups: ['groups'],
    );
  });

  Modular.bindModule(AppModule());

  test('should return a UserEntity', () async {
    when(mockUserDioRepository.loginUser())
        .thenAnswer((_) async => Right(userModel));

    final result = await mockUserDioRepository.loginUser();

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

    when(mockUserDioRepository.loginUser()).thenAnswer(
        (_) async => Left(ErrorRequest(message: 'Falha ao realizar login!')));

    final result = await mockUserDioRepository.loginUser();

    expect(result.isLeft(), true);
    expect(
      result.fold((failure) => failure, (user) => null),
      isA<ErrorRequest>(),
    );
    expect(
      result.fold((failure) => failure.message, (user) => null),
      'Falha ao realizar login!',
    );
  });
}
