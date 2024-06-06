import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/information_field_model.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';

void main() {
  group('InformationFieldModel generator', () {
    test('fromEntity', () {
      var entity = TextInformationFieldEntity(value: 'value');

      var model = InformationFieldModel.fromEntity(entity);

      expect(model, isA<TextInformationFieldModel>());

      TextInformationFieldModel textModel = model as TextInformationFieldModel;
      expect(textModel.value, 'value');
    });

    test('fromMap', () {
      var map = {
        'fieldType': 'TEXT_INFORMATION_FIELD',
        'value': 'value',
      };

      var model = InformationFieldModel.fromMap(map);

      expect(model, isA<TextInformationFieldModel>());

      TextInformationFieldModel textModel = model as TextInformationFieldModel;
      expect(textModel.value, 'value');
    });

    test('fromMaps', () {
      var maps = [
        {
          'fieldType': 'TEXT_INFORMATION_FIELD',
          'value': 'value',
        },
        {
          'fieldType': 'MAP_INFORMATION_FIELD',
          'latitude': 1.0,
          'longitude': 2.0,
        },
        {
          'fieldType': 'IMAGE_INFORMATION_FIELD',
          'filePath': 'file_path',
        },
      ];

      var models = InformationFieldModel.fromMaps(maps);

      expect(models.length, 3);

      expect(models[0], isA<TextInformationFieldModel>());
      TextInformationFieldModel textModel =
          models[0] as TextInformationFieldModel;
      expect(textModel.value, 'value');

      expect(models[1], isA<MapInformationFieldModel>());
      MapInformationFieldModel mapModel = models[1] as MapInformationFieldModel;
      expect(mapModel.latitude, 1.0);
      expect(mapModel.longitude, 2.0);

      expect(models[2], isA<ImageInformationFieldModel>());
      ImageInformationFieldModel imageModel =
          models[2] as ImageInformationFieldModel;
      expect(imageModel.filePath, 'file_path');
    });

    test('toMap', () {
      var entity = TextInformationFieldEntity(value: 'value');

      var model = InformationFieldModel.fromEntity(entity);

      var map = model.toMap();

      expect(map['fieldType'], 'TEXT_INFORMATION_FIELD');
      expect(map['value'], 'value');
    });
  });

  group('MapInformationFieldModel', () {
    test('fromEntity', () {
      var entity = MapInformationFieldEntity(latitude: 1.0, longitude: 2.0);

      var model = MapInformationFieldModel.fromEntity(entity);

      expect(model.latitude, 1.0);
      expect(model.longitude, 2.0);
    });

    test('fromMap', () {
      var map = {
        'fieldType': 'MAP_INFORMATION_FIELD',
        'latitude': 1.0,
        'longitude': 2.0,
      };

      var model = MapInformationFieldModel.fromMap(map);

      expect(model.latitude, 1.0);
      expect(model.longitude, 2.0);
    });

    test('toMap', () {
      var entity = MapInformationFieldEntity(latitude: 1.0, longitude: 2.0);

      var model = MapInformationFieldModel.fromEntity(entity);

      var map = model.toMap();

      expect(map['fieldType'], 'MAP_INFORMATION_FIELD');
      expect(map['latitude'], 1.0);
      expect(map['longitude'], 2.0);
    });
  });

  group('ImageInformationFieldModel', () {
    test('fromEntity', () {
      var entity = ImageInformationFieldEntity(filePath: 'file_path');

      var model = ImageInformationFieldModel.fromEntity(entity);

      expect(model.filePath, 'file_path');
    });

    test('fromMap', () {
      var map = {
        'fieldType': 'IMAGE_INFORMATION_FIELD',
        'filePath': 'file_path',
      };

      var model = ImageInformationFieldModel.fromMap(map);

      expect(model.filePath, 'file_path');
    });

    test('toMap', () {
      var entity = ImageInformationFieldEntity(filePath: 'file_path');

      var model = ImageInformationFieldModel.fromEntity(entity);

      var map = model.toMap();

      expect(map['fieldType'], 'IMAGE_INFORMATION_FIELD');
      expect(map['filePath'], 'file_path');
    });
  });

  group('TextInformationFieldModel', () {
    test('fromEntity', () {
      var entity = TextInformationFieldEntity(value: 'value');

      var model = TextInformationFieldModel.fromEntity(entity);

      expect(model.value, 'value');
    });

    test('fromMap', () {
      var map = {
        'fieldType': 'TEXT_INFORMATION_FIELD',
        'value': 'value',
      };

      var model = TextInformationFieldModel.fromMap(map);

      expect(model.value, 'value');
    });

    test('toMap', () {
      var entity = TextInformationFieldEntity(value: 'value');

      var model = TextInformationFieldModel.fromEntity(entity);

      var map = model.toMap();

      expect(map['fieldType'], 'TEXT_INFORMATION_FIELD');
      expect(map['value'], 'value');
    });
  });
}
