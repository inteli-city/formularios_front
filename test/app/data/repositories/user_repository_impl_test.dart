import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/data/repositories/user_repository_impl.dart';
import 'package:formularios_front/app/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/data/datasources/user_datasource.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([IUserDatasource])
void main() {
  late UserRepositoryImpl repository;
  late MockIUserDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockIUserDatasource();
    repository = UserRepositoryImpl(mockDatasource);
    Modular.bindModule(AppModule());
  });
  group('loginUser', () {
    final user = UserEntity(
      email: 'email',
      enabled: false,
      groups: ['group'],
      name: 'name',
      role: RoleEnum.COORDINATOR,
      userId: 'id',
    );

    test('should return UserEntity when login is successful', () async {
      when(mockDatasource.loginUser()).thenAnswer((_) async => user);

      final result = await repository.loginUser();

      expect(result, Right(user));
      verify(mockDatasource.loginUser());
      verifyNoMoreInteractions(mockDatasource);
    });

    test('should return Failure when datasource throws Failure', () async {
      S.load(const Locale.fromSubtags(languageCode: 'en'));

      final failure = UnknownError();
      when(mockDatasource.loginUser()).thenThrow(failure);

      final result = await repository.loginUser();

      expect(result, Left(failure));
      verify(mockDatasource.loginUser());
      verifyNoMoreInteractions(mockDatasource);
    });

    test('should return UnknownError when datasource throws an exception',
        () async {
      S.load(const Locale.fromSubtags(languageCode: 'en'));

      final exception = Exception('Unexpected error');
      when(mockDatasource.loginUser()).thenThrow(exception);

      final result = await repository.loginUser();

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<UnknownError>()),
        (_) => fail('Expected a failure'),
      );
      verify(mockDatasource.loginUser());
      verifyNoMoreInteractions(mockDatasource);
    });
  });
}
