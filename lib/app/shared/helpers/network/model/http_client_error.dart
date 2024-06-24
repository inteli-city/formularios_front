import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/generated/l10n.dart';

class HttpClientError extends Failure {
  HttpClientError(String? message, {super.stackTrace})
      : super(
          errorMessage: message ?? S.current.unknownError,
        );
}

class TimeOutError extends Failure {
  TimeOutError(String? message, {super.stackTrace})
      : super(
          errorMessage: message ?? S.current.unknownError,
        );
}
