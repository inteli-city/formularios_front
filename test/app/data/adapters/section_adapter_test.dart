import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/adapters/section_adapter.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';

void main() {
  group('SectionAdapter', () {
    test('deve converter JSON para SectionEntity', () {
      final json = {
        'section_id': '123',
        'fields': [
          {
            'field_type': 'TEXT_FIELD',
            'placeholder': 'placeholder',
            'key': 'key',
            'required': true,
            'regex': r'^[a-zA-Z]+$',
            'formatting': null,
            'value': 'value',
            'max_length': 50,
          },
        ],
      };

      final section = SectionAdapter.fromJson(json);

      expect(section.sectionId, '123');
      expect(section.fields.length, 1);
      expect(section.fields[0], isA<TextFieldEntity>());
    });

    test('deve converter SectionEntity para JSON', () {
      final section = SectionEntity(
        sectionId: '123',
        fields: [
          TextFieldEntity(
            fieldType: FieldTypeEnum.TEXT_FIELD,
            placeholder: 'placeholder',
            key: 'key',
            isRequired: true,
            regex: r'^[a-zA-Z]+$',
            formatting: null,
            value: 'value',
            maxLength: 50,
          ),
        ],
      );

      final json = SectionAdapter.toJson(section);

      expect(json['section_id'], '123');
      expect(json['fields'].length, 1);
      expect(json['fields'][0]['field_type'], 'TEXT_FIELD');
      expect(json['fields'][0]['placeholder'], 'placeholder');
      expect(json['fields'][0]['key'], 'key');
      expect(json['fields'][0]['required'], true);
      expect(json['fields'][0]['regex'], r'^[a-zA-Z]+$');
      expect(json['fields'][0]['formatting'], null);
      expect(json['fields'][0]['value'], 'value');
      expect(json['fields'][0]['max_length'], 50);
    });

    test('deve converter lista de JSON para lista de SectionEntity', () {
      final jsonList = [
        {
          'section_id': '123',
          'fields': [
            {
              'field_type': 'TEXT_FIELD',
              'placeholder': 'placeholder',
              'key': 'key',
              'required': true,
              'regex': r'^[a-zA-Z]+$',
              'formatting': null,
              'value': 'value',
              'max_length': 50,
            },
          ],
        },
        {
          'section_id': '124',
          'fields': [
            {
              'field_type': 'NUMBER_FIELD',
              'placeholder': 'placeholder',
              'key': 'key',
              'required': true,
              'value': 25.0,
              'min_value': 18,
              'max_value': 99,
              'decimal': false,
            },
          ],
        },
      ];

      final sections = SectionAdapter.fromJsonList(jsonList);

      expect(sections.length, 2);
      expect(sections[0].sectionId, '123');
      expect(sections[0].fields.length, 1);
      expect(sections[0].fields[0], isA<TextFieldEntity>());
      expect(sections[1].sectionId, '124');
      expect(sections[1].fields.length, 1);
      expect(sections[1].fields[0], isA<NumberFieldEntity>());
    });

  });
}
