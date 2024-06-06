import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/section_model.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';

void main() {
  group('SectionModel', () {
    var map = {
      'sectionId': 'sectionId',
      'fields': [
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
      ]
    };
    test('fromMap', () {
      var section = SectionModel.fromMap(map);

      expect(section.sectionId, 'sectionId');
      expect(section.fields.length, 8);
    });

    test('fromMaps', () {
      var sections = SectionModel.fromMaps([map, map]);

      expect(sections.length, 2);
    });

    test('fromEntity', () {
      var entity = SectionEntity(
        sectionId: 'sectionId',
        fields: [
          TextFieldEntity(
            placeholder: 'TextField 01',
            key: 'key-section-01-1',
            isRequired: true,
          ),
          NumberFieldEntity(
            placeholder: 'NumberField 01',
            key: 'key-section-01-2',
            isRequired: true,
            minValue: 0,
            maxValue: 100,
            decimal: false,
          ),
          TypeAheadFieldEntity(
            placeholder: 'TypeAheadField 01',
            key: 'key-section-01-4',
            isRequired: true,
            options: ['Option 01', 'Option 02', 'Option 03'],
            maxLength: 10,
          ),
          RadioGroupFieldEntity(
            placeholder: 'RadioGroupField 01',
            key: 'key-section-01-5',
            isRequired: true,
            options: ['Option 01', 'Option 02', 'Option 03'],
          ),
          DateFieldEntity(
            placeholder: 'DateField 01',
            key: 'key-section-01-6',
            isRequired: true,
          ),
          CheckBoxFieldEntity(
            placeholder: 'CheckBoxField 01',
            key: 'key-section-01-7',
            isRequired: true,
          ),
          CheckBoxGroupFieldEntity(
            placeholder: 'CheckBoxGroupField 01',
            key: 'key-section-01-8',
            isRequired: true,
            options: ['Option 01', 'Option 02', 'Option 03'],
          ),
        ],
      );

      var section = SectionModel.fromEntity(entity);

      expect(section.sectionId, 'sectionId');
      expect(section.fields.length, 7);
    });

    test('toMap', () {
      var section = SectionModel(
        sectionId: 'sectionId',
        fields: [
          TextFieldEntity(
            placeholder: 'TextField 01',
            key: 'key-section-01-1',
            isRequired: true,
          ),
          NumberFieldEntity(
            placeholder: 'NumberField 01',
            key: 'key-section-01-2',
            isRequired: true,
            minValue: 0,
            maxValue: 100,
            decimal: false,
          ),
          TypeAheadFieldEntity(
            placeholder: 'TypeAheadField 01',
            key: 'key-section-01-4',
            isRequired: true,
            options: ['Option 01', 'Option 02', 'Option 03'],
            maxLength: 10,
          ),
          RadioGroupFieldEntity(
            placeholder: 'RadioGroupField 01',
            key: 'key-section-01-5',
            isRequired: true,
            options: ['Option 01', 'Option 02', 'Option 03'],
          ),
          DateFieldEntity(
            placeholder: 'DateField 01',
            key: 'key-section-01-6',
            isRequired: true,
          ),
          CheckBoxFieldEntity(
            placeholder: 'CheckBoxField 01',
            key: 'key-section-01-7',
            isRequired: true,
          ),
          CheckBoxGroupFieldEntity(
            placeholder: 'CheckBoxGroupField 01',
            key: 'key-section-01-8',
            isRequired: true,
            options: ['Option 01', 'Option 02', 'Option 03'],
          ),
        ],
      );

      var map = section.toMap();

      expect(map['sectionId'], 'sectionId');
      expect(map['fields'].length, 7);
    });
  });
}
