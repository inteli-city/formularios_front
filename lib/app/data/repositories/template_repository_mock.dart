import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/template_repository.dart';

class TemplateRepositoryMock implements ITemplateRepository {
  List<TemplateEntity> templates = [
    TemplateEntity(
      formTitle: 'Template Poda de Árvore',
      canVinculate: true,
      template: 'Template Poda de Árvore',
      system: 'GAIA',
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
      sections: [
        SectionEntity(
          sectionId: 'section-01',
          fields: [
            DropDownFieldEntity(
              options: ['option 01', 'option 02'],
              placeholder: 'DropDownField',
              key: 'key-section-01-0',
              isRequired: true,
            ),
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
            NumberFieldEntity(
              fieldType: FieldTypeEnum.NUMBER_FIELD,
              placeholder: 'NumberField 01',
              isRequired: true,
              key: 'key-section-01-3',
              decimal: false,
            ),
            DateFieldEntity(
              fieldType: FieldTypeEnum.DATE_FIELD,
              placeholder: 'DateField',
              isRequired: true,
              key: 'key-section-01-4',
            ),
            RadioGroupFieldEntity(
              options: ['option1', 'option2'],
              placeholder: 'Radio Group',
              key: 'key-section-01-5',
              isRequired: true,
            ),
            TypeAheadFieldEntity(
              options: ['option1', 'option2'],
              placeholder: 'TypeAhead',
              key: 'key-section-01-6',
              isRequired: true,
            ),
          ],
        ),
        SectionEntity(
          sectionId: 'section-02',
          fields: [
            SwitchButtonFieldEntity(
              placeholder: 'SwitchButton',
              key: 'key-section-02-0',
              isRequired: true,
            )
          ],
        ),
      ],
    ),
    TemplateEntity(
      formTitle: 'Template Recape SP',
      canVinculate: true,
      template: 'Template Recape SP',
      system: 'RECAPE_SP',
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
      sections: [
        SectionEntity(
          sectionId: 'section-01',
          fields: [
            DropDownFieldEntity(
              options: ['option 01', 'option 02'],
              placeholder: 'DropDownField',
              key: 'key-section-01-0',
              isRequired: true,
            ),
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
            NumberFieldEntity(
              fieldType: FieldTypeEnum.NUMBER_FIELD,
              placeholder: 'NumberField 01',
              isRequired: true,
              key: 'key-section-01-3',
              decimal: false,
            ),
            DateFieldEntity(
              fieldType: FieldTypeEnum.DATE_FIELD,
              placeholder: 'DateField',
              isRequired: true,
              key: 'key-section-01-4',
            ),
            RadioGroupFieldEntity(
              options: ['option1', 'option2'],
              placeholder: 'Radio Group',
              key: 'key-section-01-5',
              isRequired: true,
            ),
            TypeAheadFieldEntity(
              options: ['option1', 'option2'],
              placeholder: 'TypeAhead',
              key: 'key-section-01-6',
              isRequired: true,
            ),
          ],
        ),
        SectionEntity(
          sectionId: 'section-02',
          fields: [
            SwitchButtonFieldEntity(
              placeholder: 'SwitchButton',
              key: 'key-section-02-0',
              isRequired: true,
            )
          ],
        ),
      ],
    ),
  ];

  @override
  Future<Either<Failure, List<TemplateEntity>>> getTemplates() async {
    return Right(templates);
  }
}
