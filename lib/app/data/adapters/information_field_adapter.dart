import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/enum/information_field_type.dart';

class InformationFieldAdapter {
  static List<InformationFieldEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static InformationFieldEntity fromJson(Map<String, dynamic> json) {
    switch (InformationFieldTypeEnum.values
        .firstWhere((e) => e.name == json['information_field_type'])) {
      case InformationFieldTypeEnum.TEXT_INFORMATION_FIELD:
        return TextInformationFieldEntity(value: json['value']);
      case InformationFieldTypeEnum.MAP_INFORMATION_FIELD:
        return MapInformationFieldEntity(
          latitude: json['latitude'],
          longitude: json['longitude'],
        );
      case InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD:
        return ImageInformationFieldEntity(filePath: json['file_path']);

      default:
        throw Exception('Invalid InformationFieldType');
    }
  }

  static Map<String, dynamic> toJson(InformationFieldEntity informationField) {
    switch (informationField.informationFieldType) {
      case InformationFieldTypeEnum.TEXT_INFORMATION_FIELD:
        informationField as TextInformationFieldEntity;
        return {
          'information_field_type': informationField.informationFieldType.name,
          'value': informationField.value,
        };
      case InformationFieldTypeEnum.MAP_INFORMATION_FIELD:
        informationField as MapInformationFieldEntity;
        return {
          'information_field_type': informationField.informationFieldType.name,
          'latitude': informationField.latitude,
          'longitude': informationField.longitude,
        };
      case InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD:
        informationField as ImageInformationFieldEntity;
        return {
          'information_field_type': informationField.informationFieldType.name,
          'file_path': informationField.filePath,
        };

      default:
        throw Exception('Invalid InformationFieldType');
    }
  }
}
