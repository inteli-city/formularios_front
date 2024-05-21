import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/data/repositories/user_mock_repository.dart';
import 'package:formularios_front/generated/l10n.dart';

void main() {
  late UserMockRepository repository;

  setUp(() {
    repository = UserMockRepository();
  });

  test('should return a UserEntity', () async {
    final result = await repository.loginUser();

    expect(result.isRight(), true);

    final loggedInUser = result.fold((left) => null, (right) => right);

    expect(loggedInUser, isA<UserEntity>());
    expect(loggedInUser?.userId, '125fb34e-aacf-4a47-9914-82ea64ff9f32');
    expect(loggedInUser?.enabled, true);
  });

  test('should return Failure when user is disabled', () async {
    Modular.bindModule(AppModule());
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    repository.user = UserEntity(
      userId: '125fb34e-aacf-4a47-9914-82ea64ff9f32',
      name: 'Gabriel Godoy',
      email: 'gabriel.godoybz@hotmail.com',
      enabled: false,
      role: RoleEnum.COORDINATOR,
      groups: ['groups'],
    );

    final result = await repository.loginUser();

    expect(result.isLeft(), true);

    final failure = result.fold((left) => left, (right) => null);

    expect(failure, isA<ErrorRequest>());
    expect((failure as ErrorRequest).message, 'Usuário desabilitado');
  });
}
