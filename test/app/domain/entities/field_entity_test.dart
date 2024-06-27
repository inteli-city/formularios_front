import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';

void main() {
  group('TextFieldEntity tests', () {
    test('should create a valid text field entity without exception', () {
      expect(
          () => TextFieldEntity(
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                value: 'Valid Text',
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => TextFieldEntity(
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                value: 123,
              ),
          throwsException);
    });
  });

  group('NumberFieldEntity tests', () {
    test('should create a valid number field entity without exception', () {
      expect(
          () => NumberFieldEntity(
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                decimal: true,
                value: 5.0,
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => NumberFieldEntity(
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                decimal: false,
                value: 'Not a number',
              ),
          throwsException);
    });
  });

  group('DropDownFieldEntity tests', () {
    test('should create a valid dropdown field entity without exception', () {
      expect(
          () => DropDownFieldEntity(
                options: ['Option 1', 'Option 2'],
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                value: 'Option 1',
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => DropDownFieldEntity(
                options: ['Option 1', 'Option 2'],
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                value: 123,
              ),
          throwsException);
    });
  });

  group('TypeAheadFieldEntity tests', () {
    test('should create a valid typeahead field entity without exception', () {
      expect(
          () => TypeAheadFieldEntity(
                options: ['Option 1', 'Option 2'],
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                value: 'Option 1',
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => TypeAheadFieldEntity(
                options: ['Option 1', 'Option 2'],
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                value: false,
              ),
          throwsException);
    });
  });

  group('RadioGroupFieldEntity tests', () {
    test('should create a valid radio group field entity without exception',
        () {
      expect(
          () => RadioGroupFieldEntity(
                options: ['Option 1', 'Option 2'],
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                value: 'Option 1',
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => RadioGroupFieldEntity(
                options: ['Option 1', 'Option 2'],
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                value: 123,
              ),
          throwsException);
    });
  });

  group('DateFieldEntity tests', () {
    test('should create a valid date field entity without exception', () {
      expect(
          () => DateFieldEntity(
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                value: DateTime.now(),
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => DateFieldEntity(
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                value: '2020-01-01',
              ),
          throwsException);
    });
  });
  group('CheckBoxFieldEntity tests', () {
    test('should create a valid checkbox field entity without exception', () {
      expect(
          () => CheckBoxFieldEntity(
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                value: true,
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => CheckBoxFieldEntity(
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                value: 'not a boolean',
              ),
          throwsException);
    });
  });

  group('CheckBoxGroupFieldEntity tests', () {
    test('should create a valid checkbox group field entity without exception',
        () {
      expect(
          () => CheckBoxGroupFieldEntity(
                options: ['Option 1', 'Option 2'],
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                value: ['Option 1'],
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => CheckBoxGroupFieldEntity(
                options: ['Option 1', 'Option 2'],
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                value: 'not a list',
              ),
          throwsException);
    });
  });

  group('SwitchButtonFieldEntity tests', () {
    test('should create a valid switch button field entity without exception',
        () {
      expect(
          () => SwitchButtonFieldEntity(
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                value: true,
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => SwitchButtonFieldEntity(
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                value: 'not a boolean',
              ),
          throwsException);
    });
  });

  group('FileFieldEntity tests', () {
    test('should create a valid file field entity without exception', () {
      expect(
          () => FileFieldEntity(
                fileType: FileTypeEnum.IMAGE,
                minQuantity: 1,
                maxQuantity: 3,
                placeholder: 'Valid Placeholder',
                key: 'validKey',
                isRequired: true,
                value: ['file1.png', 'file2.jpg'],
              ),
          returnsNormally);
    });

    test('should throw exception for invalid value type', () {
      expect(
          () => FileFieldEntity(
                fileType: FileTypeEnum.IMAGE,
                minQuantity: 1,
                maxQuantity: 3,
                placeholder: 'Invalid Placeholder',
                key: 'invalidKey',
                isRequired: true,
                value: 'not a list',
              ),
          throwsException);
    });
  });
}
