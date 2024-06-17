import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/field_model.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';

void main() {
  group('TextFieldModel Tests', () {
    final textFieldMap = {
      'field_type': 'TEXT_FIELD',
      'placeholder': 'Enter text',
      'key': 'text_field',
      'required': true,
      'regex': null,
      'formatting': null,
      'value': null,
      'max_length': 100,
    };

    test('should create TextFieldModel from map', () {
      final textFieldModel = TextFieldModel.fromMap(textFieldMap);

      expect(textFieldModel.placeholder, 'Enter text');
      expect(textFieldModel.key, 'text_field');
      expect(textFieldModel.isRequired, true);
      expect(textFieldModel.maxLength, 100);
    });

    test('should convert TextFieldModel to map', () {
      final textFieldModel = TextFieldModel.fromMap(textFieldMap);
      final map = textFieldModel.toMap();

      expect(map, textFieldMap);
    });

    test('should create TextFieldModel from entity', () {
      final entity = TextFieldEntity(
        fieldType: FieldTypeEnum.TEXT_FIELD,
        placeholder: 'Enter text',
        key: 'text_field',
        isRequired: true,
        maxLength: 100,
      );

      final textFieldModel = TextFieldModel.fromEntity(entity);

      expect(textFieldModel.placeholder, 'Enter text');
      expect(textFieldModel.key, 'text_field');
      expect(textFieldModel.isRequired, true);
      expect(textFieldModel.maxLength, 100);
    });
  });

  group('NumberFieldModel Tests', () {
    final numberFieldMap = {
      'field_type': 'NUMBER_FIELD',
      'placeholder': 'Enter number',
      'key': 'number_field',
      'required': true,
      'regex': null,
      'formatting': null,
      'value': null,
      'min_value': 0,
      'max_value': 100,
      'decimal': true,
    };

    test('should create NumberFieldModel from map', () {
      final numberFieldModel = NumberFieldModel.fromMap(numberFieldMap);

      expect(numberFieldModel.placeholder, 'Enter number');
      expect(numberFieldModel.key, 'number_field');
      expect(numberFieldModel.isRequired, true);
      expect(numberFieldModel.minValue, 0);
      expect(numberFieldModel.maxValue, 100);
      expect(numberFieldModel.decimal, true);
    });

    test('should convert NumberFieldModel to map', () {
      final numberFieldModel = NumberFieldModel.fromMap(numberFieldMap);
      final map = numberFieldModel.toMap();

      expect(map, numberFieldMap);
    });

    test('should create NumberFieldModel from entity', () {
      final entity = NumberFieldEntity(
        fieldType: FieldTypeEnum.NUMBER_FIELD,
        placeholder: 'Enter number',
        key: 'number_field',
        isRequired: true,
        minValue: 0,
        maxValue: 100,
        decimal: true,
      );

      final numberFieldModel = NumberFieldModel.fromEntity(entity);

      expect(numberFieldModel.placeholder, 'Enter number');
      expect(numberFieldModel.key, 'number_field');
      expect(numberFieldModel.isRequired, true);
      expect(numberFieldModel.minValue, 0);
      expect(numberFieldModel.maxValue, 100);
      expect(numberFieldModel.decimal, true);
    });
  });

  group('DropDownFieldModel Tests', () {
    final dropDownFieldMap = {
      'field_type': 'DROPDOWN_FIELD',
      'options': ['Option1', 'Option2'],
      'placeholder': 'Select an option',
      'key': 'dropdown_field',
      'required': true,
      'regex': null,
      'formatting': null,
      'value': null,
    };

    test('should create DropDownFieldModel from map', () {
      final dropDownFieldModel = DropDownFieldModel.fromMap(dropDownFieldMap);

      expect(dropDownFieldModel.options, ['Option1', 'Option2']);
      expect(dropDownFieldModel.placeholder, 'Select an option');
      expect(dropDownFieldModel.key, 'dropdown_field');
      expect(dropDownFieldModel.isRequired, true);
    });

    test('should convert DropDownFieldModel to map', () {
      final dropDownFieldModel = DropDownFieldModel.fromMap(dropDownFieldMap);
      final map = dropDownFieldModel.toMap();

      expect(map, dropDownFieldMap);
    });

    test('should create DropDownFieldModel from entity', () {
      final entity = DropDownFieldEntity(
        fieldType: FieldTypeEnum.DROPDOWN_FIELD,
        options: ['Option1', 'Option2'],
        placeholder: 'Select an option',
        key: 'dropdown_field',
        isRequired: true,
      );

      final dropDownFieldModel = DropDownFieldModel.fromEntity(entity);

      expect(dropDownFieldModel.options, ['Option1', 'Option2']);
      expect(dropDownFieldModel.placeholder, 'Select an option');
      expect(dropDownFieldModel.key, 'dropdown_field');
      expect(dropDownFieldModel.isRequired, true);
    });
  });
  group('TypeAheadFieldModel Tests', () {
    final typeAheadFieldMap = {
      'field_type': 'TYPEAHEAD_FIELD',
      'options': ['Option1', 'Option2'],
      'max_length': 50,
      'placeholder': 'Type ahead',
      'key': 'typeahead_field',
      'required': true,
      'regex': null,
      'formatting': null,
      'value': null,
    };

    test('should create TypeAheadFieldModel from map', () {
      final typeAheadFieldModel =
          TypeAheadFieldModel.fromMap(typeAheadFieldMap);

      expect(typeAheadFieldModel.options, ['Option1', 'Option2']);
      expect(typeAheadFieldModel.maxLength, 50);
      expect(typeAheadFieldModel.placeholder, 'Type ahead');
      expect(typeAheadFieldModel.key, 'typeahead_field');
      expect(typeAheadFieldModel.isRequired, true);
    });

    test('should convert TypeAheadFieldModel to map', () {
      final typeAheadFieldModel =
          TypeAheadFieldModel.fromMap(typeAheadFieldMap);
      final map = typeAheadFieldModel.toMap();

      expect(map, typeAheadFieldMap);
    });

    test('should create TypeAheadFieldModel from entity', () {
      final entity = TypeAheadFieldEntity(
        fieldType: FieldTypeEnum.TYPEAHEAD_FIELD,
        options: ['Option1', 'Option2'],
        maxLength: 50,
        placeholder: 'Type ahead',
        key: 'typeahead_field',
        isRequired: true,
      );

      final typeAheadFieldModel = TypeAheadFieldModel.fromEntity(entity);

      expect(typeAheadFieldModel.options, ['Option1', 'Option2']);
      expect(typeAheadFieldModel.maxLength, 50);
      expect(typeAheadFieldModel.placeholder, 'Type ahead');
      expect(typeAheadFieldModel.key, 'typeahead_field');
      expect(typeAheadFieldModel.isRequired, true);
    });
  });

  group('DateFieldModel Tests', () {
    final dateFieldMap = {
      'field_type': 'DATE_FIELD',
      'min_date': DateTime(2022, 01, 01).millisecondsSinceEpoch,
      'max_date': DateTime(2022, 12, 31).millisecondsSinceEpoch,
      'placeholder': 'Select a date',
      'key': 'date_field',
      'required': true,
      'regex': null,
      'formatting': null,
      'value': null,
    };

    test('should create DateFieldModel from map', () {
      final dateFieldModel = DateFieldModel.fromMap(dateFieldMap);

      expect(dateFieldModel.minDate, DateTime(2022, 01, 01));
      expect(dateFieldModel.maxDate, DateTime(2022, 12, 31));
      expect(dateFieldModel.placeholder, 'Select a date');
      expect(dateFieldModel.key, 'date_field');
      expect(dateFieldModel.isRequired, true);
    });

    test('should convert DateFieldModel to map', () {
      final dateFieldModel = DateFieldModel.fromMap(dateFieldMap);
      final map = dateFieldModel.toMap();

      expect(map, dateFieldMap);
    });

    test('should create DateFieldModel from entity', () {
      final entity = DateFieldEntity(
        fieldType: FieldTypeEnum.DATE_FIELD,
        minDate: DateTime(2022, 01, 01),
        maxDate: DateTime(2022, 12, 31),
        placeholder: 'Select a date',
        key: 'date_field',
        isRequired: true,
      );

      final dateFieldModel = DateFieldModel.fromEntity(entity);

      expect(dateFieldModel.minDate, DateTime(2022, 01, 01));
      expect(dateFieldModel.maxDate, DateTime(2022, 12, 31));
      expect(dateFieldModel.placeholder, 'Select a date');
      expect(dateFieldModel.key, 'date_field');
      expect(dateFieldModel.isRequired, true);
    });
  });

  group('CheckBoxFieldModel Tests', () {
    final checkBoxFieldMap = {
      'field_type': 'CHECKBOX_FIELD',
      'placeholder': 'Accept terms',
      'key': 'checkbox_field',
      'required': true,
      'regex': null,
      'formatting': null,
      'value': true,
    };

    test('should create CheckBoxFieldModel from map', () {
      final checkBoxFieldModel = CheckBoxFieldModel.fromMap(checkBoxFieldMap);

      expect(checkBoxFieldModel.placeholder, 'Accept terms');
      expect(checkBoxFieldModel.key, 'checkbox_field');
      expect(checkBoxFieldModel.isRequired, true);
      expect(checkBoxFieldModel.value, true);
    });

    test('should convert CheckBoxFieldModel to map', () {
      final checkBoxFieldModel = CheckBoxFieldModel.fromMap(checkBoxFieldMap);
      final map = checkBoxFieldModel.toMap();

      expect(map, checkBoxFieldMap);
    });

    test('should create CheckBoxFieldModel from entity', () {
      final entity = CheckBoxFieldEntity(
        fieldType: FieldTypeEnum.CHECKBOX_FIELD,
        placeholder: 'Accept terms',
        key: 'checkbox_field',
        isRequired: true,
        value: true,
      );

      final checkBoxFieldModel = CheckBoxFieldModel.fromEntity(entity);

      expect(checkBoxFieldModel.placeholder, 'Accept terms');
      expect(checkBoxFieldModel.key, 'checkbox_field');
      expect(checkBoxFieldModel.isRequired, true);
      expect(checkBoxFieldModel.value, true);
    });
  });

  group('CheckBoxGroupFieldModel Tests', () {
    final checkBoxGroupFieldMap = {
      'field_type': 'CHECKBOX_GROUP_FIELD',
      'options': ['Option1', 'Option2'],
      'placeholder': 'Select options',
      'key': 'checkbox_group_field',
      'required': true,
      'regex': null,
      'formatting': null,
      'value': ['Option1'],
    };

    test('should create CheckBoxGroupFieldModel from map', () {
      final checkBoxGroupFieldModel =
          CheckBoxGroupFieldModel.fromMap(checkBoxGroupFieldMap);

      expect(checkBoxGroupFieldModel.options, ['Option1', 'Option2']);
      expect(checkBoxGroupFieldModel.placeholder, 'Select options');
      expect(checkBoxGroupFieldModel.key, 'checkbox_group_field');
      expect(checkBoxGroupFieldModel.isRequired, true);
      expect(checkBoxGroupFieldModel.value, ['Option1']);
    });

    test('should convert CheckBoxGroupFieldModel to map', () {
      final checkBoxGroupFieldModel =
          CheckBoxGroupFieldModel.fromMap(checkBoxGroupFieldMap);
      final map = checkBoxGroupFieldModel.toMap();

      expect(map, checkBoxGroupFieldMap);
    });

    test('should create CheckBoxGroupFieldModel from entity', () {
      final entity = CheckBoxGroupFieldEntity(
        fieldType: FieldTypeEnum.CHECKBOX_GROUP_FIELD,
        options: ['Option1', 'Option2'],
        placeholder: 'Select options',
        key: 'checkbox_group_field',
        isRequired: true,
        value: ['Option1'],
      );

      final checkBoxGroupFieldModel =
          CheckBoxGroupFieldModel.fromEntity(entity);

      expect(checkBoxGroupFieldModel.options, ['Option1', 'Option2']);
      expect(checkBoxGroupFieldModel.placeholder, 'Select options');
      expect(checkBoxGroupFieldModel.key, 'checkbox_group_field');
      expect(checkBoxGroupFieldModel.isRequired, true);
      expect(checkBoxGroupFieldModel.value, ['Option1']);
    });
  });

  group('SwitchButtonFieldModel Tests', () {
    final switchButtonFieldMap = {
      'field_type': 'SWITCH_BUTTON_FIELD',
      'placeholder': 'Enable feature',
      'key': 'switch_button_field',
      'required': true,
      'regex': null,
      'formatting': null,
      'value': true,
    };

    test('should create SwitchButtonFieldModel from map', () {
      final switchButtonFieldModel =
          SwitchButtonFieldModel.fromMap(switchButtonFieldMap);

      expect(switchButtonFieldModel.placeholder, 'Enable feature');
      expect(switchButtonFieldModel.key, 'switch_button_field');
      expect(switchButtonFieldModel.isRequired, true);
      expect(switchButtonFieldModel.value, true);
    });

    test('should convert SwitchButtonFieldModel to map', () {
      final switchButtonFieldModel =
          SwitchButtonFieldModel.fromMap(switchButtonFieldMap);
      final map = switchButtonFieldModel.toMap();

      expect(map, switchButtonFieldMap);
    });

    test('should create SwitchButtonFieldModel from entity', () {
      final entity = SwitchButtonFieldEntity(
        fieldType: FieldTypeEnum.SWITCH_BUTTON_FIELD,
        placeholder: 'Enable feature',
        key: 'switch_button_field',
        isRequired: true,
        value: true,
      );

      final switchButtonFieldModel = SwitchButtonFieldModel.fromEntity(entity);

      expect(switchButtonFieldModel.placeholder, 'Enable feature');
      expect(switchButtonFieldModel.key, 'switch_button_field');
      expect(switchButtonFieldModel.isRequired, true);
      expect(switchButtonFieldModel.value, true);
    });
  });

  group('FileFieldModel Tests', () {
    final fileFieldMap = {
      'field_type': 'FILE_FIELD',
      'placeholder': 'Upload file',
      'key': 'file_field',
      'required': true,
      'regex': null,
      'formatting': null,
      'value': null,
      'file_type': 'IMAGE',
      'min_quantity': 1,
      'max_quantity': 3,
    };

    test('should create FileFieldModel from map', () {
      final fileFieldModel = FileFieldModel.fromMap(fileFieldMap);

      expect(fileFieldModel.placeholder, 'Upload file');
      expect(fileFieldModel.key, 'file_field');
      expect(fileFieldModel.isRequired, true);
      expect(fileFieldModel.fileType, FileTypeEnum.IMAGE);
      expect(fileFieldModel.minQuantity, 1);
      expect(fileFieldModel.maxQuantity, 3);
    });

    test('should convert FileFieldModel to map', () {
      final fileFieldModel = FileFieldModel.fromMap(fileFieldMap);
      final map = fileFieldModel.toMap();

      expect(map, fileFieldMap);
    });

    test('should create FileFieldModel from entity', () {
      final entity = FileFieldEntity(
        fieldType: FieldTypeEnum.FILE_FIELD,
        placeholder: 'Upload file',
        key: 'file_field',
        isRequired: true,
        fileType: FileTypeEnum.IMAGE,
        minQuantity: 1,
        maxQuantity: 3,
      );

      final fileFieldModel = FileFieldModel.fromEntity(entity);

      expect(fileFieldModel.placeholder, 'Upload file');
      expect(fileFieldModel.key, 'file_field');
      expect(fileFieldModel.isRequired, true);
      expect(fileFieldModel.fileType, FileTypeEnum.IMAGE);
      expect(fileFieldModel.minQuantity, 1);
      expect(fileFieldModel.maxQuantity, 3);
    });
  });
}
