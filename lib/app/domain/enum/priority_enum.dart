// ignore_for_file: constant_identifier_names

import 'package:formularios_front/generated/l10n.dart';

enum PriorityEnum {
  LOW,
  MEDIUM,
  HIGH,
  EMERCENCY;

  String get enumString {
    return S.current.priorityEnumSchema(this);
  }
}
