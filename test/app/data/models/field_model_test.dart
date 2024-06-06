import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/field_model.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/file_type_enum.dart';

void main() {
  group('FieldModel generator -', () {
    test('fromEntity', () {
      var entity = TextFieldEntity(
        fieldType: FieldTypeEnum.TEXT_FIELD,
        placeholder: 'TextField 01',
        regex: r'^.{6,}$',
        isRequired: true,
        key: 'key-section-01-1',
      );

      var model = FieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.TEXT_FIELD.name,
        'placeholder': 'TextField 01',
        'isRequired': true,
        'key': 'key-section-01-1',
        'formatting': null,
        'value': null,
      };

      var model = FieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.TEXT_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
    });

    test('fromMaps', () {
      var maps = [
        {
          'fieldType': FieldTypeEnum.TEXT_FIELD.name,
          'placeholder': 'TextField 01',
          'isRequired': true,
          'key': 'key-section-01-1',
          'formatting': null,
          'value': null,
        },
        {
          'fieldType': FieldTypeEnum.NUMBER_FIELD.name,
          'placeholder': 'NumberField 01',
          'minValue': 0,
          'maxValue': 100,
          'decimal': false,
          'isRequired': true,
          'key': 'key-section-01-2',
          'formatting': null,
          'value': null,
        },
        {
          'fieldType': FieldTypeEnum.DROPDOWN_FIELD.name,
          'placeholder': 'DropdownField 01',
          'isRequired': true,
          'key': 'key-section-01-3',
          'formatting': null,
          'value': null,
          'options': ['Option 01', 'Option 02', 'Option 03'],
        },
        {
          'fieldType': FieldTypeEnum.TYPEAHEAD_FIELD.name,
          'placeholder': 'TypeAheadField 01',
          'isRequired': true,
          'key': 'key-section-01-4',
          'formatting': null,
          'value': null,
          'options': ['Option 01', 'Option 02', 'Option 03'],
          'maxLength': 10,
        },
        {
          'fieldType': FieldTypeEnum.RADIO_GROUP_FIELD.name,
          'placeholder': 'RadioGroupField 01',
          'isRequired': true,
          'key': 'key-section-01-5',
          'formatting': null,
          'value': null,
          'options': ['Option 01', 'Option 02', 'Option 03'],
        },
        {
          'fieldType': FieldTypeEnum.DATE_FIELD.name,
          'placeholder': 'DateField 01',
          'isRequired': true,
          'key': 'key-section-01-6',
          'formatting': null,
          'value': null,
        },
        {
          'fieldType': FieldTypeEnum.CHECKBOX_FIELD.name,
          'placeholder': 'CheckBoxField 01',
          'isRequired': true,
          'key': 'key-section-01-7',
          'formatting': null,
          'value': null,
        },
        {
          'fieldType': FieldTypeEnum.CHECKBOX_GROUP_FIELD.name,
          'placeholder': 'CheckBoxGroupField 01',
          'isRequired': true,
          'key': 'key-section-01-8',
          'formatting': null,
          'value': null,
          'options': ['Option 01', 'Option 02', 'Option 03'],
        },
      ];

      var models = FieldModel.fromMaps(maps);

      expect(models.length, maps.length);

      for (var i = 0; i < models.length; i++) {
        expect(models[i].fieldType.name, maps[i]['fieldType']);
        expect(models[i].placeholder, maps[i]['placeholder']);
        expect(models[i].isRequired, maps[i]['isRequired']);
        expect(models[i].key, maps[i]['key']);
        expect(models[i].formatting, maps[i]['formatting']);
        expect(models[i].value, maps[i]['value']);
      }
    });
  });
  group('TextFieldModel -', () {
    test('fromEntity', () {
      var entity = TextFieldEntity(
        fieldType: FieldTypeEnum.TEXT_FIELD,
        placeholder: 'TextField 01',
        regex: r'^.{6,}$',
        isRequired: true,
        key: 'key-section-01-1',
      );
      var model = TextFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.regex, entity.regex);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
    });

    test('toMap', () {
      var model = TextFieldModel(
        placeholder: 'TextField 01',
        regex: r'^.{6,}$',
        isRequired: true,
        key: 'key-section-01-1',
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['regex'], model.regex);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.TEXT_FIELD.name,
        'placeholder': 'TextField 01',
        'regex': r'^.{6,}$',
        'isRequired': true,
        'key': 'key-section-01-1',
        'formatting': null,
        'value': null,
      };

      var model = TextFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.TEXT_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.regex, map['regex']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
    });
  });

  group('NumberFieldModel -', () {
    test('fromEntity', () {
      var entity = NumberFieldEntity(
        fieldType: FieldTypeEnum.NUMBER_FIELD,
        placeholder: 'NumberField 01',
        minValue: 0,
        maxValue: 100,
        decimal: false,
        isRequired: true,
        key: 'key-section-01-2',
      );
      var model = NumberFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.minValue, entity.minValue);
      expect(model.maxValue, entity.maxValue);
      expect(model.decimal, entity.decimal);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
    });

    test('toMap', () {
      var model = NumberFieldModel(
        placeholder: 'NumberField 01',
        minValue: 0,
        maxValue: 100,
        decimal: false,
        isRequired: true,
        key: 'key-section-01-2',
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['minValue'], model.minValue);
      expect(map['maxValue'], model.maxValue);
      expect(map['decimal'], model.decimal);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.NUMBER_FIELD.name,
        'placeholder': 'NumberField 01',
        'minValue': 0,
        'maxValue': 100,
        'decimal': false,
        'isRequired': true,
        'key': 'key-section-01-2',
        'formatting': null,
        'value': null,
      };

      var model = NumberFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.NUMBER_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.minValue, map['minValue']);
      expect(model.maxValue, map['maxValue']);
      expect(model.decimal, map['decimal']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
    });
  });

  group('DropdownFieldModel -', () {
    test('fromEntity', () {
      var entity = DropDownFieldEntity(
        fieldType: FieldTypeEnum.DROPDOWN_FIELD,
        placeholder: 'DropdownField 01',
        isRequired: true,
        key: 'key-section-01-3',
        options: ['Option 01', 'Option 02', 'Option 03'],
      );
      var model = DropDownFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
      expect(model.options, entity.options);
    });

    test('toMap', () {
      var model = DropDownFieldModel(
        placeholder: 'DropdownField 01',
        isRequired: true,
        key: 'key-section-01-3',
        options: ['Option 01', 'Option 02', 'Option 03'],
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
      expect(map['options'], model.options);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.DROPDOWN_FIELD.name,
        'placeholder': 'DropdownField 01',
        'isRequired': true,
        'key': 'key-section-01-3',
        'formatting': null,
        'value': null,
        'options': ['Option 01', 'Option 02', 'Option 03'],
      };

      var model = DropDownFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.DROPDOWN_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
      expect(model.options, map['options']);
    });
  });

  group('TypeAheadFieldModel -', () {
    test('fromEntity', () {
      var entity = TypeAheadFieldEntity(
        fieldType: FieldTypeEnum.TYPEAHEAD_FIELD,
        placeholder: 'TypeAheadField 01',
        isRequired: true,
        key: 'key-section-01-4',
        options: ['Option 01', 'Option 02', 'Option 03'],
        maxLength: 10,
      );
      var model = TypeAheadFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
      expect(model.options, entity.options);
      expect(model.maxLength, entity.maxLength);
    });

    test('toMap', () {
      var model = TypeAheadFieldModel(
        placeholder: 'TypeAheadField 01',
        isRequired: true,
        key: 'key-section-01-4',
        options: ['Option 01', 'Option 02', 'Option 03'],
        maxLength: 10,
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
      expect(map['options'], model.options);
      expect(map['maxLength'], model.maxLength);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.TYPEAHEAD_FIELD.name,
        'placeholder': 'TypeAheadField 01',
        'isRequired': true,
        'key': 'key-section-01-4',
        'formatting': null,
        'value': null,
        'options': ['Option 01', 'Option 02', 'Option 03'],
        'maxLength': 10,
      };

      var model = TypeAheadFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.TYPEAHEAD_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
      expect(model.options, map['options']);
      expect(model.maxLength, map['maxLength']);
    });
  });

  group('RadioGroupFieldModel -', () {
    test('fromEntity', () {
      var entity = RadioGroupFieldEntity(
        fieldType: FieldTypeEnum.RADIO_GROUP_FIELD,
        placeholder: 'RadioGroupField 01',
        isRequired: true,
        key: 'key-section-01-5',
        options: ['Option 01', 'Option 02', 'Option 03'],
      );
      var model = RadioGroupFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
      expect(model.options, entity.options);
    });

    test('toMap', () {
      var model = RadioGroupFieldModel(
        placeholder: 'RadioGroupField 01',
        isRequired: true,
        key: 'key-section-01-5',
        options: ['Option 01', 'Option 02', 'Option 03'],
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
      expect(map['options'], model.options);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.RADIO_GROUP_FIELD.name,
        'placeholder': 'RadioGroupField 01',
        'isRequired': true,
        'key': 'key-section-01-5',
        'formatting': null,
        'value': null,
        'options': ['Option 01', 'Option 02', 'Option 03'],
      };

      var model = RadioGroupFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.RADIO_GROUP_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
      expect(model.options, map['options']);
    });
  });

  group('DateFieldModel -', () {
    test('fromEntity', () {
      var entity = DateFieldEntity(
        fieldType: FieldTypeEnum.DATE_FIELD,
        placeholder: 'DateField 01',
        isRequired: true,
        key: 'key-section-01-6',
      );
      var model = DateFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
    });

    test('toMap', () {
      var model = DateFieldModel(
        placeholder: 'DateField 01',
        isRequired: true,
        key: 'key-section-01-6',
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.DATE_FIELD.name,
        'placeholder': 'DateField 01',
        'isRequired': true,
        'key': 'key-section-01-6',
        'formatting': null,
        'value': null,
      };

      var model = DateFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.DATE_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
    });
  });

  group('CheckBoxFieldModel -', () {
    test('fromEntity', () {
      var entity = CheckBoxFieldEntity(
        fieldType: FieldTypeEnum.CHECKBOX_FIELD,
        placeholder: 'CheckBoxField 01',
        isRequired: true,
        key: 'key-section-01-7',
      );
      var model = CheckBoxFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
    });

    test('toMap', () {
      var model = CheckBoxFieldModel(
        placeholder: 'CheckBoxField 01',
        isRequired: true,
        key: 'key-section-01-7',
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.CHECKBOX_FIELD.name,
        'placeholder': 'CheckBoxField 01',
        'isRequired': true,
        'key': 'key-section-01-7',
        'formatting': null,
        'value': null,
      };

      var model = CheckBoxFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.CHECKBOX_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
    });
  });

  group('CheckBoxGroupFieldModel -', () {
    test('fromEntity', () {
      var entity = CheckBoxGroupFieldEntity(
        fieldType: FieldTypeEnum.CHECKBOX_GROUP_FIELD,
        placeholder: 'CheckBoxGroupField 01',
        isRequired: true,
        key: 'key-section-01-8',
        options: ['Option 01', 'Option 02', 'Option 03'],
      );
      var model = CheckBoxGroupFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
      expect(model.options, entity.options);
    });

    test('toMap', () {
      var model = CheckBoxGroupFieldModel(
        placeholder: 'CheckBoxGroupField 01',
        isRequired: true,
        key: 'key-section-01-8',
        options: ['Option 01', 'Option 02', 'Option 03'],
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
      expect(map['options'], model.options);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.CHECKBOX_GROUP_FIELD.name,
        'placeholder': 'CheckBoxGroupField 01',
        'isRequired': true,
        'key': 'key-section-01-8',
        'formatting': null,
        'value': null,
        'options': ['Option 01', 'Option 02', 'Option 03'],
      };

      var model = CheckBoxGroupFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.CHECKBOX_GROUP_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
      expect(model.options, map['options']);
    });
  });

  group('SwitchButtonFieldModel -', () {
    test('fromEntity', () {
      var entity = SwitchButtonFieldEntity(
        fieldType: FieldTypeEnum.SWITCH_BUTTON_FIELD,
        placeholder: 'SwitchButtonField 01',
        isRequired: true,
        key: 'key-section-01-9',
      );
      var model = SwitchButtonFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
    });

    test('toMap', () {
      var model = SwitchButtonFieldModel(
        placeholder: 'SwitchButtonField 01',
        isRequired: true,
        key: 'key-section-01-9',
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.SWITCH_BUTTON_FIELD.name,
        'placeholder': 'SwitchButtonField 01',
        'isRequired': true,
        'key': 'key-section-01-9',
        'formatting': null,
        'value': null,
      };

      var model = SwitchButtonFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.SWITCH_BUTTON_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
    });
  });

  group('FileFieldModel -', () {
    test('fromEntity', () {
      var entity = FileFieldEntity(
        fileType: FileTypeEnum.DOCUMENT,
        minQuantity: 1,
        maxQuantity: 10,
        fieldType: FieldTypeEnum.FILE_FIELD,
        placeholder: 'FileField 01',
        isRequired: true,
        key: 'key-section-01-10',
      );
      var model = FileFieldModel.fromEntity(entity);

      expect(model.fieldType, entity.fieldType);
      expect(model.placeholder, entity.placeholder);
      expect(model.isRequired, entity.isRequired);
      expect(model.key, entity.key);
      expect(model.formatting, entity.formatting);
      expect(model.value, entity.value);
    });

    test('toMap', () {
      var model = FileFieldModel(
        fileType: FileTypeEnum.DOCUMENT,
        minQuantity: 1,
        maxQuantity: 10,
        placeholder: 'FileField 01',
        isRequired: true,
        key: 'key-section-01-10',
      );

      var map = model.toMap();

      expect(map['fieldType'], model.fieldType.name);
      expect(map['placeholder'], model.placeholder);
      expect(map['isRequired'], model.isRequired);
      expect(map['key'], model.key);
      expect(map['formatting'], model.formatting);
      expect(map['value'], model.value);
      expect(map['fileType'], model.fileType.name);
      expect(map['minQuantity'], model.minQuantity);
      expect(map['maxQuantity'], model.maxQuantity);
    });

    test('fromMap', () {
      var map = {
        'fieldType': FieldTypeEnum.FILE_FIELD.name,
        'maxQuantity': 10,
        'minQuantity': 1,
        'fileType': FileTypeEnum.DOCUMENT.name,
        'placeholder': 'FileField 01',
        'isRequired': true,
        'key': 'key-section-01-10',
        'formatting': null,
        'value': null,
      };

      var model = FileFieldModel.fromMap(map);

      expect(model.fieldType, FieldTypeEnum.FILE_FIELD);
      expect(model.placeholder, map['placeholder']);
      expect(model.isRequired, map['isRequired']);
      expect(model.key, map['key']);
      expect(model.formatting, map['formatting']);
      expect(model.value, map['value']);
      expect(model.fileType, FileTypeEnum.DOCUMENT);
      expect(model.minQuantity, map['minQuantity']);
      expect(model.maxQuantity, map['maxQuantity']);
    });
  });
}
