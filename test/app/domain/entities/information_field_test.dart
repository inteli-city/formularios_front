import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';

void main() {
  group('Information Fields Tests', () {
    group('Text Information Field Test', () {
      test('should return text information field entity ', () {
        final informationField = TextInformationFieldEntity(value: 'value');
        expect(informationField.value, 'value');
      });
    }); 

    group('Map Information Field Test', () {
      test('should return map information field entity ', () {
        final mapInformationField = MapInformationFieldEntity(latitude: 0,longitude: 0);
        expect(mapInformationField.latitude, 0);
        expect(mapInformationField.longitude, 0);
      });
    });
    group('Image Information Field Test', () {
      test('should return image information field entity ', () {
        final mapInformationField = ImageInformationFieldEntity(filePath: 'filePath');
        expect(mapInformationField.filePath,'filePath' );
      });
    });
  });
}
