import 'package:formularios_front/app/domain/entities/justificative_entity.dart';

class JustificativeModel extends JustificativeEntity {
  JustificativeModel({
    required super.options,
    required super.selectedOption,
    required super.text,
    required super.image,
  });

  factory JustificativeModel.fromMap(Map<String, dynamic> json) {
    return JustificativeModel(
      options: JustificativeOptionModel.fromMaps(json['options']),
      selectedOption: json['selectedOption'],
      text: json['text'],
      image: json['image'],
    );
  }

  factory JustificativeModel.fromEntity(JustificativeEntity entity) {
    return JustificativeModel(
      options: entity.options
          .map((e) => JustificativeOptionModel.fromEntity(e))
          .toList(),
      selectedOption: entity.selectedOption,
      text: entity.text,
      image: entity.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'options': options
          .map((e) => JustificativeOptionModel.fromEntity(e).toMap())
          .toList(),
      'selectedOption': selectedOption,
      'text': text,
      'image': image,
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
      requiredImage: json['requiredImage'],
      requiredText: json['requiredText'],
    );
  }

  static List<JustificativeOptionModel> fromMaps(
      List<Map<String, dynamic>> json) {
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
      'requiredImage': requiredImage,
      'requiredText': requiredText,
    };
  }
}
