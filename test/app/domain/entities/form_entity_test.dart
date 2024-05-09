import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

void main() {
  group('Form Entity Test', () {
    test(' should return form entity without null values', () {
      final sectionExample = SectionEntity(fields: [], sectionId: 'section-id');
      final form = FormEntity(
        externFormId: 'externFormId',
        internFormId: 'internFormId',
        creatorUserId: 'creatorUserId',
        userId: 'userId',
        coordinatorsId: ['coordinatorsId'],
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
        status: FormStatusEnum.EM_ANDAMENTO,
        expirationDate: 1,
        creationDate: 1,
        sections: [sectionExample],
      );

      expect(form.externFormId, 'externFormId');
      expect(form.internFormId, 'internFormId');
      expect(form.creatorUserId, 'creatorUserId');
      expect(form.userId, 'userId');
      expect(form.coordinatorsId, ['coordinatorsId']);
      expect(form.template, 'template');
      expect(form.area, 'area');
      expect(form.system, 'system');
      expect(form.street, 'street');
      expect(form.city, 'city');
      expect(form.number, 1);
      expect(form.latitude, 1.0);
      expect(form.longitude, 1.0);
      expect(form.region, 'region');
      expect(form.priority, PriorityEnum.HIGH);
      expect(form.status, FormStatusEnum.EM_ANDAMENTO);
      expect(form.expirationDate, 1);
      expect(form.creationDate, 1);
      expect(form.sections, [sectionExample]);
    });

    test('should return form entity with null values', () {
      final informationField = TextInformationFieldEntity(value: 'value');
      final sectionExample = SectionEntity(fields: [], sectionId: 'section-id');
      final form = FormEntity(
        externFormId: 'externFormId',
        internFormId: 'internFormId',
        creatorUserId: 'creatorUserId',
        userId: 'userId',
        coordinatorsId: ['coordinatorsId'],
        vinculationFormId: 'vinculationFormId',
        template: 'template',
        area: 'area',
        system: 'system',
        street: 'street',
        city: 'city',
        number: 1,
        latitude: 1.0,
        longitude: 1.0,
        region: 'region',
        description: 'description',
        priority: PriorityEnum.HIGH,
        status: FormStatusEnum.EM_ANDAMENTO,
        expirationDate: 1,
        creationDate: 1,
        startDate: 1,
        endDate: 1,
        justificative: 'justificative',
        comments: 'comments',
        sections: [sectionExample],
        informationFields: [informationField],
      );

      expect(form.externFormId, 'externFormId');
      expect(form.internFormId, 'internFormId');
      expect(form.creatorUserId, 'creatorUserId');
      expect(form.userId, 'userId');
      expect(form.coordinatorsId, ['coordinatorsId']);
      expect(form.vinculationFormId, 'vinculationFormId');
      expect(form.template, 'template');
      expect(form.area, 'area');
      expect(form.system, 'system');
      expect(form.street, 'street');
      expect(form.city, 'city');
      expect(form.number, 1);
      expect(form.latitude, 1.0);
      expect(form.longitude, 1.0);
      expect(form.region, 'region');
      expect(form.description, 'description');
      expect(form.priority, PriorityEnum.HIGH);
      expect(form.status, FormStatusEnum.EM_ANDAMENTO);
      expect(form.expirationDate, 1);
      expect(form.creationDate, 1);
      expect(form.startDate, 1);
      expect(form.endDate, 1);
      expect(form.justificative, 'justificative');
      expect(form.comments, 'comments');
      expect(form.sections, [sectionExample]);
      expect(form.informationFields, [informationField]);
    });
  });
}
