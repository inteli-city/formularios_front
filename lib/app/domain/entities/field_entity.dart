import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';

abstract class FieldEntity {
  final FieldTypeEnum fieldType;
  final String placeholder;
  final bool isRequired;
  final String key;
  final String? regex;
  final String? formatting;

  FieldEntity({
    required this.fieldType,
    required this.placeholder,
    required this.isRequired,
    required this.key,
    this.regex,
    this.formatting,
  });
}

class TextFieldEntity extends FieldEntity {
  final int? maxLength;
  String? value;

  TextFieldEntity({
    this.maxLength,
    super.fieldType = FieldTypeEnum.TEXT_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    this.value,
  });
}

class NumberFieldEntity extends FieldEntity {
  final int? minValue;
  final int? maxValue;
  final bool decimal;
  double? value;

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
    this.value,
  });
}

class DropDownFieldEntity extends FieldEntity {
  final List<String> options;
  String? value;

  DropDownFieldEntity({
    required this.options,
    super.fieldType = FieldTypeEnum.DROPDOWN_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    this.value,
  });
}

class TypeAheadFieldEntity extends FieldEntity {
  final List<String> options;
  final int? maxLength;
  String? value;

  TypeAheadFieldEntity({
    required this.options,
    this.maxLength,
    super.fieldType = FieldTypeEnum.TYPEAHEAD_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    this.value,
  });
}

class RadioGroupFieldEntity extends FieldEntity {
  final List<String> options;
  String? value;

  RadioGroupFieldEntity({
    required this.options,
    super.fieldType = FieldTypeEnum.RADIO_GROUP_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    this.value,
  });
}

class DateFieldEntity extends FieldEntity {
  final DateTime? minDate;
  final DateTime? maxDate;
  DateTime? value;

  DateFieldEntity({
    this.minDate,
    this.maxDate,
    super.fieldType = FieldTypeEnum.DATE_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
    this.value,
  });
}

class CheckBoxFieldEntity extends FieldEntity {
  bool? value;

  CheckBoxFieldEntity({
    this.value,
    super.fieldType = FieldTypeEnum.CHECKBOX_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
  });
}

class CheckBoxGroupFieldEntity extends FieldEntity {
  final List<String> options;
  final int? checkLimit;
  List<String>? value;

  CheckBoxGroupFieldEntity({
    required this.options,
    this.value,
    this.checkLimit,
    super.fieldType = FieldTypeEnum.CHECKBOX_GROUP_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
  });
}

class SwitchButtonFieldEntity extends FieldEntity {
  bool? value;

  SwitchButtonFieldEntity({
    this.value,
    super.fieldType = FieldTypeEnum.SWITCH_BUTTON_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
  });
}

class FileFieldEntity extends FieldEntity {
  final FileTypeEnum fileType;
  final int minQuantity;
  final int maxQuantity;
  List<String>? value;

  FileFieldEntity({
    required this.fileType,
    required this.minQuantity,
    required this.maxQuantity,
    this.value,
    super.fieldType = FieldTypeEnum.FILE_FIELD,
    required super.placeholder,
    required super.key,
    super.regex,
    super.formatting,
    required super.isRequired,
  });
}
