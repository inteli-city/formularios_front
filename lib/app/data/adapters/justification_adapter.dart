import 'package:formularios_front/app/domain/entities/justification_entity.dart';

class JustificationAdapter {
  static List<JustificationEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static JustificationEntity fromJson(Map<String, dynamic> json) {
    return JustificationEntity(
      options: JustificationOptionAdapter.fromJsonList(json['options']),
      selectedOption: json['selected_option'],
      justificationText: json['justification_text'],
      justificationImage: json['justification_image'],
    );
  }

  static Map<String, dynamic> toJson(JustificationEntity justification) {
    return {
      'options': justification.options
          .map((e) => JustificationOptionAdapter.toJson(e))
          .toList(),
      'selected_option': justification.selectedOption,
      'justification_text': justification.justificationText,
      'justification_image': justification.justificationImage,
    };
  }
}

class JustificationOptionAdapter {
  static List<JustificationOptionEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static JustificationOptionEntity fromJson(Map<String, dynamic> json) {
    return JustificationOptionEntity(
      option: json['option'],
      requiredImage: json['required_image'],
      requiredText: json['required_text'],
    );
  }

  static Map<String, dynamic> toJson(JustificationOptionEntity user) {
    return {
      'option': user.option,
      'required_image': user.requiredImage,
      'required_text': user.requiredText,
    };
  }
}
