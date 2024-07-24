import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/usecases/cancel_form_usecase.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cancel_form_usecase_test.mocks.dart';

@GenerateMocks([IFormRepository])
void main() {
  Modular.bindModule(AppModule());
  IFormRepository formRepository = MockIFormRepository();
  late ICancelFormUseCase usecase;
  usecase = CancelFormUseCase(repository: formRepository);

  FormEntity form = FormEntity(
    formTitle: 'Form Title',
    formId: 'ID1142342524242',
    creatorUserId: '1',
    userId: '1',
    vinculationFormId: '10',
    template: 'Poda de Árvore',
    area: 'area',
    system: 'Gaia',
    street: 'Rua Samuel Morse',
    city: 'São Paulo',
    number: 120,
    latitude: -23.610366,
    longitude: -46.694891,
    region: 'region',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
    priority: PriorityEnum.HIGH,
    status: FormStatusEnum.IN_PROGRESS,
    expirationDate: 1715000631000,
    creationDate: 1704561963000,
    startDate: 1,
    conclusionDate: 1,
    justification: JustificationEntity(
      options: [
        JustificationOptionEntity(
            option: 'option', requiredImage: true, requiredText: true),
      ],
      selectedOption: 'option',
      justificationText: 'text',
      justificationImage: 'image',
    ),
    comments: 'comments',
    sections: [
      SectionEntity(
        sectionId: 'section-01',
        fields: [
          CheckBoxGroupFieldEntity(
            options: ['option 01', 'option 02', 'option 03'],
            placeholder: 'Selecione as opções',
            key: 'checkbox-group',
            checkLimit: 1,
            isRequired: true,
          ),
        ],
      ),
    ],
    canVinculate: true,
  );

  group('CancelFormUseCase', () {
    var justification = JustificationEntity(
      options: [
        JustificationOptionEntity(
            option: 'option', requiredImage: true, requiredText: true),
      ],
      selectedOption: 'option',
      justificationText: 'text',
      justificationImage: 'image',
    );
    test('should return a FormEntity', () async {
      when(formRepository.cancelForm(
              justification: justification, formId: 'formId'))
          .thenAnswer((_) async => Right(form));

      var result =
          await usecase(formId: 'formId', justification: justification);

      expect(result.isRight(), true);
      expect(
        result.fold((l) => null, (forms) => forms),
        isA<FormEntity>(),
      );
      expect(
        result.fold((l) => null, (r) => r.justification.selectedOption),
        'option',
      );
    });

    test('should return a Failure', () async {
      S.load(const Locale.fromSubtags(languageCode: 'en'));
      when(formRepository.cancelForm(
              justification: justification, formId: 'formId'))
          .thenAnswer((_) async => Left(UnknownError()));

      var result =
          await usecase(formId: 'formId', justification: justification);

      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (r) => null),
        isA<Failure>(),
      );
    });
  });
}
