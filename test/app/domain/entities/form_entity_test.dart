import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

void main() {
  group('Form Entity Test', () {
    test(' should return form entity with non-null values', () {
      final sectionExample = SectionEntity(fields: [], sectionId: 'section-id');
      final form = FormEntity(
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
        sections: [sectionExample],
        formTitle: 'formTitle',
        canVinculate: false,
        justificative: JustificativeEntity(
            options: [], selectedOption: null, text: 'text', image: null),
      );

      expect(form.formId, 'formId');
      expect(form.creatorUserId, 'creatorUserId');
      expect(form.userId, 'userId');
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
      expect(form.status, FormStatusEnum.IN_PROGRESS);
      expect(form.expirationDate, 1);
      expect(form.creationDate, 1);
      expect(form.sections, [sectionExample]);
      expect(form.justificative, isA<JustificativeEntity>());
      expect(form.formTitle, 'formTitle');
      expect(form.canVinculate, false);
    });

    test('should return form entity with null values', () {
      final informationField = TextInformationFieldEntity(value: 'value');
      final sectionExample = SectionEntity(fields: [], sectionId: 'section-id');

      final form = FormEntity(
        formId: 'formId',
        creatorUserId: 'creatorUserId',
        userId: 'userId',
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
        status: FormStatusEnum.IN_PROGRESS,
        expirationDate: 1,
        creationDate: 1,
        startDate: 1,
        conclusionDate: 1,
        justificative: JustificativeEntity(
            options: [], selectedOption: null, text: 'text', image: null),
        comments: 'comments',
        sections: [sectionExample],
        informationFields: [informationField],
        formTitle: 'formTitle',
        canVinculate: false,
      );

      expect(form.formId, 'formId');
      expect(form.creatorUserId, 'creatorUserId');
      expect(form.userId, 'userId');
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
      expect(form.status, FormStatusEnum.IN_PROGRESS);
      expect(form.expirationDate, 1);
      expect(form.creationDate, 1);
      expect(form.startDate, 1);
      expect(form.conclusionDate, 1);
      expect(form.comments, 'comments');
      expect(form.sections, [sectionExample]);
      expect(form.informationFields, [informationField]);
      expect(form.justificative, isA<JustificativeEntity>());
      expect(form.formTitle, 'formTitle');
      expect(form.canVinculate, false);
    });
    test('should return a copy of form entity', () {
      final sectionExample = SectionEntity(fields: [], sectionId: 'section-id');
      final form = FormEntity(
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
        sections: [sectionExample],
        justificative: JustificativeEntity(
            options: [], selectedOption: null, text: 'text', image: null),
        formTitle: 'formTitle',
        canVinculate: false,
      );

      FormModel formEntity = FormModel.fromEntity(form);

      final copyForm = formEntity.copyWith();

      expect(copyForm.formId, 'formId');
      expect(copyForm.creatorUserId, 'creatorUserId');
      expect(copyForm.userId, 'userId');
      expect(copyForm.template, 'template');
      expect(copyForm.area, 'area');
      expect(copyForm.system, 'system');
      expect(copyForm.street, 'street');
      expect(copyForm.city, 'city');
      expect(copyForm.number, 1);
      expect(copyForm.latitude, 1.0);
      expect(copyForm.longitude, 1.0);
      expect(copyForm.region, 'region');
      expect(copyForm.priority, PriorityEnum.HIGH);
      expect(copyForm.status, FormStatusEnum.IN_PROGRESS);
      expect(copyForm.expirationDate, 1);
      expect(copyForm.creationDate, 1);
      expect(copyForm.sections, [sectionExample]);
      expect(copyForm.justificative, isA<JustificativeEntity>());
      expect(copyForm.formTitle, 'formTitle');
      expect(copyForm.canVinculate, false);
    });
  });
}
