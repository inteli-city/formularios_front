import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/information_field_model.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';

void main() {
  group('TextInformationFieldModel Tests', () {
    final textInformationFieldMap = {
      'information_field_type': 'TEXT_INFORMATION_FIELD',
      'value': 'Sample text',
    };

    test('should create TextInformationFieldModel from map', () {
      final model = TextInformationFieldModel.fromMap(textInformationFieldMap);

      expect(model.value, 'Sample text');
    });

    test('should convert TextInformationFieldModel to map', () {
      final model = TextInformationFieldModel.fromMap(textInformationFieldMap);
      final map = model.toMap();

      expect(map, textInformationFieldMap);
    });

    test('should create TextInformationFieldModel from entity', () {
      final entity = TextInformationFieldEntity(
        value: 'Sample text',
      );

      final model = TextInformationFieldModel.fromEntity(entity);

      expect(model.value, 'Sample text');
    });
  });

  group('MapInformationFieldModel Tests', () {
    final mapInformationFieldMap = {
      'information_field_type': 'MAP_INFORMATION_FIELD',
      'latitude': 12.34,
      'longitude': 56.78,
    };

    test('should create MapInformationFieldModel from map', () {
      final model = MapInformationFieldModel.fromMap(mapInformationFieldMap);

      expect(model.latitude, 12.34);
      expect(model.longitude, 56.78);
    });

    test('should convert MapInformationFieldModel to map', () {
      final model = MapInformationFieldModel.fromMap(mapInformationFieldMap);
      final map = model.toMap();

      expect(map, mapInformationFieldMap);
    });

    test('should create MapInformationFieldModel from entity', () {
      final entity = MapInformationFieldEntity(
        latitude: 12.34,
        longitude: 56.78,
      );

      final model = MapInformationFieldModel.fromEntity(entity);

      expect(model.latitude, 12.34);
      expect(model.longitude, 56.78);
    });
  });

  group('ImageInformationFieldModel Tests', () {
    final imageInformationFieldMap = {
      'information_field_type': 'IMAGE_INFORMATION_FIELD',
      'file_path': '/path/to/image.png',
    };

    test('should create ImageInformationFieldModel from map', () {
      final model =
          ImageInformationFieldModel.fromMap(imageInformationFieldMap);

      expect(model.filePath, '/path/to/image.png');
    });

    test('should convert ImageInformationFieldModel to map', () {
      final model =
          ImageInformationFieldModel.fromMap(imageInformationFieldMap);
      final map = model.toMap();

      expect(map, imageInformationFieldMap);
    });

    test('should create ImageInformationFieldModel from entity', () {
      final entity = ImageInformationFieldEntity(
        filePath: '/path/to/image.png',
      );

      final model = ImageInformationFieldModel.fromEntity(entity);

      expect(model.filePath, '/path/to/image.png');
    });
  });

  group('InformationFieldModel Tests', () {
    final textInformationFieldMap = {
      'information_field_type': 'TEXT_INFORMATION_FIELD',
      'value': 'Sample text',
    };

    final mapInformationFieldMap = {
      'information_field_type': 'MAP_INFORMATION_FIELD',
      'latitude': 12.34,
      'longitude': 56.78,
    };

    final imageInformationFieldMap = {
      'information_field_type': 'IMAGE_INFORMATION_FIELD',
      'file_path': '/path/to/image.png',
    };

    test('should create appropriate InformationFieldModel from map', () {
      final textModel = InformationFieldModel.fromMap(textInformationFieldMap);
      final mapModel = InformationFieldModel.fromMap(mapInformationFieldMap);
      final imageModel =
          InformationFieldModel.fromMap(imageInformationFieldMap);

      expect(textModel, isA<TextInformationFieldModel>());
      expect(mapModel, isA<MapInformationFieldModel>());
      expect(imageModel, isA<ImageInformationFieldModel>());
    });

    test('should create appropriate InformationFieldModel from entity', () {
      final textEntity = TextInformationFieldEntity(
        value: 'Sample text',
      );

      final mapEntity = MapInformationFieldEntity(
        latitude: 12.34,
        longitude: 56.78,
      );

      final imageEntity = ImageInformationFieldEntity(
        filePath: '/path/to/image.png',
      );

      final textModel = InformationFieldModel.fromEntity(textEntity);
      final mapModel = InformationFieldModel.fromEntity(mapEntity);
      final imageModel = InformationFieldModel.fromEntity(imageEntity);

      expect(textModel, isA<TextInformationFieldModel>());
      expect(mapModel, isA<MapInformationFieldModel>());
      expect(imageModel, isA<ImageInformationFieldModel>());
    });
  });
}
