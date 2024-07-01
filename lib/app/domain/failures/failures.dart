import 'package:formularios_front/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

class InQueueNoInternetConnectionError extends Failure {
  InQueueNoInternetConnectionError()
      : super(errorMessage: S.current.inQueueNoInternetConnectionErrorMessage);
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

class CreateFormStatusError extends Failure {
  CreateFormStatusError({
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
