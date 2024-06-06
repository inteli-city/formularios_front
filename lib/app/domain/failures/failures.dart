import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:logger/logger.dart';

class Failure implements Exception {
  final String message;

  Failure({required this.message}) {
    Modular.get<Logger>().e(
      '${DateTime.now()} - $message',
      error: this,
      stackTrace: StackTrace.current,
    );
  }
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({required String message})
      : super(message: S.current.localStorageErrorMessage('', message));
}

class NoInternetConnection extends Failure {
  NoInternetConnection()
      : super(message: S.current.noInternetConnectionErrorMessage);
}

class ErrorRequest extends Failure {
  ErrorRequest({required String message})
      : super(message: S.current.requestErrorMessage('', message));
}

class NoItemsFound extends Failure {
  NoItemsFound({required String message})
      : super(message: S.current.noItemsFoundErrorMessage('', message));
}
