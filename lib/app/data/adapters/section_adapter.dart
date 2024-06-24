import 'package:formularios_front/app/data/adapters/field_adapter.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';

class SectionAdapter {
  static List<SectionEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static SectionEntity fromJson(Map<String, dynamic> json) {
    return SectionEntity(
      sectionId: json['section_id'],
      fields: FieldAdapter.fromJsonList(json['fields']),
    );
  }

  static Map<String, dynamic> toJson(SectionEntity section) {
    return {
      'section_id': section.sectionId,
      'fields': section.fields.map((e) => FieldAdapter.toJson(e)).toList(),
    };
  }
}
