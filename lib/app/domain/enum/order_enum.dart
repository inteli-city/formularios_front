// ignore_for_file: constant_identifier_names
import 'package:formularios_front/generated/l10n.dart';

enum OrderDateEnum {
  MAIS_RECENTE,
  MAIS_ANTIGO;

  String get enumString {
    return S.current.orderDateEnumSchema(this);
  }
}

enum OrderPriorityEnum {
  MAIOR_PRIORIDADE,
  MENOR_PRIORIDADE;

  String get enumString {
    return S.current.orderPriorityEnumSchema(this);
}
}