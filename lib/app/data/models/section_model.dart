import 'package:formularios_front/app/data/models/field_model.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';

class SectionModel extends SectionEntity {
  SectionModel({required super.sectionId, required super.fields});

  factory SectionModel.fromMap(Map<String, dynamic> json) {
    return SectionModel(
      sectionId: json['section_id'],
      fields: FieldModel.fromMaps(json['fields']),
    );
  }

  static List<SectionModel> fromMaps(List array) {
    return array.map((e) => SectionModel.fromMap(e)).toList();
  }

  factory SectionModel.fromEntity(SectionEntity entity) {
    return SectionModel(
      sectionId: entity.sectionId,
      fields: entity.fields.map((e) => FieldModel.fromEntity(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'section_id': sectionId,
      'fields': fields.map((e) => FieldModel.fromEntity(e).toMap()).toList(),
    };
  }
}
