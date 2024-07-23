import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/usecases/create_form_usecase.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';

import 'create_form_usecase_test.mocks.dart';

@GenerateMocks([IFormRepository])
void main() {
  late ICreateFormUsecase usecase;
  late MockIFormRepository mockFormRepository;

  setUp(() {
    mockFormRepository = MockIFormRepository();
    usecase = CreateFormUsecase(repository: mockFormRepository);
    Modular.bindModule(AppModule());
  });

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
    justification: JustificativeEntity(
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

  TemplateEntity template = TemplateEntity(
    formTitle: 'Form Title',
    template: 'Poda de Árvore',
    canVinculate: false,
    system: 'system',
    justificative: JustificativeEntity(
        options: [
          JustificativeOptionEntity(
              option: 'option', requiredImage: false, requiredText: false)
        ],
        selectedOption: 'selectedOption',
        justificationText: 'justificationText',
        justificationImage: 'justificationImage'),
    sections: [
      form.sections[0],
    ],
  );

  test('should return a list of TemplateEntity when getTemplates is called',
      () async {
    when(mockFormRepository.createForm(form: anyNamed('form')))
        .thenAnswer((_) async => Right(form));

    final result = await usecase(
        template: template,
        area: form.area,
        city: form.city,
        street: form.street,
        number: form.number,
        latitude: form.latitude,
        longitude: form.longitude,
        region: form.region,
        description: form.description,
        priority: form.priority);

    expect(result, Right(form));
  });

  test('should return a Failure when getTemplates is called', () async {
    S.load(const Locale.fromSubtags(languageCode: 'pt'));
    when(mockFormRepository.createForm(form: anyNamed('form')))
        .thenAnswer((_) async => Left(UnknownError()));

    final result = await usecase(
      template: template,
      area: form.area,
      city: form.city,
      street: form.street,
      number: form.number,
      latitude: form.latitude,
      longitude: form.longitude,
      region: form.region,
      description: form.description,
      priority: form.priority,
    );

    expect(result.isLeft(), true);
    expect(
      result.fold((l) => l, (templates) => null),
      isA<Failure>(),
    );
  });
}
