import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/usecases/update_form_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_user_forms_usecase_test.mocks.dart';

@GenerateMocks([IFormRepository])
void main() {
  Modular.bindModule(AppModule());
  IFormRepository formRepository = MockIFormRepository();
  late IUpdateFormStatusUseCase usecase;
  usecase = UpdateFormStatusUseCase(repository: formRepository);

  group('InitializedUserFormStatus', () {
    late FormEntity form;
    setUp(() {
      form = FormEntity(
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
              options: [],
              selectedOption: null,
              justificationText: 'text',
              justificationImage: null),
          comments: 'comments',
          sections: [
            SectionEntity(
              sectionId: 'sectionId',
              fields: [
                TextFieldEntity(
                    placeholder: 'placeholder', key: 'key', isRequired: true)
              ],
            )
          ],
          formTitle: 'formTitle',
          canVinculate: false);
    });

    test('should return a list of FormEntity', () async {
      when(formRepository.updateFormStatus(
              status: FormStatusEnum.IN_PROGRESS, formId: form.formId))
          .thenAnswer(
        (_) async => Right(form),
      );

      var result = await usecase(
          formId: form.formId, status: FormStatusEnum.IN_PROGRESS);

      expect(result.isRight(), true);

      expect(
        result.fold((l) => null, (form) => form),
        isA<FormEntity>(),
      );

      expect(
        result.fold((l) => null, (form) => form.status),
        FormStatusEnum.IN_PROGRESS,
      );
    });

    test('should return a Failure', () async {
      S.load(const Locale.fromSubtags(languageCode: 'pt'));
      when(formRepository.updateFormStatus(
              formId: form.formId, status: FormStatusEnum.IN_PROGRESS))
          .thenAnswer((_) async => Left(UnknownError()));

      var result = await usecase(
          formId: form.formId, status: FormStatusEnum.IN_PROGRESS);

      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (form) => null),
        isA<Failure>(),
      );
    });
  });
}
