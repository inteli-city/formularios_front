import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/data/repositories/form_mock_repository.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/generated/l10n.dart';

void main() {
  late FormMockRepository repository;

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    repository = FormMockRepository();
  });

  group('getUserForms -', () {
    test('should return all forms by userId', () async {
      var userId = repository.formList[0].userId;
      var result = await repository.getUserForms(userId: userId);

      expect(result.isRight(), true);

      var forms = result.fold((left) => null, (right) => right);
      expect(forms, isA<List<FormEntity>>());
      expect(forms!.length, greaterThan(0));
      expect(forms.every((form) => form.userId == userId), true);
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
      Modular.bindModule(AppModule());
      var result = await repository.updateFormStatus(
        status: FormStatusEnum.IN_PROGRESS,
        formId: 'non_existent_form_id',
      );

      expect(result.isLeft(), true);

      var failure = result.fold((left) => left, (right) => null);
      expect(failure, isA<NoItemsFound>());
    });
  });

  group('updateFormSections -', () {
    var newSections = [
      SectionEntity(
        sectionId: 'section_id',
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

    test('should update a form sections by formId', () async {
      var formId = repository.formList[0].formId;

      var result = await repository.updateFormSections(
        formId: formId,
        sections: newSections,
      );

      expect(result.isRight(), true);
      expect(repository.formList[0].sections, newSections);

      var updatedForm = result.fold((left) => null, (right) => right);
      expect(updatedForm, isA<FormEntity>());
      expect(updatedForm!.sections, newSections);
    });

    test('should return failure when form not found', () async {
      Modular.bindModule(AppModule());
      var result = await repository.updateFormSections(
        formId: 'non_existent_form_id',
        sections: newSections,
      );

      expect(result.isLeft(), true);

      var failure = result.fold((left) => left, (right) => null);
      expect(failure, isA<NoItemsFound>());
    });
  });

  group('postForm - ', () {
    var newSections = [
      SectionEntity(
        sectionId: 'section_id',
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
      expect(repository.formList.length, formLength - 1);

      var updatedForm = result.fold((left) => null, (right) => right);
      expect(updatedForm, isA<FormEntity>());
      expect(updatedForm!.sections, newSections);
      expect(updatedForm.vinculationFormId, vinculationFormId);
    });

    test('should return failure when form not found', () async {
      Modular.bindModule(AppModule());
      var result = await repository.postForm(
        formId: 'non_existent_form_id',
        sections: newSections,
        vinculationFormId: vinculationFormId,
      );

      expect(result.isLeft(), true);

      var failure = result.fold((left) => left, (right) => null);
      expect(failure, isA<NoItemsFound>());
    });
  });
}
