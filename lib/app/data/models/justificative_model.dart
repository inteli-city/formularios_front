import 'package:formularios_front/app/domain/entities/justificative_entity.dart';

class JustificativeModel extends JustificativeEntity {
  JustificativeModel({
    required super.options,
    required super.selectedOption,
    required super.justificationText,
    required super.justificationImage,
  });

  factory JustificativeModel.fromMap(Map<String, dynamic> json) {
    return JustificativeModel(
      options: JustificativeOptionModel.fromMaps(json['options']),
      selectedOption: json['selected_option'],
      justificationText: json['justification_text'],
      justificationImage: json['justification_image'],
    );
  }

  factory JustificativeModel.fromEntity(JustificativeEntity entity) {
    return JustificativeModel(
      options: entity.options
          .map((e) => JustificativeOptionModel.fromEntity(e))
          .toList(),
      selectedOption: entity.selectedOption,
      justificationText: entity.justificationText,
      justificationImage: entity.justificationImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'options': options
          .map((e) => JustificativeOptionModel.fromEntity(e).toMap())
          .toList(),
      'selected_option': selectedOption,
      'justification_text': justificationText,
      'justification_image': justificationImage,
    };
  }
}

class JustificativeOptionModel extends JustificativeOptionEntity {
  JustificativeOptionModel({
    required super.option,
    required super.requiredImage,
    required super.requiredText,
  });

  factory JustificativeOptionModel.fromMap(Map<String, dynamic> json) {
    return JustificativeOptionModel(
      option: json['option'],
      requiredImage: json['required_image'],
      requiredText: json['required_text'],
    );
  }

  static List<JustificativeOptionModel> fromMaps(List json) {
    return json.map((e) => JustificativeOptionModel.fromMap(e)).toList();
  }

  factory JustificativeOptionModel.fromEntity(
      JustificativeOptionEntity entity) {
    return JustificativeOptionModel(
      option: entity.option,
      requiredImage: entity.requiredImage,
      requiredText: entity.requiredText,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'option': option,
      'required_image': requiredImage,
      'required_text': requiredText,
    };
  }
}
