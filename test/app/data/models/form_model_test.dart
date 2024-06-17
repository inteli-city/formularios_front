import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

void main() {
  group('FormModel Tests', () {
    final formMap = {
      'form_id': '1',
      'creator_user_id': '123',
      'user_id': '456',
      'template': 'template1',
      'area': 'area1',
      'system': 'system1',
      'street': 'street1',
      'city': 'city1',
      'number': 1,
      'latitude': 12.34,
      'longitude': 56.78,
      'region': 'region1',
      'priority': 'HIGH',
      'status': 'CONCLUDED',
      'expiration_date': 1627849200000,
      'creation_date': 1627849200000,
      'sections': [
        {
          'section_id': 'section-id',
          'fields': [
            {
              'field_type': 'TEXT_FIELD',
              'placeholder': 'Placeholder Campo',
              'key': 'key',
              'required': true,
              'regex': 'regex',
              'formatting': 'formatting',
              'value': 'Initial value',
              'max_length': 100
            }
          ],
        }
      ],
      'comments': 'some comments',
      'description': 'some description',
      'conclusion_date': 1627849200000,
      'information_fields': [],
      'justification': {
        'options': [],
        'selected_option': '',
        'justification_text': '',
        'justification_image':'',
      },
      'start_date': 1627849200000,
      'vinculation_form_id': 'vinc1',
      'form_title': 'Form Title',
      'can_vinculate': true,
    };

    test('should create FormModel from map', () {
      final formModel = FormModel.fromMap(formMap);

      expect(formModel.formId, '1');
      expect(formModel.creatorUserId, '123');
      expect(formModel.userId, '456');
      expect(formModel.template, 'template1');
      expect(formModel.area, 'area1');
      expect(formModel.system, 'system1');
      expect(formModel.street, 'street1');
      expect(formModel.city, 'city1');
      expect(formModel.number, 1);
      expect(formModel.latitude, 12.34);
      expect(formModel.longitude, 56.78);
      expect(formModel.region, 'region1');
      expect(formModel.priority, PriorityEnum.HIGH);
      expect(formModel.status, FormStatusEnum.CONCLUDED);
      expect(formModel.expirationDate, 1627849200000);
      expect(formModel.creationDate, 1627849200000);
      expect(formModel.sections, isA<List<SectionEntity>>());
      expect(formModel.comments, 'some comments');
      expect(formModel.description, 'some description');
      expect(formModel.conclusionDate, 1627849200000);
      expect(formModel.informationFields, isA<List<InformationFieldEntity>>());
      expect(formModel.justificative, isA<JustificativeEntity>());
      expect(formModel.startDate, 1627849200000);
      expect(formModel.vinculationFormId, 'vinc1');
      expect(formModel.formTitle, 'Form Title');
      expect(formModel.canVinculate, true);
    });

    test('should convert FormModel to map', () {
      final formModel = FormModel.fromMap(formMap);
      final formMapFromModel = formModel.toMap();

      expect(formMapFromModel, formMap);
    });

    test('should create FormModel from entity', () {
      final entity = FormEntity(
        formId: '1',
        creatorUserId: '123',
        userId: '456',
        template: 'template1',
        area: 'area1',
        system: 'system1',
        street: 'street1',
        city: 'city1',
        number: 1,
        latitude: 12.34,
        longitude: 56.78,
        region: 'region1',
        priority: PriorityEnum.HIGH,
        status: FormStatusEnum.CONCLUDED,
        expirationDate: 1627849200000,
        creationDate: 1627849200000,
        sections: [
          SectionEntity(
            sectionId: 'section-id',
            fields: [
              TextFieldEntity(
                  placeholder: 'Placeholder Campo',
                  key: 'key',
                  fieldType: FieldTypeEnum.TEXT_FIELD,
                  formatting: 'formatting',
                  maxLength: 100,
                  value: 'Initial value',
                  regex: 'regex',
                  isRequired: true)
            ],
          )
        ],
        justificative: JustificativeEntity(
            justificationImage: '',
            options: [],
            selectedOption: '',
            justificationText: ''),
        formTitle: 'Form Title',
        canVinculate: true,
        comments: 'some comments',
        description: 'some description',
        conclusionDate: 1627849200000,
        informationFields: [],
        startDate: 1627849200000,
        vinculationFormId: 'vinc1',
      );

      final formModel = FormModel.fromEntity(entity);

      expect(formModel.formId, '1');
      expect(formModel.creatorUserId, '123');
      expect(formModel.userId, '456');
      expect(formModel.template, 'template1');
      expect(formModel.area, 'area1');
      expect(formModel.system, 'system1');
      expect(formModel.street, 'street1');
      expect(formModel.city, 'city1');
      expect(formModel.number, 1);
      expect(formModel.latitude, 12.34);
      expect(formModel.longitude, 56.78);
      expect(formModel.region, 'region1');
      expect(formModel.priority, PriorityEnum.HIGH);
      expect(formModel.status, FormStatusEnum.CONCLUDED);
      expect(formModel.expirationDate, 1627849200000);
      expect(formModel.creationDate, 1627849200000);
      expect(formModel.sections, isA<List<SectionEntity>>());
      expect(formModel.comments, 'some comments');
      expect(formModel.description, 'some description');
      expect(formModel.conclusionDate, 1627849200000);
      expect(formModel.informationFields, isA<List<InformationFieldEntity>>());
      expect(formModel.justificative, isA<JustificativeEntity>());
      expect(formModel.startDate, 1627849200000);
      expect(formModel.vinculationFormId, 'vinc1');
      expect(formModel.formTitle, 'Form Title');
      expect(formModel.canVinculate, true);
    });

    test('should copy FormModel with new values', () {
      final formModel = FormModel.fromMap(formMap);
      final updatedFormModel = formModel.copyWith(
        formTitle: 'Updated Form Title',
        city: 'new city',
      );

      expect(updatedFormModel.formTitle, 'Updated Form Title');
      expect(updatedFormModel.city, 'new city');
      expect(updatedFormModel.formId, formModel.formId);
      expect(updatedFormModel.creatorUserId, formModel.creatorUserId);
    });
  });
}
