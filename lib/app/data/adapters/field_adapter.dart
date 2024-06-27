import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';

class FieldAdapter {
  static List<FieldEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static FieldEntity fromJson(Map<String, dynamic> json) {
    switch (
        FieldTypeEnum.values.firstWhere((e) => e.name == json['field_type'])) {
      case FieldTypeEnum.TEXT_FIELD:
        return TextFieldEntity(
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          regex: json['regex'],
          formatting: json['formatting'],
          value: json['value'],
          maxLength: json['max_length'],
        );
      case FieldTypeEnum.NUMBER_FIELD:
        return NumberFieldEntity(
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          value: json['value'],
          minValue: json['min_value'],
          maxValue: json['max_value'],
          decimal: json['decimal'],
        );
      case FieldTypeEnum.DROPDOWN_FIELD:
        return DropDownFieldEntity(
          options: List<String>.from(json['options']),
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          value: json['value'],
        );
      case FieldTypeEnum.TYPEAHEAD_FIELD:
        return TypeAheadFieldEntity(
          options: List<String>.from(json['options']),
          maxLength: json['max_length'],
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          value: json['value'],
        );
      case FieldTypeEnum.RADIO_GROUP_FIELD:
        return RadioGroupFieldEntity(
          options: List<String>.from(json['options']),
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          value: json['value'],
        );
      case FieldTypeEnum.DATE_FIELD:
        return DateFieldEntity(
          minDate: DateTime.fromMillisecondsSinceEpoch(json['min_date']),
          maxDate: DateTime.fromMillisecondsSinceEpoch(json['max_date']),
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          value: json['value'] != null
              ? DateTime.fromMillisecondsSinceEpoch(json['value'])
              : json['value'],
        );
      case FieldTypeEnum.CHECKBOX_FIELD:
        return CheckBoxFieldEntity(
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          value: json['value'],
        );
      case FieldTypeEnum.CHECKBOX_GROUP_FIELD:
        return CheckBoxGroupFieldEntity(
          options: List<String>.from(json['options']),
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          value: json['value'] != null
              ? List<String>.from(json['value'])
              : json['value'],
        );
      case FieldTypeEnum.SWITCH_BUTTON_FIELD:
        return SwitchButtonFieldEntity(
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          value: json['value'],
        );
      case FieldTypeEnum.FILE_FIELD:
        return FileFieldEntity(
          placeholder: json['placeholder'],
          key: json['key'],
          isRequired: json['required'],
          value: json['value'] != null
              ? List<String>.from(json['value'])
              : json['value'],
          fileType: FileTypeEnum.values
              .firstWhere((e) => e.name.toUpperCase() == json['file_type']),
          minQuantity: json['min_quantity'],
          maxQuantity: json['max_quantity'],
        );
      default:
        throw Exception('Unsupported field type');
    }
  }

  static Map<String, dynamic> toJson(FieldEntity field) {
    switch (field.fieldType) {
      case FieldTypeEnum.TEXT_FIELD:
        field as TextFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'regex': field.regex,
          'formatting': field.formatting,
          'value': field.value,
          'max_length': field.maxLength,
        };
      case FieldTypeEnum.NUMBER_FIELD:
        field as NumberFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'value': field.value,
          'min_value': field.minValue,
          'max_value': field.maxValue,
          'decimal': field.decimal,
        };
      case FieldTypeEnum.DROPDOWN_FIELD:
        field as DropDownFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'options': field.options,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'value': field.value,
        };
      case FieldTypeEnum.TYPEAHEAD_FIELD:
        field as TypeAheadFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'options': field.options,
          'max_length': field.maxLength,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'value': field.value,
        };
      case FieldTypeEnum.RADIO_GROUP_FIELD:
        field as RadioGroupFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'options': field.options,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'value': field.value,
        };
      case FieldTypeEnum.DATE_FIELD:
        field as DateFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'min_date': field.minDate?.millisecondsSinceEpoch,
          'max_date': field.maxDate?.millisecondsSinceEpoch,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'value': field.value?.millisecondsSinceEpoch,
        };
      case FieldTypeEnum.CHECKBOX_FIELD:
        field as CheckBoxFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'value': field.value,
        };
      case FieldTypeEnum.CHECKBOX_GROUP_FIELD:
        field as CheckBoxGroupFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'options': field.options,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'value': field.value,
        };
      case FieldTypeEnum.SWITCH_BUTTON_FIELD:
        field as SwitchButtonFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'value': field.value,
        };
      case FieldTypeEnum.FILE_FIELD:
        field as FileFieldEntity;
        return {
          'field_type': field.fieldType.name,
          'placeholder': field.placeholder,
          'key': field.key,
          'required': field.isRequired,
          'value': field.value,
          'file_type': field.fileType.name,
          'min_quantity': field.minQuantity,
          'max_quantity': field.maxQuantity,
        };
      default:
        throw Exception('Unsupported field type');
    }
  }
}
