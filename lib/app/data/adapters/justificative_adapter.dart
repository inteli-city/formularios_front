import 'package:formularios_front/app/domain/entities/justificative_entity.dart';

class JustificativeAdapter {
  static List<JustificativeEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static JustificativeEntity fromJson(Map<String, dynamic> json) {
    return JustificativeEntity(
      options: JustificativeOptionAdapter.fromJsonList(json['options']),
      selectedOption: json['selected_option'],
      justificationText: json['justification_text'],
      justificationImage: json['justification_image'],
    );
  }

  static Map<String, dynamic> toJson(JustificativeEntity justificative) {
    return {
      'options': justificative.options
          .map((e) => JustificativeOptionAdapter.toJson(e))
          .toList(),
      'selected_option': justificative.selectedOption,
      'justification_text': justificative.justificationText,
      'justification_image': justificative.justificationImage,
    };
  }
}

class JustificativeOptionAdapter {
  static List<JustificativeOptionEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static JustificativeOptionEntity fromJson(Map<String, dynamic> json) {
    return JustificativeOptionEntity(
      option: json['option'],
      requiredImage: json['required_image'],
      requiredText: json['required_text'],
    );
  }

  static Map<String, dynamic> toJson(JustificativeOptionEntity user) {
    return {
      'option': user.option,
      'required_image': user.requiredImage,
      'required_text': user.requiredText,
    };
  }
}
