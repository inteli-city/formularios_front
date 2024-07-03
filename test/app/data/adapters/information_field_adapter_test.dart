import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/enum/information_field_type.dart';
import 'package:formularios_front/app/data/adapters/information_field_adapter.dart';

void main() {
  group('InformationFieldAdapter', () {
    test('deve converter JSON para TextInformationFieldEntity', () {
      final json = {
        'information_field_type': 'TEXT_INFORMATION_FIELD',
        'value': 'Texto de informação',
      };

      final field =
          InformationFieldAdapter.fromJson(json) as TextInformationFieldEntity;

      expect(field.informationFieldType,
          InformationFieldTypeEnum.TEXT_INFORMATION_FIELD);
      expect(field.value, 'Texto de informação');
    });

    test('deve converter JSON para MapInformationFieldEntity', () {
      final json = {
        'information_field_type': 'MAP_INFORMATION_FIELD',
        'latitude': 123.456,
        'longitude': 789.012,
      };

      final field =
          InformationFieldAdapter.fromJson(json) as MapInformationFieldEntity;

      expect(field.informationFieldType,
          InformationFieldTypeEnum.MAP_INFORMATION_FIELD);
      expect(field.latitude, 123.456);
      expect(field.longitude, 789.012);
    });

    test('deve converter JSON para ImageInformationFieldEntity', () {
      final json = {
        'information_field_type': 'IMAGE_INFORMATION_FIELD',
        'file_path': 'caminho/para/imagem.png',
      };

      final field =
          InformationFieldAdapter.fromJson(json) as ImageInformationFieldEntity;

      expect(field.informationFieldType,
          InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD);
      expect(field.filePath, 'caminho/para/imagem.png');
    });

    test('deve converter TextInformationFieldEntity para JSON', () {
      final field = TextInformationFieldEntity(
        value: 'Texto de informação',
      );

      final json = InformationFieldAdapter.toJson(field);

      expect(json['information_field_type'], 'TEXT_INFORMATION_FIELD');
      expect(json['value'], 'Texto de informação');
    });

    test('deve converter MapInformationFieldEntity para JSON', () {
      final field = MapInformationFieldEntity(
        latitude: 123.456,
        longitude: 789.012,
      );

      final json = InformationFieldAdapter.toJson(field);

      expect(json['information_field_type'], 'MAP_INFORMATION_FIELD');
      expect(json['latitude'], 123.456);
      expect(json['longitude'], 789.012);
    });

    test('deve converter ImageInformationFieldEntity para JSON', () {
      final field = ImageInformationFieldEntity(
        filePath: 'caminho/para/imagem.png',
      );

      final json = InformationFieldAdapter.toJson(field);

      expect(json['information_field_type'], 'IMAGE_INFORMATION_FIELD');
      expect(json['file_path'], 'caminho/para/imagem.png');
    });

    test('deve converter lista de JSON para lista de InformationFieldEntity',
        () {
      final jsonList = [
        {
          'information_field_type': 'TEXT_INFORMATION_FIELD',
          'value': 'Texto de informação',
        },
        {
          'information_field_type': 'MAP_INFORMATION_FIELD',
          'latitude': 123.456,
          'longitude': 789.012,
        },
        {
          'information_field_type': 'IMAGE_INFORMATION_FIELD',
          'file_path': 'caminho/para/imagem.png',
        },
      ];

      final fields = InformationFieldAdapter.fromJsonList(jsonList);

      expect(fields.length, 3);
      expect(fields[0], isA<TextInformationFieldEntity>());
      expect(fields[1], isA<MapInformationFieldEntity>());
      expect(fields[2], isA<ImageInformationFieldEntity>());
    });
  });
}
