import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/adapters/field_adapter.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';

void main() {
  group('FieldAdapter', () {
    test('should parse JSON to TextFieldEntity', () {
      final json = {
        'field_type': 'TEXT_FIELD',
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'regex': r'^[a-zA-Z]+$',
        'formatting': null,
        'value': 'value',
        'max_length': 50,
      };

      final field = FieldAdapter.fromJson(json) as TextFieldEntity;

      expect(field.fieldType, FieldTypeEnum.TEXT_FIELD);
      expect(field.placeholder, 'placeholder');
      expect(field.key, 'key');
      expect(field.isRequired, true);
      expect(field.regex, r'^[a-zA-Z]+$');
      expect(field.formatting, null);
      expect(field.value, 'value');
      expect(field.maxLength, 50);
    });

    test('should parse JSON to NumberFieldEntity', () {
      final json = {
        'field_type': 'NUMBER_FIELD',
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'value': 25.0,
        'min_value': 18,
        'max_value': 99,
        'decimal': false,
      };

      final field = FieldAdapter.fromJson(json) as NumberFieldEntity;

      expect(field.fieldType, FieldTypeEnum.NUMBER_FIELD);
      expect(field.placeholder, 'placeholder');
      expect(json['key'], 'key');
      expect(field.isRequired, true);
      expect(field.value, 25.0);
      expect(field.minValue, 18);
      expect(field.maxValue, 99);
      expect(field.decimal, false);
    });

    test('should convert TextFieldEntity to JSON', () {
      final field = TextFieldEntity(
        fieldType: FieldTypeEnum.TEXT_FIELD,
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        regex: r'^[a-zA-Z]+$',
        formatting: null,
        value: 'John',
        maxLength: 50,
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'TEXT_FIELD');
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['regex'], r'^[a-zA-Z]+$');
      expect(json['formatting'], null);
      expect(json['value'], 'John');
      expect(json['max_length'], 50);
    });

    test('should convert NumberFieldEntity to JSON', () {
      final field = NumberFieldEntity(
        fieldType: FieldTypeEnum.NUMBER_FIELD,
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: 25.0,
        minValue: 18,
        maxValue: 99,
        decimal: false,
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'NUMBER_FIELD');
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], 25.0);
      expect(json['min_value'], 18);
      expect(json['max_value'], 99);
      expect(json['decimal'], false);
    });

    test('should parse JSON list to FieldEntity list', () {
      final jsonList = [
        {
          'field_type': 'TEXT_FIELD',
          'placeholder': 'placeholder',
          'key': 'key',
          'required': true,
          'regex': r'^[a-zA-Z]+$',
          'formatting': null,
          'value': 'John',
          'max_length': 50,
        },
        {
          'field_type': 'NUMBER_FIELD',
          'placeholder': 'placeholder',
          'key': 'key',
          'required': true,
          'value': 25.0,
          'min_value': 18,
          'max_value': 99,
          'decimal': false,
        }
      ];

      final fields = FieldAdapter.fromJsonList(jsonList);

      expect(fields.length, 2);
      expect(fields[0], isA<TextFieldEntity>());
      expect(fields[1], isA<NumberFieldEntity>());
    });

    test('should parse JSON to DropDownFieldEntity', () {
      final json = {
        'field_type': 'DROPDOWN_FIELD',
        'options': ['Option 1', 'Option 2'],
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'value': 'Option 1',
      };

      final field = FieldAdapter.fromJson(json) as DropDownFieldEntity;

      expect(field.fieldType, FieldTypeEnum.DROPDOWN_FIELD);
      expect(field.options, ['Option 1', 'Option 2']);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(field.isRequired, true);
      expect(field.value, 'Option 1');
    });

    test('should parse JSON to TypeAheadFieldEntity', () {
      final json = {
        'field_type': 'TYPEAHEAD_FIELD',
        'options': ['Option 1', 'Option 2'],
        'max_length': 30,
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'value': 'Option 1',
      };

      final field = FieldAdapter.fromJson(json) as TypeAheadFieldEntity;

      expect(field.fieldType, FieldTypeEnum.TYPEAHEAD_FIELD);
      expect(field.options, ['Option 1', 'Option 2']);
      expect(field.maxLength, 30);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(field.isRequired, true);
      expect(field.value, 'Option 1');
    });

    test('should parse JSON to RadioGroupFieldEntity', () {
      final json = {
        'field_type': 'RADIO_GROUP_FIELD',
        'options': ['Option 1', 'Option 2'],
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'value': 'Option 1',
      };

      final field = FieldAdapter.fromJson(json) as RadioGroupFieldEntity;

      expect(field.fieldType, FieldTypeEnum.RADIO_GROUP_FIELD);
      expect(field.options, ['Option 1', 'Option 2']);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(field.isRequired, true);
      expect(field.value, 'Option 1');
    });

    test('should parse JSON to DateFieldEntity', () {
      final json = {
        'field_type': 'DATE_FIELD',
        'min_date': 1622520000000,
        'max_date': 1625108400000,
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'value': 1622606400000,
      };

      final field = FieldAdapter.fromJson(json) as DateFieldEntity;

      expect(field.fieldType, FieldTypeEnum.DATE_FIELD);
      expect(field.minDate, DateTime.fromMillisecondsSinceEpoch(1622520000000));
      expect(field.maxDate, DateTime.fromMillisecondsSinceEpoch(1625108400000));
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(field.isRequired, true);
      expect(field.value, DateTime.fromMillisecondsSinceEpoch(1622606400000));
    });

    test('should parse JSON to CheckBoxFieldEntity', () {
      final json = {
        'field_type': 'CHECKBOX_FIELD',
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'value': true,
      };

      final field = FieldAdapter.fromJson(json) as CheckBoxFieldEntity;

      expect(field.fieldType, FieldTypeEnum.CHECKBOX_FIELD);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(field.isRequired, true);
      expect(field.value, true);
    });

    test('should parse JSON to CheckBoxGroupFieldEntity', () {
      final json = {
        'field_type': 'CHECKBOX_GROUP_FIELD',
        'options': ['Option 1', 'Option 2'],
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'value': ['Option 1'],
      };

      final field = FieldAdapter.fromJson(json) as CheckBoxGroupFieldEntity;

      expect(field.fieldType, FieldTypeEnum.CHECKBOX_GROUP_FIELD);
      expect(field.options, ['Option 1', 'Option 2']);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(field.isRequired, true);
      expect(field.value, ['Option 1']);
    });

    test('should parse JSON to SwitchButtonFieldEntity', () {
      final json = {
        'field_type': 'SWITCH_BUTTON_FIELD',
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'value': true,
      };

      final field = FieldAdapter.fromJson(json) as SwitchButtonFieldEntity;

      expect(field.fieldType, FieldTypeEnum.SWITCH_BUTTON_FIELD);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(field.isRequired, true);
      expect(field.value, true);
    });

    test('should parse JSON to FileFieldEntity', () {
      final json = {
        'field_type': 'FILE_FIELD',
        'placeholder': 'placeholder',
        'key': 'key',
        'required': true,
        'value': ['file1.png'],
        'file_type': 'IMAGE',
        'min_quantity': 1,
        'max_quantity': 3,
      };

      final field = FieldAdapter.fromJson(json) as FileFieldEntity;

      expect(field.fieldType, FieldTypeEnum.FILE_FIELD);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(field.isRequired, true);
      expect(field.value, ['file1.png']);
      expect(field.fileType, FileTypeEnum.IMAGE);
      expect(field.minQuantity, 1);
      expect(field.maxQuantity, 3);
    });

    test('should convert TextFieldEntity to JSON', () {
      final field = TextFieldEntity(
        fieldType: FieldTypeEnum.TEXT_FIELD,
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        regex: r'^[a-zA-Z]+$',
        formatting: null,
        value: 'John',
        maxLength: 50,
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'TEXT_FIELD');
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['regex'], r'^[a-zA-Z]+$');
      expect(json['formatting'], null);
      expect(json['value'], 'John');
      expect(json['max_length'], 50);
    });

    test('should convert NumberFieldEntity to JSON', () {
      final field = NumberFieldEntity(
        fieldType: FieldTypeEnum.NUMBER_FIELD,
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: 25.0,
        minValue: 18,
        maxValue: 99,
        decimal: false,
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'NUMBER_FIELD');
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], 25.0);
      expect(json['min_value'], 18);
      expect(json['max_value'], 99);
      expect(json['decimal'], false);
    });

    test('should convert DropDownFieldEntity to JSON', () {
      final field = DropDownFieldEntity(
        fieldType: FieldTypeEnum.DROPDOWN_FIELD,
        options: ['Option 1', 'Option 2'],
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: 'Option 1',
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'DROPDOWN_FIELD');
      expect(json['options'], ['Option 1', 'Option 2']);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], 'Option 1');
    });

    test('should convert TypeAheadFieldEntity to JSON', () {
      final field = TypeAheadFieldEntity(
        fieldType: FieldTypeEnum.TYPEAHEAD_FIELD,
        options: ['Option 1', 'Option 2'],
        maxLength: 30,
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: 'Option 1',
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'TYPEAHEAD_FIELD');
      expect(json['options'], ['Option 1', 'Option 2']);
      expect(json['max_length'], 30);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], 'Option 1');
    });

    test('should convert RadioGroupFieldEntity to JSON', () {
      final field = RadioGroupFieldEntity(
        fieldType: FieldTypeEnum.RADIO_GROUP_FIELD,
        options: ['Option 1', 'Option 2'],
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: 'Option 1',
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'RADIO_GROUP_FIELD');
      expect(json['options'], ['Option 1', 'Option 2']);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], 'Option 1');
    });

    test('should convert DateFieldEntity to JSON', () {
      final field = DateFieldEntity(
        fieldType: FieldTypeEnum.DATE_FIELD,
        minDate: DateTime.fromMillisecondsSinceEpoch(1622520000000),
        maxDate: DateTime.fromMillisecondsSinceEpoch(1625108400000),
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: DateTime.fromMillisecondsSinceEpoch(1622606400000),
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'DATE_FIELD');
      expect(json['min_date'], 1622520000000);
      expect(json['max_date'], 1625108400000);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], 1622606400000);
    });

    test('should convert CheckBoxFieldEntity to JSON', () {
      final field = CheckBoxFieldEntity(
        fieldType: FieldTypeEnum.CHECKBOX_FIELD,
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: true,
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'CHECKBOX_FIELD');
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], true);
    });

    test('should convert CheckBoxGroupFieldEntity to JSON', () {
      final field = CheckBoxGroupFieldEntity(
        fieldType: FieldTypeEnum.CHECKBOX_GROUP_FIELD,
        options: ['Option 1', 'Option 2'],
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: ['Option 1'],
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'CHECKBOX_GROUP_FIELD');
      expect(json['options'], ['Option 1', 'Option 2']);
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], ['Option 1']);
    });

    test('should convert SwitchButtonFieldEntity to JSON', () {
      final field = SwitchButtonFieldEntity(
        fieldType: FieldTypeEnum.SWITCH_BUTTON_FIELD,
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: true,
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'SWITCH_BUTTON_FIELD');
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], true);
    });

    test('should convert FileFieldEntity to JSON', () {
      final field = FileFieldEntity(
        fieldType: FieldTypeEnum.FILE_FIELD,
        placeholder: 'placeholder',
        key: 'key',
        isRequired: true,
        value: ['file1.png'],
        fileType: FileTypeEnum.IMAGE,
        minQuantity: 1,
        maxQuantity: 3,
      );

      final json = FieldAdapter.toJson(field);

      expect(json['field_type'], 'FILE_FIELD');
      expect(json['placeholder'], 'placeholder');
      expect(json['key'], 'key');
      expect(json['required'], true);
      expect(json['value'], ['file1.png']);
      expect(json['file_type'], 'IMAGE');
      expect(json['min_quantity'], 1);
      expect(json['max_quantity'], 3);
    });

    test('should parse JSON list to FieldEntity list', () {
      final jsonList = [
        {
          'field_type': 'TEXT_FIELD',
          'placeholder': 'placeholder',
          'key': 'name',
          'required': true,
          'regex': r'^[a-zA-Z]+$',
          'formatting': null,
          'value': 'John',
          'max_length': 50,
        },
        {
          'field_type': 'NUMBER_FIELD',
          'placeholder': 'placeholder',
          'key': 'age',
          'required': true,
          'value': 25.0,
          'min_value': 18,
          'max_value': 99,
          'decimal': false,
        },
      ];

      final fields = FieldAdapter.fromJsonList(jsonList);

      expect(fields.length, 2);
      expect(fields[0], isA<TextFieldEntity>());
      expect(fields[1], isA<NumberFieldEntity>());
    });
  });
}
