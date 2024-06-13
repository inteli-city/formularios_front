import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/usecases/save_form_usecase.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_form_usecase_test.mocks.dart';

@GenerateMocks([IFormRepository])
void main() {
  Modular.init(AppModule());
  IFormRepository formRepository = MockIFormRepository();
  late ISaveFormUsecase usecase;

  FormEntity form = FormEntity(
    formTitle: 'Poda de Árvore 3',
    formId: 'ID1142342524244',
    creatorUserId: '1',
    userId: '1',
    vinculationFormId: null,
    template: 'Poda de Árvore 3',
    area: 'area',
    system: 'Gaia',
    street: 'Rua Samuel Morse 74',
    city: 'city',
    number: 1,
    latitude: 1.0,
    longitude: 1.0,
    region: 'region',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    priority: PriorityEnum.HIGH,
    status: FormStatusEnum.CONCLUDED,
    expirationDate: 1,
    creationDate: 1,
    startDate: 1,
    conclusionDate: 1,
    justificative: JustificativeEntity(
      options: [
        JustificativeOptionEntity(
          option: 'option',
          requiredImage: true,
          requiredText: true,
        ),
      ],
      selectedOption: null,
      justificationText: null,
      justificationImage: null,
    ),
    comments: 'comments',
    sections: [
      SectionEntity(
        sectionId: 'section-01',
        fields: [
          TextFieldEntity(
            fieldType: FieldTypeEnum.TEXT_FIELD,
            placeholder: 'TextField 01',
            isRequired: true,
            key: 'key-section-01-1',
          ),
          TextFieldEntity(
            fieldType: FieldTypeEnum.TEXT_FIELD,
            placeholder: 'TextField 02',
            isRequired: true,
            key: 'key-section-01-2',
          ),
        ],
      ),
    ],
    canVinculate: true,
  );

  group('SaveFormUsecase', () {
    setUp(() async {
      await S.load(const Locale.fromSubtags(languageCode: 'pt'));
      usecase = SaveFormUsecase(repository: formRepository);
    });

    test('should save a form', () async {
      when(formRepository.updateFormLocally(form: form))
          .thenAnswer((_) async => Right(
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
                  sections: form.sections,
                  formTitle: 'formTitle',
                  canVinculate: false,
                ),
              ));

      var result = await usecase.call(
        form: form,
      );

      expect(result.isRight(), true);

      var savedForm = result.fold((left) => null, (right) => right);
      expect(savedForm, isA<FormEntity>());
    });

    test('should return a failure when form not found', () async {
      when(formRepository.updateFormLocally(
        form: form,
      )).thenAnswer((_) async => Left(NoItemsFound(message: 'message')));

      var result = await usecase.call(
        form: form,
      );

      expect(result.isLeft(), true);

      var failure = result.fold((left) => left, (right) => null);
      expect(failure, isA<NoItemsFound>());
    });
  });
}
