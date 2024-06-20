import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';

abstract class FieldModel extends FieldEntity {
  FieldModel({
    required super.fieldType,
    required super.placeholder,
    required super.isRequired,
    required super.key,
    super.regex,
    super.formatting,
    super.value,
  });

  static List<FieldEntity> fromMaps(List array) {
    return array.map((e) => FieldModel.fromMap(e)).toList();
  }

  static FieldModel fromEntity(FieldEntity entity) {
    switch (entity.fieldType) {
      case FieldTypeEnum.TEXT_FIELD:
        return TextFieldModel.fromEntity(entity as TextFieldEntity);
      case FieldTypeEnum.NUMBER_FIELD:
        return NumberFieldModel.fromEntity(entity as NumberFieldEntity);
      case FieldTypeEnum.DROPDOWN_FIELD:
        return DropDownFieldModel.fromEntity(entity as DropDownFieldEntity);
      case FieldTypeEnum.TYPEAHEAD_FIELD:
        return TypeAheadFieldModel.fromEntity(entity as TypeAheadFieldEntity);
      case FieldTypeEnum.RADIO_GROUP_FIELD:
        return RadioGroupFieldModel.fromEntity(entity as RadioGroupFieldEntity);
      case FieldTypeEnum.DATE_FIELD:
        return DateFieldModel.fromEntity(entity as DateFieldEntity);
      case FieldTypeEnum.CHECKBOX_FIELD:
        return CheckBoxFieldModel.fromEntity(entity as CheckBoxFieldEntity);
      case FieldTypeEnum.CHECKBOX_GROUP_FIELD:
        return CheckBoxGroupFieldModel.fromEntity(
            entity as CheckBoxGroupFieldEntity);
      case FieldTypeEnum.SWITCH_BUTTON_FIELD:
        return SwitchButtonFieldModel.fromEntity(
            entity as SwitchButtonFieldEntity);
      case FieldTypeEnum.FILE_FIELD:
        return FileFieldModel.fromEntity(entity as FileFieldEntity);
      default:
        throw Exception('Unsupported field type');
    }
  }

  static FieldEntity fromMap(Map<String, dynamic> json) {
    switch (
        FieldTypeEnum.values.firstWhere((e) => e.name == json['field_type'])) {
      case FieldTypeEnum.TEXT_FIELD:
        return TextFieldModel.fromMap(json);
      case FieldTypeEnum.NUMBER_FIELD:
        return NumberFieldModel.fromMap(json);
      case FieldTypeEnum.DROPDOWN_FIELD:
        return DropDownFieldModel.fromMap(json);
      case FieldTypeEnum.TYPEAHEAD_FIELD:
        return TypeAheadFieldModel.fromMap(json);
      case FieldTypeEnum.RADIO_GROUP_FIELD:
        return RadioGroupFieldModel.fromMap(json);
      case FieldTypeEnum.DATE_FIELD:
        return DateFieldModel.fromMap(json);
      case FieldTypeEnum.CHECKBOX_FIELD:
        return CheckBoxFieldModel.fromMap(json);
      case FieldTypeEnum.CHECKBOX_GROUP_FIELD:
        return CheckBoxGroupFieldModel.fromMap(json);
      case FieldTypeEnum.SWITCH_BUTTON_FIELD:
        return SwitchButtonFieldModel.fromMap(json);
      case FieldTypeEnum.FILE_FIELD:
        return FileFieldModel.fromMap(json);
      default:
        throw Exception('Unsupported field type');
    }
  }

  Map<String, dynamic> toMap();
}

class TextFieldModel extends TextFieldEntity implements FieldModel {
  TextFieldModel({
    super.fieldType = FieldTypeEnum.TEXT_FIELD,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
    super.value,
    super.maxLength,
  });

  static TextFieldModel fromEntity(TextFieldEntity entity) {
    return TextFieldModel(
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
      maxLength: entity.maxLength,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'value': value,
      'max_length': maxLength,
    };
  }

  factory TextFieldModel.fromMap(Map<String, dynamic> json) {
    return TextFieldModel(
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'],
      maxLength: json['max_length'],
    );
  }
}

class NumberFieldModel extends NumberFieldEntity implements FieldModel {
  NumberFieldModel({
    super.fieldType = FieldTypeEnum.NUMBER_FIELD,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
    super.value,
    super.minValue,
    super.maxValue,
    required super.decimal,
  });

  static NumberFieldModel fromEntity(NumberFieldEntity entity) {
    return NumberFieldModel(
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
      minValue: entity.minValue,
      maxValue: entity.maxValue,
      decimal: entity.decimal,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'value': value,
      'min_value': minValue,
      'max_value': maxValue,
      'decimal': decimal,
    };
  }

  factory NumberFieldModel.fromMap(Map<String, dynamic> json) {
    return NumberFieldModel(
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'],
      minValue: json['min_value'],
      maxValue: json['max_value'],
      decimal: json['decimal'],
    );
  }
}

class DropDownFieldModel extends DropDownFieldEntity implements FieldModel {
  DropDownFieldModel({
    super.fieldType = FieldTypeEnum.DROPDOWN_FIELD,
    required super.options,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
    super.value,
  });

  static DropDownFieldModel fromEntity(DropDownFieldEntity entity) {
    return DropDownFieldModel(
      options: entity.options,
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
    );
  }

  factory DropDownFieldModel.fromMap(Map<String, dynamic> json) {
    return DropDownFieldModel(
      options: List<String>.from(json['options']),
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'options': options,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'value': value,
    };
  }
}

class TypeAheadFieldModel extends TypeAheadFieldEntity implements FieldModel {
  TypeAheadFieldModel({
    super.fieldType = FieldTypeEnum.TYPEAHEAD_FIELD,
    required super.options,
    super.maxLength,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
    super.value,
  });

  static TypeAheadFieldModel fromEntity(TypeAheadFieldEntity entity) {
    return TypeAheadFieldModel(
      options: entity.options,
      maxLength: entity.maxLength,
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
    );
  }

  factory TypeAheadFieldModel.fromMap(Map<String, dynamic> json) {
    return TypeAheadFieldModel(
      options: List<String>.from(json['options']),
      maxLength: json['max_length'],
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'options': options,
      'max_length': maxLength,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'value': value,
    };
  }
}

class RadioGroupFieldModel extends RadioGroupFieldEntity implements FieldModel {
  RadioGroupFieldModel({
    super.fieldType = FieldTypeEnum.RADIO_GROUP_FIELD,
    required super.options,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
    super.value,
  });

  static RadioGroupFieldModel fromEntity(RadioGroupFieldEntity entity) {
    return RadioGroupFieldModel(
      options: entity.options,
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
    );
  }

  factory RadioGroupFieldModel.fromMap(Map<String, dynamic> json) {
    return RadioGroupFieldModel(
      options: List<String>.from(json['options']),
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'options': options,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'value': value,
    };
  }
}

class DateFieldModel extends DateFieldEntity implements FieldModel {
  DateFieldModel({
    super.fieldType = FieldTypeEnum.DATE_FIELD,
    super.minDate,
    super.maxDate,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
    super.value,
  });

  static DateFieldModel fromEntity(DateFieldEntity entity) {
    return DateFieldModel(
      minDate: entity.minDate,
      maxDate: entity.maxDate,
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
    );
  }

  factory DateFieldModel.fromMap(Map<String, dynamic> json) {
    return DateFieldModel(
      minDate: DateTime.fromMillisecondsSinceEpoch(json['min_date']),
      maxDate: DateTime.fromMillisecondsSinceEpoch(json['max_date']),
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['value'])
          : json['value'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'min_date': minDate?.millisecondsSinceEpoch,
      'max_date': maxDate?.millisecondsSinceEpoch,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'value':
          value != null ? (value as DateTime).millisecondsSinceEpoch : value,
    };
  }
}

class CheckBoxFieldModel extends CheckBoxFieldEntity implements FieldModel {
  CheckBoxFieldModel({
    super.fieldType = FieldTypeEnum.CHECKBOX_FIELD,
    super.value,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
  });

  static CheckBoxFieldModel fromEntity(CheckBoxFieldEntity entity) {
    return CheckBoxFieldModel(
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
    );
  }

  factory CheckBoxFieldModel.fromMap(Map<String, dynamic> json) {
    return CheckBoxFieldModel(
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'value': value,
    };
  }
}

class CheckBoxGroupFieldModel extends CheckBoxGroupFieldEntity
    implements FieldModel {
  CheckBoxGroupFieldModel({
    super.fieldType = FieldTypeEnum.CHECKBOX_GROUP_FIELD,
    required super.options,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
    super.value,
  });

  factory CheckBoxGroupFieldModel.fromEntity(CheckBoxGroupFieldEntity entity) {
    return CheckBoxGroupFieldModel(
      options: entity.options,
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
    );
  }

  static CheckBoxGroupFieldModel fromMap(Map<String, dynamic> json) {
    return CheckBoxGroupFieldModel(
      options: List<String>.from(json['options']),
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'] != null
          ? List<String>.from(json['value'])
          : json['value'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'options': options,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'value': value,
    };
  }
}

class SwitchButtonFieldModel extends SwitchButtonFieldEntity
    implements FieldModel {
  SwitchButtonFieldModel({
    super.fieldType = FieldTypeEnum.SWITCH_BUTTON_FIELD,
    super.value,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
  });

  static SwitchButtonFieldModel fromEntity(SwitchButtonFieldEntity entity) {
    return SwitchButtonFieldModel(
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
    );
  }

  factory SwitchButtonFieldModel.fromMap(Map<String, dynamic> json) {
    return SwitchButtonFieldModel(
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'value': value,
    };
  }
}

class FileFieldModel extends FileFieldEntity implements FieldModel {
  FileFieldModel({
    super.fieldType = FieldTypeEnum.FILE_FIELD,
    required super.placeholder,
    required super.key,
    required super.isRequired,
    super.regex,
    super.formatting,
    super.value,
    required super.fileType,
    required super.minQuantity,
    required super.maxQuantity,
  });

  static FileFieldModel fromEntity(FileFieldEntity entity) {
    return FileFieldModel(
      placeholder: entity.placeholder,
      key: entity.key,
      isRequired: entity.isRequired,
      regex: entity.regex,
      formatting: entity.formatting,
      value: entity.value,
      fileType: entity.fileType,
      minQuantity: entity.minQuantity,
      maxQuantity: entity.maxQuantity,
    );
  }

  factory FileFieldModel.fromMap(Map<String, dynamic> json) {
    return FileFieldModel(
      placeholder: json['placeholder'],
      key: json['key'],
      isRequired: json['required'],
      regex: json['regex'],
      formatting: json['formatting'],
      value: json['value'] != null
          ? List<String>.from(json['value'])
          : json['value'],
      fileType: FileTypeEnum.values
          .firstWhere((e) => e.name.toUpperCase() == json['file_type']),
      minQuantity: json['min_quantity'],
      maxQuantity: json['max_quantity'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'field_type': fieldType.name,
      'placeholder': placeholder,
      'key': key,
      'required': isRequired,
      'regex': regex,
      'formatting': formatting,
      'file_type': fileType.name,
      'min_quantity': minQuantity,
      'max_quantity': maxQuantity,
      'value': value,
    };
  }
}
