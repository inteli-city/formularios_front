import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/shared/helpers/network/model/http_client_error.dart';
import 'package:formularios_front/generated/l10n.dart';

void main() {
  setUp(() async {
    Modular.bindModule(AppModule());
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });
  group('HttpClientError', () {
    test('should use provided message', () {
      const message = 'Erro de cliente HTTP';
      final error = HttpClientError(message);

      expect(error.errorMessage, message);
    });

    test('should use default message when no message provided', () async {
      final error = HttpClientError(null);

      expect(error.errorMessage, S.current.unknownError);
    });
  });

  group('TimeOutError', () {
    test('should use provided message', () {
      const message = 'Tempo esgotado';
      final error = TimeOutError(message);

      expect(error.errorMessage, message);
    });

    test('should use default message when no message provided', () async {
      final error = TimeOutError(null);

      expect(error.errorMessage, S.current.unknownError);
    });
  });
}
