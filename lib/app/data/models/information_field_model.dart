import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/enum/information_field_type.dart';

class InformationFieldModel extends InformationFieldEntity {
  InformationFieldModel({required super.informationFieldType});

  static List<InformationFieldEntity> fromMaps(List array) {
    return array.map((e) => InformationFieldModel.fromMap(e)).toList();
  }

  static InformationFieldEntity fromMap(Map<String, dynamic> json) {
    switch (InformationFieldTypeEnum.values
        .firstWhere((e) => e.name == json['fieldType'])) {
      case InformationFieldTypeEnum.TEXT_INFORMATION_FIELD:
        return TextInformationFieldModel.fromMap(json);
      case InformationFieldTypeEnum.MAP_INFORMATION_FIELD:
        return MapInformationFieldModel.fromMap(json);
      case InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD:
        return ImageInformationFieldModel.fromMap(json);

      default:
        throw Exception('Invalid InformationFieldType');
    }
  }

  static InformationFieldEntity fromEntity(InformationFieldEntity entity) {
    switch (entity.informationFieldType) {
      case InformationFieldTypeEnum.TEXT_INFORMATION_FIELD:
        return TextInformationFieldModel.fromEntity(
            entity as TextInformationFieldEntity);
      case InformationFieldTypeEnum.MAP_INFORMATION_FIELD:
        return MapInformationFieldModel.fromEntity(
            entity as MapInformationFieldEntity);
      case InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD:
        return ImageInformationFieldModel.fromEntity(
            entity as ImageInformationFieldEntity);

      default:
        throw Exception('Invalid InformationFieldType');
    }
  }

  Map<String, dynamic> toMap() {
    switch (informationFieldType) {
      case InformationFieldTypeEnum.TEXT_INFORMATION_FIELD:
        return (this as TextInformationFieldModel).toMap();
      case InformationFieldTypeEnum.MAP_INFORMATION_FIELD:
        return (this as MapInformationFieldModel).toMap();
      case InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD:
        return (this as ImageInformationFieldModel).toMap();

      default:
        throw Exception('Invalid InformationFieldType');
    }
  }
}

class TextInformationFieldModel extends TextInformationFieldEntity {
  TextInformationFieldModel({
    required super.value,
  });

  static TextInformationFieldEntity fromMap(Map<String, dynamic> json) {
    return TextInformationFieldEntity(value: json['value']);
  }

  static TextInformationFieldEntity fromEntity(
      TextInformationFieldEntity entity) {
    return TextInformationFieldEntity(value: entity.value);
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }
}

class MapInformationFieldModel extends MapInformationFieldEntity {
  MapInformationFieldModel({
    required super.latitude,
    required super.longitude,
  });

  static MapInformationFieldEntity fromMap(Map<String, dynamic> json) {
    return MapInformationFieldEntity(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  static MapInformationFieldEntity fromEntity(
      MapInformationFieldEntity entity) {
    return MapInformationFieldEntity(
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class ImageInformationFieldModel extends ImageInformationFieldEntity {
  ImageInformationFieldModel({
    required super.filePath,
  });

  static ImageInformationFieldEntity fromMap(Map<String, dynamic> json) {
    return ImageInformationFieldEntity(filePath: json['filePath']);
  }

  static ImageInformationFieldEntity fromEntity(
      ImageInformationFieldEntity entity) {
    return ImageInformationFieldEntity(filePath: entity.filePath);
  }

  Map<String, dynamic> toMap() {
    return {
      'filePath': filePath,
    };
  }
}
