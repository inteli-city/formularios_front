// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/generated/l10n.dart';

enum PriorityEnum {
  LOW,
  MEDIUM,
  HIGH,
  EMERGENCY;

  String get enumString {
    return S.current.priorityEnumSchema(this);
  }

  Color get color {
    switch (this) {
      case PriorityEnum.LOW:
        return AppColors.green;
      case PriorityEnum.MEDIUM:
        return AppColors.yellow;
      case PriorityEnum.HIGH:
        return AppColors.orange;
      case PriorityEnum.EMERGENCY:
        return AppColors.red;
      default:
        return AppColors.white;
    }
  }
}
