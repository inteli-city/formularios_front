import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';

class TemplateEntity {
  final String formTitle;
  final bool canVinculate;
  final String template;
  final String system;
  final JustificationEntity justification;
  final List<SectionEntity> sections;

  TemplateEntity({
    required this.formTitle,
    required this.canVinculate,
    required this.template,
    required this.system,
    required this.justification,
    required this.sections,
  }) {
    if (sections.isEmpty) {
      throw Exception('Form must have at least one section');
    }
  }
}
