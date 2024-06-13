import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/enum/information_field_type.dart';

abstract class InformationFieldModel extends InformationFieldEntity {
  InformationFieldModel({required super.informationFieldType});

  static List<InformationFieldEntity> fromMaps(List array) {
    return array.map((e) => InformationFieldModel.fromMap(e)).toList();
  }

  static InformationFieldModel fromMap(Map<String, dynamic> json) {
    switch (InformationFieldTypeEnum.values
        .firstWhere((e) => e.name == json['information_field_type'])) {
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

  static InformationFieldModel fromEntity(InformationFieldEntity entity) {
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

  Map<String, dynamic> toMap();
}

class TextInformationFieldModel extends TextInformationFieldEntity
    implements InformationFieldModel {
  TextInformationFieldModel({
    required super.value,
  });

  static TextInformationFieldModel fromMap(Map<String, dynamic> json) {
    return TextInformationFieldModel(value: json['value']);
  }

  static TextInformationFieldModel fromEntity(
      TextInformationFieldEntity entity) {
    return TextInformationFieldModel(value: entity.value);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'information_field_type':
          InformationFieldTypeEnum.TEXT_INFORMATION_FIELD.name,
      'value': value,
    };
  }
}

class MapInformationFieldModel extends MapInformationFieldEntity
    implements InformationFieldModel {
  MapInformationFieldModel({
    required super.latitude,
    required super.longitude,
  });

  static MapInformationFieldModel fromMap(Map<String, dynamic> json) {
    return MapInformationFieldModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  static MapInformationFieldModel fromEntity(MapInformationFieldEntity entity) {
    return MapInformationFieldModel(
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'information_field_type':
          InformationFieldTypeEnum.MAP_INFORMATION_FIELD.name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class ImageInformationFieldModel extends ImageInformationFieldEntity
    implements InformationFieldModel {
  ImageInformationFieldModel({
    required super.filePath,
  });

  static ImageInformationFieldModel fromMap(Map<String, dynamic> json) {
    return ImageInformationFieldModel(filePath: json['file_path']);
  }

  static ImageInformationFieldModel fromEntity(
      ImageInformationFieldEntity entity) {
    return ImageInformationFieldModel(filePath: entity.filePath);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'information_field_type':
          InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD.name,
      'file_path': filePath,
    };
  }
}
