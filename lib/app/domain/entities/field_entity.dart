import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';

abstract class FieldEntity {
  final FieldTypeEnum fieldType;
  final String placeholder;
  final bool isRequired;
  final String key;
  final String? regex;
  final String? formatting;
  dynamic value;

  FieldEntity({
    required this.fieldType,
    required this.placeholder,
    required this.isRequired,
    required this.key,
    this.regex,
    this.formatting,
    this.value,
  });
}

class TextFieldEntity extends FieldEntity {
  final int? maxLength;

  TextFieldEntity({
    this.maxLength,
    super.fieldType = FieldTypeEnum.TEXT_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    super.value,
  }) {
    if (value != null && value is! String) {
      throw Exception('Value must be a string');
    }
  }
}

class NumberFieldEntity extends FieldEntity {
  final int? minValue;
  final int? maxValue;
  final bool decimal;

  NumberFieldEntity({
    this.minValue,
    this.maxValue,
    required this.decimal,
    super.fieldType = FieldTypeEnum.NUMBER_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    super.value,
  }) {
    if (value != null && value is! double) {
      throw Exception('Value must be a number');
    }
  }
}

class DropDownFieldEntity extends FieldEntity {
  final List<String> options;

  DropDownFieldEntity({
    required this.options,
    super.fieldType = FieldTypeEnum.DROPDOWN_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    super.value,
  }) {
    if (value != null && value is! String) {
      throw Exception('Value must be a string');
    }
  }
}

class TypeAheadFieldEntity extends FieldEntity {
  final List<String> options;
  final int? maxLength;

  TypeAheadFieldEntity({
    required this.options,
    this.maxLength,
    super.fieldType = FieldTypeEnum.TYPEAHEAD_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    super.value,
  }) {
    if (value != null && value is! String) {
      throw Exception('Value must be a string');
    }
  }
}

class RadioGroupFieldEntity extends FieldEntity {
  final List<String> options;

  RadioGroupFieldEntity({
    required this.options,
    super.fieldType = FieldTypeEnum.RADIO_GROUP_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    super.value,
  }) {
    if (value != null && value is! String) {
      throw Exception('Value must be a string');
    }
  }
}

class DateFieldEntity extends FieldEntity {
  final DateTime? minDate;
  final DateTime? maxDate;

  DateFieldEntity({
    this.minDate,
    this.maxDate,
    super.fieldType = FieldTypeEnum.DATE_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    super.value,
  }) {
    if (value != null && value is! DateTime) {
      throw Exception('Value must be a DateTime');
    }
  }
}

class CheckBoxFieldEntity extends FieldEntity {
  CheckBoxFieldEntity({
    super.value,
    super.fieldType = FieldTypeEnum.CHECKBOX_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
  }) {
    if (value != null && value is! bool) {
      throw Exception('Value must be a boolean');
    }
  }
}

class CheckBoxGroupFieldEntity extends FieldEntity {
  final List<String> options;
  final int? checkLimit;

  CheckBoxGroupFieldEntity({
    required this.options,
    super.value,
    this.checkLimit,
    super.fieldType = FieldTypeEnum.CHECKBOX_GROUP_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
  }) {
    if (value != null && value is! List<String>) {
      throw Exception('Value must be a List<String>');
    }
  }
}

class SwitchButtonFieldEntity extends FieldEntity {
  SwitchButtonFieldEntity({
    super.value,
    super.fieldType = FieldTypeEnum.SWITCH_BUTTON_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
  }) {
    if (value != null && value is! bool) {
      throw Exception('Value must be a boolean');
    }
  }
}

class FileFieldEntity extends FieldEntity {
  final FileTypeEnum fileType;
  final int minQuantity;
  final int maxQuantity;

  FileFieldEntity({
    required this.fileType,
    required this.minQuantity,
    required this.maxQuantity,
    super.value,
    super.fieldType = FieldTypeEnum.FILE_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
  }) {
    if (value != null && value is! List<String>) {
      throw Exception('Value must be a List<String>');
    }
  }
}
