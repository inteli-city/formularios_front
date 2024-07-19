import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/data/repositories/form_repository_mock.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

void main() {
  late FormMockRepository repository;
  late FormEntity nonExistingFormLocally;

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    repository = FormMockRepository();
    nonExistingFormLocally = FormEntity(
      formId: 'non_existent_form_id',
      userId: 'non_existent_user_id',
      sections: [
        SectionEntity(
          sectionId: 'section_id',
          fields: [
            TextFieldEntity(
                placeholder: 'placeholder', key: 'key', isRequired: true)
          ],
        )
      ],
      latitude: 0,
      longitude: 0,
      number: 0,
      priority: PriorityEnum.EMERGENCY,
      region: 'region',
      status: FormStatusEnum.CANCELED,
      street: 'street',
      system: 'system',
      template: 'template',
      comments: null,
      conclusionDate: null,
      description: null,
      informationFields: null,
      startDate: null,
      vinculationFormId: null,
      area: 'area',
      canVinculate: false,
      city: 'city',
      creationDate: 0,
      creatorUserId: 'user_id',
      expirationDate: 0,
      formTitle: 'form_title',
      justificative: JustificativeEntity(
          options: [],
          selectedOption: null,
          justificationText: 'text',
          justificationImage: ''),
    );
  });

  group('getUserForms -', () {
    test('should return all forms by user', () async {
      var result = await repository.getUserForms();

      expect(result.isRight(), true);

      var forms = result.fold((left) => null, (right) => right);
      expect(forms, isA<List<FormEntity>>());
      expect(forms!.length, greaterThan(0));
    });
  });

  group('updateFormStatus - ', () {
    test('should update a form status by formId', () async {
      var formId = repository.formList[0].formId;

      FormStatusEnum newStatus = FormStatusEnum.IN_PROGRESS;

      var result = await repository.updateFormStatus(
        status: newStatus,
        formId: formId,
      );

      expect(result.isRight(), true);
      expect(repository.formList[0].status, newStatus);

      var updatedForm = result.fold((left) => null, (right) => right);
      expect(updatedForm, isA<FormEntity>());
      expect(updatedForm!.status, newStatus);
    });

    test('should return failure when form not found', () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      Modular.bindModule(AppModule());
      var result = await repository.updateFormStatus(
        status: FormStatusEnum.IN_PROGRESS,
        formId: 'non_existent_form_id',
      );

      expect(result.isLeft(), true);

      var failure = result.fold((left) => left, (right) => null);
      expect(failure, isA<NoDataFound>());
    });
  });

  group('updateFormSections -', () {
    test('should update a form sections by formId', () async {
      var form = repository.formList[0];
      form.sections[0].fields[1].value = 'option 01';

      var result = await repository.updateFormLocally(form: form);

      expect(result.isRight(), true);
      expect(form.sections[0].fields[1].value, 'option 01');

      var updatedForm = result.fold((left) => null, (right) => right);
      expect(updatedForm, isA<FormEntity>());
    });

    test('should return failure when form not found', () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      Modular.bindModule(AppModule());

      var result =
          await repository.updateFormLocally(form: nonExistingFormLocally);

      expect(result.isLeft(), true);

      var failure = result.fold((left) => left, (right) => null);
      expect(failure, isA<NoDataFound>());
    });
  });

  group('postForm - ', () {
    var newSections = [
      SectionEntity(
        sectionId: 'sectionId',
        fields: [
          DropDownFieldEntity(
            options: ['option 01', 'option 02'],
            placeholder: 'DropDownField',
            key: 'key-section-01-0',
            isRequired: true,
          ),
        ],
      )
    ];

    var vinculationFormId = 'vinculation_form_id';

    test('should post a form by formId', () async {
      var formId = repository.formList[0].formId;

      var formLength = repository.formList.length;

      var result = await repository.postForm(
          formId: formId,
          sections: newSections,
          vinculationFormId: vinculationFormId);

      expect(result.isRight(), true);
      expect(repository.formList.length, formLength);

      var updatedForm = result.fold((left) => null, (right) => right);
      expect(updatedForm, isA<FormEntity>());
      expect(updatedForm!.sections, newSections);
    });

    test('should return failure when form not found', () async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      Modular.bindModule(AppModule());

      var result = await repository.postForm(
        formId: 'non_existent_form_id',
        sections: newSections,
        vinculationFormId: vinculationFormId,
      );

      expect(result.isLeft(), true);

      var failure = result.fold((left) => left, (right) => null);
      expect(failure, isA<NoDataFound>());
    });
  });

  group('create form - ', () {
    test('should create a form', () async {
      var result = await repository.createForm(
        form: FormEntity(
          formId: 'existent_form_id',
          userId: 'existent_user_id',
          sections: [
            SectionEntity(
              sectionId: 'section_id',
              fields: [
                TextFieldEntity(
                  placeholder: 'placeholder',
                  key: 'key',
                  isRequired: true,
                ),
              ],
            )
          ],
          latitude: 0,
          longitude: 0,
          number: 0,
          priority: PriorityEnum.EMERGENCY,
          region: 'region',
          status: FormStatusEnum.CANCELED,
          street: 'street',
          system: 'system',
          template: 'template',
          comments: null,
          conclusionDate: null,
          description: null,
          informationFields: null,
          startDate: null,
          vinculationFormId: null,
          area: 'area',
          canVinculate: false,
          city: 'city',
          creationDate: 0,
          creatorUserId: 'user_id',
          expirationDate: 0,
          formTitle: 'form_title',
          justificative: JustificativeEntity(
            options: [],
            selectedOption: null,
            justificationText: 'text',
            justificationImage: '',
          ),
        ),
      );
      expect(result.isRight(), true);
    });
  });
}
