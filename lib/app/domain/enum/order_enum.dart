// ignore_for_file: constant_identifier_names
import 'package:formularios_front/generated/l10n.dart';

enum OrderEnum {
  PRIORIDADE_BAIXO_ALTO,
  PRIORIDADE_ALTO_BAIXO,
  // ROTEIRO,
  MAIS_RECENTE,
  MAIS_ANTIGO;

  String get enumString {
    return S.current.orderEnumSchema(this);
  }
}
