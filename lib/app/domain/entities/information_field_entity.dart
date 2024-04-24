import 'package:formularios_front/app/domain/enum/information_field_type.dart';

abstract class InformationFieldEntity {
  final InformationFieldTypeEnum informationFieldType;

  InformationFieldEntity({
    required this.informationFieldType,
  });
}

class TextInformationFieldEntity extends InformationFieldEntity {
  final String value;

  TextInformationFieldEntity({
    required this.value,
  }) : super(
          informationFieldType: InformationFieldTypeEnum.TEXT_INFORMATION_FIELD,
        );
}

class MapInformationFieldEntity extends InformationFieldEntity {
  final double latitude;
  final double longitude;

  MapInformationFieldEntity({
    required this.latitude,
    required this.longitude,
  }) : super(
          informationFieldType: InformationFieldTypeEnum.MAP_INFORMATION_FIELD,
        );
}

class ImageInformationFieldEntity extends InformationFieldEntity {
  final String filePath;

  ImageInformationFieldEntity({
    required this.filePath,
  }) : super(
          informationFieldType:
              InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD,
        );
}
