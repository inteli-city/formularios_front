import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/data/adapters/form_adapter.dart';

void main() {
  group('FormAdapter', () {
    final formJson = {
      'form_title': 'Form Title',
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
      'information_fields': null,
      'justification': {
        'options': [],
        'selected_option': '',
        'justification_text': '',
        'justification_image': '',
      },
      'start_date': 1627849200000,
      'vinculation_form_id': 'vinc1',
      'can_vinculate': true,
    };

    final formEntity = FormAdapter.fromJson(formJson);

    test('deve converter JSON para FormEntity', () {
      final form = FormAdapter.fromJson(formJson);

      expect(form.formId, '1');
      expect(form.creatorUserId, '123');
      expect(form.userId, '456');
      expect(form.template, 'template1');
      expect(form.area, 'area1');
      expect(form.system, 'system1');
      expect(form.street, 'street1');
      expect(form.city, 'city1');
      expect(form.number, 1);
      expect(form.latitude, 12.34);
      expect(form.longitude, 56.78);
      expect(form.region, 'region1');
      expect(form.priority, PriorityEnum.HIGH);
      expect(form.status, FormStatusEnum.CONCLUDED);
      expect(form.expirationDate, 1627849200000);
      expect(form.creationDate, 1627849200000);
      expect(form.sections, isA<List<SectionEntity>>());
      expect(form.comments, 'some comments');
      expect(form.description, 'some description');
      expect(form.conclusionDate, 1627849200000);
      expect(form.informationFields, isNull);
      expect(form.justificative, isA<JustificativeEntity>());
      expect(form.startDate, 1627849200000);
      expect(form.vinculationFormId, 'vinc1');
      expect(form.formTitle, 'Form Title');
      expect(form.canVinculate, true);
    });

    test('deve converter FormEntity para JSON', () {
      final json = FormAdapter.toJson(formEntity);

      expect(json, formJson);
    });

    test('deve converter lista de JSON para lista de FormEntity', () {
      final jsonList = [formJson, formJson];

      final forms = FormAdapter.fromJsonList(jsonList);

      expect(forms.length, 2);
      expect(forms[0].formId, '1');
      expect(forms[0].priority, PriorityEnum.HIGH);
    });
  });
}
