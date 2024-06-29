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
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/usecases/send_form_usecase.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'send_form_usecase_test.mocks.dart';

@GenerateMocks([IFormRepository])
void main() {
  Modular.bindModule(AppModule());
  IFormRepository formRepository = MockIFormRepository();
  late ISendFormUsecase usecase;

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'pt'));
    usecase = SendFormUsecase(repository: formRepository);
  });

  group('SendFormUsecase', () {
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

    var vinculationFormId = 'vinculationFormId';

    test('should return a FormEntity', () async {
      when(formRepository.postForm(
        formId: 'formId',
        sections: newSections,
        vinculationFormId: vinculationFormId,
      )).thenAnswer((_) async => Right(
            FormEntity(
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
              sections: newSections,
              formTitle: 'formTitle',
              canVinculate: false,
            ),
          ));

      var result = await usecase.call(
        formId: 'formId',
        sections: newSections,
        vinculationFormId: vinculationFormId,
      );

      expect(result.isRight(), true);
      var form = result.fold((left) => null, (right) => right);
      expect(form, isA<FormEntity>());
    });

    test('should return a Failure', () async {
      when(formRepository.postForm(
        formId: 'non_existent_form_id',
        sections: newSections,
        vinculationFormId: vinculationFormId,
      )).thenAnswer((_) async => Left(NoDataFound()));

      var result = await usecase.call(
        formId: 'non_existent_form_id',
        sections: newSections,
        vinculationFormId: vinculationFormId,
      );

      expect(result.isLeft(), true);

      var failure = result.fold((left) => left, (right) => null);
      expect(failure, isA<NoDataFound>());
    });
  });
}
