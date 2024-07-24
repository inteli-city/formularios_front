import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/repositories/template_repository.dart';
import 'package:formularios_front/app/domain/usecases/get_templates_usecase.dart';

import 'get_templates_usecase_test.mocks.dart';

@GenerateMocks([ITemplateRepository])
void main() {
  late GetTemplatesUsecase usecase;
  late MockITemplateRepository mockTemplateRepository;

  setUp(() {
    mockTemplateRepository = MockITemplateRepository();
    usecase = GetTemplatesUsecase(mockTemplateRepository);
    Modular.bindModule(AppModule());
  });

  test('should return a list of TemplateEntity when getTemplates is called',
      () async {
    List<TemplateEntity> templateList = [
      TemplateEntity(
          formTitle: 'Formulário Teste',
          canVinculate: true,
          template: 'template',
          system: 'system',
          justification: JustificationEntity(
            options: [
              JustificationOptionEntity(
                  option: 'option', requiredImage: true, requiredText: true)
            ],
            justificationImage: 'justificationImage',
            justificationText: 'justificationText',
            selectedOption: 'selectedOption',
          ),
          sections: [
            SectionEntity(sectionId: 'sectionId', fields: [
              TextFieldEntity(
                  placeholder: 'placeholder', key: 'key', isRequired: true)
            ])
          ])
    ];
    when(mockTemplateRepository.getTemplates())
        .thenAnswer((_) async => Right(templateList));

    final result = await usecase();

    expect(result, Right(templateList));
    verify(mockTemplateRepository.getTemplates()).called(1);
  });

  test('should return a Failure when getTemplates is called', () async {
    S.load(const Locale.fromSubtags(languageCode: 'pt'));
    when(mockTemplateRepository.getTemplates())
        .thenAnswer((_) async => Left(UnknownError()));

    final result = await usecase();

    expect(result.isLeft(), true);
    expect(
      result.fold((l) => l, (templates) => null),
      isA<Failure>(),
    );
  });
}
