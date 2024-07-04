import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/external/datasources/user_datasource_impl.dart';
import 'package:formularios_front/generated/l10n.dart';
// ignore: library_prefixes
import 'package:gates_microapp_flutter/generated/l10n.dart' as gatesL10n;

import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/http_clients/http_client.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/model/http_client_error.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/model/http_client_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/data/adapters/user_adapter.dart';
import 'package:formularios_front/app/domain/entities/user_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

import 'user_datasource_impl_test.mocks.dart';

@GenerateMocks([IHttpClient])
void main() {
  late UserDatasourceImpl datasource;
  late MockIHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockIHttpClient();
    datasource = UserDatasourceImpl(mockHttpClient);
    Modular.bindModule(AppModule());
  });

  group('UserDatasourceImpl', () {
    final userJson = {
      'profile_id': '123',
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'enabled': true,
      'role': 'COORDINATOR',
      'systems': ['GAIA', 'GAIA'],
    };

    final user = UserAdapter.fromJson(userJson);

    test('deve retornar UserEntity ao fazer login com sucesso', () async {
      when(mockHttpClient.post(any)).thenAnswer(
        (_) async => HttpClientResponse(
          data: {'profile': userJson},
          statusCode: 200,
        ),
      );

      final result = await datasource.loginUser();

      expect(result, isA<UserEntity>());
      expect(result.userId, user.userId);
      expect(result.name, user.name);
    });

    test('deve lançar NoInternetConnectionError em caso de TimeOutError',
        () async {
      await gatesL10n.S.load(const Locale.fromSubtags(languageCode: 'en'));
      when(mockHttpClient.post(any)).thenThrow(TimeOutError('Timeout'));

      expect(
        () async => await datasource.loginUser(),
        throwsA(isA<NoInternetConnectionError>()),
      );
    });

    test('deve lançar UserLoginError para outros erros', () async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));

      when(mockHttpClient.post(any)).thenThrow(
        HttpClientError('Erro ao fazer login'),
      );

      expect(
        () async => await datasource.loginUser(),
        throwsA(isA<UserLoginError>()),
      );
    });
  });
}
