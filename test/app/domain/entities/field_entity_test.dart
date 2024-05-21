import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';

void main() {
  test('should return text field entity', () {
    final textFieldEntity = TextFieldEntity(
      fieldType: FieldTypeEnum.TEXT_FIELD,
      placeholder: 'Placeholder Campo',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      maxLength: 100,
      value: 'Initial value',
    );

    expect(textFieldEntity.fieldType, FieldTypeEnum.TEXT_FIELD);
    expect(textFieldEntity.placeholder, 'Placeholder Campo');
    expect(textFieldEntity.regex, 'regex');
    expect(textFieldEntity.formatting, 'formatting');
    expect(textFieldEntity.isRequired, true);
    expect(textFieldEntity.key, 'key');
    expect(textFieldEntity.maxLength, 100);
    expect(textFieldEntity.value, 'Initial value');
  });

  test('should return number field entity', () {
    final numberFieldEntity = NumberFieldEntity(
      minValue: 1,
      maxValue: 100,
      decimal: true,
      fieldType: FieldTypeEnum.NUMBER_FIELD,
      placeholder: 'Placeholder Número',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      value: 50.0,
    );

    expect(numberFieldEntity.fieldType, FieldTypeEnum.NUMBER_FIELD);
    expect(numberFieldEntity.placeholder, 'Placeholder Número');
    expect(numberFieldEntity.regex, 'regex');
    expect(numberFieldEntity.formatting, 'formatting');
    expect(numberFieldEntity.isRequired, true);
    expect(numberFieldEntity.key, 'key');
    expect(numberFieldEntity.minValue, 1);
    expect(numberFieldEntity.maxValue, 100);
    expect(numberFieldEntity.decimal, true);
    expect(numberFieldEntity.value, 50.0);
  });

  test('should return dropdown field entity', () {
    final dropDownFieldEntity = DropDownFieldEntity(
      options: ['Option 1', 'Option 2'],
      fieldType: FieldTypeEnum.DROPDOWN_FIELD,
      placeholder: 'Placeholder Dropdown',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      value: 'Option 1',
    );

    expect(dropDownFieldEntity.fieldType, FieldTypeEnum.DROPDOWN_FIELD);
    expect(dropDownFieldEntity.placeholder, 'Placeholder Dropdown');
    expect(dropDownFieldEntity.regex, 'regex');
    expect(dropDownFieldEntity.formatting, 'formatting');
    expect(dropDownFieldEntity.isRequired, true);
    expect(dropDownFieldEntity.key, 'key');
    expect(dropDownFieldEntity.options, ['Option 1', 'Option 2']);
    expect(dropDownFieldEntity.value, 'Option 1');
  });

  test('should return typeahead field entity', () {
    final typeAheadFieldEntity = TypeAheadFieldEntity(
      options: ['Option 1', 'Option 2'],
      maxLength: 50,
      fieldType: FieldTypeEnum.TYPEAHEAD_FIELD,
      placeholder: 'Placeholder TypeAhead',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      value: 'Option 1',
    );

    expect(typeAheadFieldEntity.fieldType, FieldTypeEnum.TYPEAHEAD_FIELD);
    expect(typeAheadFieldEntity.placeholder, 'Placeholder TypeAhead');
    expect(typeAheadFieldEntity.regex, 'regex');
    expect(typeAheadFieldEntity.formatting, 'formatting');
    expect(typeAheadFieldEntity.isRequired, true);
    expect(typeAheadFieldEntity.key, 'key');
    expect(typeAheadFieldEntity.options, ['Option 1', 'Option 2']);
    expect(typeAheadFieldEntity.maxLength, 50);
    expect(typeAheadFieldEntity.value, 'Option 1');
  });

  test('should return radio group field entity', () {
    final radioGroupFieldEntity = RadioGroupFieldEntity(
      options: ['Option 1', 'Option 2'],
      fieldType: FieldTypeEnum.RADIO_GROUP_FIELD,
      placeholder: 'Placeholder Radio Group',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      value: 'Option 1',
    );

    expect(radioGroupFieldEntity.fieldType, FieldTypeEnum.RADIO_GROUP_FIELD);
    expect(radioGroupFieldEntity.placeholder, 'Placeholder Radio Group');
    expect(radioGroupFieldEntity.regex, 'regex');
    expect(radioGroupFieldEntity.formatting, 'formatting');
    expect(radioGroupFieldEntity.isRequired, true);
    expect(radioGroupFieldEntity.key, 'key');
    expect(radioGroupFieldEntity.options, ['Option 1', 'Option 2']);
    expect(radioGroupFieldEntity.value, 'Option 1');
  });

  test('should return date field entity', () {
    final dateFieldEntity = DateFieldEntity(
      minDate: DateTime(2020, 1, 1),
      maxDate: DateTime(2023, 12, 31),
      fieldType: FieldTypeEnum.DATE_FIELD,
      placeholder: 'Placeholder Data',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      value: DateTime(2022, 5, 20),
    );

    expect(dateFieldEntity.fieldType, FieldTypeEnum.DATE_FIELD);
    expect(dateFieldEntity.placeholder, 'Placeholder Data');
    expect(dateFieldEntity.regex, 'regex');
    expect(dateFieldEntity.formatting, 'formatting');
    expect(dateFieldEntity.isRequired, true);
    expect(dateFieldEntity.key, 'key');
    expect(dateFieldEntity.minDate, DateTime(2020, 1, 1));
    expect(dateFieldEntity.maxDate, DateTime(2023, 12, 31));
    expect(dateFieldEntity.value, DateTime(2022, 5, 20));
  });

  test('should return checkbox field entity', () {
    final checkBoxFieldEntity = CheckBoxFieldEntity(
      fieldType: FieldTypeEnum.CHECKBOX_FIELD,
      placeholder: 'Placeholder Checkbox',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      value: true,
    );

    expect(checkBoxFieldEntity.fieldType, FieldTypeEnum.CHECKBOX_FIELD);
    expect(checkBoxFieldEntity.placeholder, 'Placeholder Checkbox');
    expect(checkBoxFieldEntity.regex, 'regex');
    expect(checkBoxFieldEntity.formatting, 'formatting');
    expect(checkBoxFieldEntity.isRequired, true);
    expect(checkBoxFieldEntity.key, 'key');
    expect(checkBoxFieldEntity.value, true);
  });

  test('should return checkbox group field entity', () {
    final checkBoxGroupFieldEntity = CheckBoxGroupFieldEntity(
      options: ['Option 1', 'Option 2'],
      checkLimit: 2,
      fieldType: FieldTypeEnum.CHECKBOX_GROUP_FIELD,
      placeholder: 'Placeholder Checkbox Group',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      value: ['Option 1'],
    );

    expect(
        checkBoxGroupFieldEntity.fieldType, FieldTypeEnum.CHECKBOX_GROUP_FIELD);
    expect(checkBoxGroupFieldEntity.placeholder, 'Placeholder Checkbox Group');
    expect(checkBoxGroupFieldEntity.regex, 'regex');
    expect(checkBoxGroupFieldEntity.formatting, 'formatting');
    expect(checkBoxGroupFieldEntity.isRequired, true);
    expect(checkBoxGroupFieldEntity.key, 'key');
    expect(checkBoxGroupFieldEntity.options, ['Option 1', 'Option 2']);
    expect(checkBoxGroupFieldEntity.checkLimit, 2);
    expect(checkBoxGroupFieldEntity.value, ['Option 1']);
  });

  test('should return switch button field entity', () {
    final switchButtonFieldEntity = SwitchButtonFieldEntity(
      fieldType: FieldTypeEnum.SWITCH_BUTTON_FIELD,
      placeholder: 'Placeholder Switch Button',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      value: true,
    );

    expect(
        switchButtonFieldEntity.fieldType, FieldTypeEnum.SWITCH_BUTTON_FIELD);
    expect(switchButtonFieldEntity.placeholder, 'Placeholder Switch Button');
    expect(switchButtonFieldEntity.regex, 'regex');
    expect(switchButtonFieldEntity.formatting, 'formatting');
    expect(switchButtonFieldEntity.isRequired, true);
    expect(switchButtonFieldEntity.key, 'key');
    expect(switchButtonFieldEntity.value, true);
  });

  test('should return file field entity', () {
    final fileFieldEntity = FileFieldEntity(
      fileType: FileTypeEnum.IMAGE,
      minQuantity: 1,
      maxQuantity: 5,
      fieldType: FieldTypeEnum.FILE_FIELD,
      placeholder: 'Placeholder File',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
      value: ['file1.png', 'file2.jpg'],
    );

    expect(fileFieldEntity.fieldType, FieldTypeEnum.FILE_FIELD);
    expect(fileFieldEntity.placeholder, 'Placeholder File');
    expect(fileFieldEntity.regex, 'regex');
    expect(fileFieldEntity.formatting, 'formatting');
    expect(fileFieldEntity.isRequired, true);
    expect(fileFieldEntity.key, 'key');
    expect(fileFieldEntity.fileType, FileTypeEnum.IMAGE);
    expect(fileFieldEntity.minQuantity, 1);
    expect(fileFieldEntity.maxQuantity, 5);
    expect(fileFieldEntity.value, ['file1.png', 'file2.jpg']);
  });
}
