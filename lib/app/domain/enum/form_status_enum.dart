// ignore_for_file: constant_identifier_names

import 'package:formularios_front/generated/l10n.dart';

enum FormStatusEnum {
  NAO_INICIADO,
  EM_ANDAMENTO,
  CONCLUIDO;

  String get enumString {
    return S.current.formStatusEnumSchema(this);
  }
}
