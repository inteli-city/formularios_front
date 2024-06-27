import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:logger/logger.dart';

class Failure implements Exception {
  String errorMessage;

  Failure({
    required this.errorMessage,
    StackTrace? stackTrace,
  }) {
    Modular.get<Logger>().e(
      errorMessage,
      time: DateTime.now(),
      error: this,
      stackTrace: stackTrace,
    );
  }
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({required String errorMessage})
      : super(
            errorMessage: S.current.localStorageErrorMessage('', errorMessage));
}

class NoInternetConnectionError extends Failure {
  NoInternetConnectionError()
      : super(errorMessage: S.current.noInternetConnectionErrorMessage);
}

class InQueueNoInternetConnectionError extends Failure {
  InQueueNoInternetConnectionError()
      : super(errorMessage: S.current.inQueueNoInternetConnectionErrorMessage);
}

class NoDataFound extends Failure {
  NoDataFound() : super(errorMessage: S.current.noDataFoundError);
}

class UnknownError extends Failure {
  final StackTrace? stackTrace;

  UnknownError({
    this.stackTrace,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: S.current.unknownError,
        );
}

class FetchFormsError extends Failure {
  FetchFormsError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class CompleteFormError extends Failure {
  CompleteFormError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class UpdateFormStatusError extends Failure {
  UpdateFormStatusError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class UserLoginError extends Failure {
  UserLoginError({
    required super.stackTrace,
    required super.errorMessage,
  });
}
