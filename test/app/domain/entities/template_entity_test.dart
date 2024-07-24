import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';

void main() {
  group('TemplateEntity', () {
    late String formTitle;
    late bool canVinculate;
    late String template;
    late String system;
    late JustificationEntity justification;
    late List<SectionEntity> sections;

    setUp(() {
      formTitle = 'Formulário Teste';
      canVinculate = true;
      template = 'TemplateID123';
      system = 'SystemX';
      justification = JustificationEntity(
        options: [
          JustificationOptionEntity(
              option: 'option', requiredImage: true, requiredText: true)
        ],
        selectedOption: 'selectedOption',
        justificationText: 'justificationText',
        justificationImage: 'justificationImage',
      );
      sections = [
        SectionEntity(sectionId: 'sectionId', fields: [
          TextFieldEntity(
              placeholder: 'placeholder', key: 'key', isRequired: true)
        ])
      ];
    });

    test('should create a valid Template Entity', () {
      expect(
        () => TemplateEntity(
          formTitle: formTitle,
          canVinculate: canVinculate,
          template: template,
          system: system,
          justification: justification,
          sections: sections,
        ),
        returnsNormally,
      );
    });

    test('should throw exception for invalid Template Entity', () {
      expect(
        () => TemplateEntity(
          formTitle: formTitle,
          canVinculate: canVinculate,
          template: template,
          system: system,
          justification: justification,
          sections: [],
        ),
        throwsException,
      );
    });
  });
}
