// ignore_for_file: constant_identifier_names

import 'package:formularios_front/generated/l10n.dart';

enum FormStatusEnum {
  NOT_STARTED,
  IN_PROGRESS,
  CONCLUDED,
  CANCELED;

  String get enumString {
    return S.current.formStatusEnumSchema(this);
  }
}
