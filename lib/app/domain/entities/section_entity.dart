import 'package:formularios_front/app/domain/entities/field_entity.dart';

class SectionEntity {
  final String sectionId;
  final List<FieldEntity> fields;

  SectionEntity({
    required this.sectionId,
    required this.fields,
  }) {
    if (fields.isEmpty) {
      throw Exception('Section must have at least one field');
    }
  }
}
