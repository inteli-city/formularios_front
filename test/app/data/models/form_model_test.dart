import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

void main() {
  group('FormModel -', () {
    final section = SectionEntity(
      sectionId: 'section-id',
      fields: [
        TextFieldEntity(
          fieldType: FieldTypeEnum.TEXT_FIELD,
          placeholder: 'Placeholder Campo',
          isRequired: true,
          regex: 'regex',
          formatting: 'formatting',
          key: 'key',
          maxLength: 100,
          value: 'Initial value',
        )
      ],
    );

    var model = FormModel(
      formId: 'formId',
      creatorUserId: 'creatorUserId',
      userId: 'userId',
      template: 'template',
      area: 'area',
      system: 'system',
      street: 'street',
      city: 'city',
      number: 1,
      latitude: 1.0,
      longitude: 1.0,
      region: 'region',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.IN_PROGRESS,
      expirationDate: 1,
      creationDate: 1,
      sections: [section],
      formTitle: 'formTitle',
      canVinculate: false,
      justificative: JustificativeEntity(
        options: [],
        selectedOption: null,
        text: 'text',
        image: null,
      ),
    );
    test('toMap', () {
      var map = model.toMap();

      expect(map['formId'], 'formId');
      expect(map['creatorUserId'], 'creatorUserId');
      expect(map['userId'], 'userId');
      expect(map['template'], 'template');
      expect(map['area'], 'area');
      expect(map['system'], 'system');
      expect(map['street'], 'street');
      expect(map['city'], 'city');
      expect(map['number'], 1);
      expect(map['latitude'], 1.0);
      expect(map['longitude'], 1.0);
      expect(map['region'], 'region');
      expect(map['priority'], PriorityEnum.HIGH.name);
      expect(map['status'], FormStatusEnum.IN_PROGRESS.name);
      expect(map['expirationDate'], 1);
      expect(map['creationDate'], 1);
      expect(map['sections'], [
        {
          'sectionId': 'section-id',
          'fields': [
            {
              'fieldType': 'TEXT_FIELD',
              'placeholder': 'Placeholder Campo',
              'key': 'key',
              'isRequired': true,
              'regex': 'regex',
              'formatting': 'formatting',
              'value': 'Initial value',
              'maxLength': 100
            }
          ],
        }
      ]);
      expect(map['formTitle'], 'formTitle');
      expect(map['canVinculate'], false);
      expect(map['justificative'], {
        'options': [],
        'selectedOption': null,
        'text': 'text',
        'image': null,
      });
    });

    test('fromMap', () {
      var map = model.toMap();

      var fromMap = FormModel.fromMap(map);

      expect(fromMap.formId, 'formId');
      expect(fromMap.creatorUserId, 'creatorUserId');
      expect(fromMap.userId, 'userId');
      expect(fromMap.template, 'template');
      expect(fromMap.area, 'area');
      expect(fromMap.system, 'system');
      expect(fromMap.street, 'street');
      expect(fromMap.city, 'city');
      expect(fromMap.number, 1);
      expect(fromMap.latitude, 1.0);
      expect(fromMap.longitude, 1.0);
      expect(fromMap.region, 'region');
      expect(fromMap.priority, PriorityEnum.HIGH);
      expect(fromMap.status, FormStatusEnum.IN_PROGRESS);
      expect(fromMap.expirationDate, 1);
      expect(fromMap.creationDate, 1);
      expect(fromMap.sections.length, 1);
      expect(fromMap.formTitle, 'formTitle');
      expect(fromMap.canVinculate, false);
      expect(fromMap.justificative.options, []);
      expect(fromMap.justificative.selectedOption, null);
      expect(fromMap.justificative.text, 'text');
      expect(fromMap.justificative.image, null);
    });
  });
}
