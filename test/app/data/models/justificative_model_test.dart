import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/justificative_model.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';

void main() {
  group('JustificativeOptionModel', () {
    test('fromMap', () {
      var map = {
        'option': 'option',
        'requiredImage': true,
        'requiredText': true,
      };

      var model = JustificativeOptionModel.fromMap(map);

      expect(model.option, map['option']);
      expect(model.requiredImage, map['requiredImage']);
      expect(model.requiredText, map['requiredText']);
    });

    test('fromEntity', () {
      var entity = JustificativeOptionEntity(
        option: 'option',
        requiredImage: true,
        requiredText: true,
      );

      var model = JustificativeOptionModel.fromEntity(entity);

      expect(model.option, entity.option);
      expect(model.requiredImage, entity.requiredImage);
      expect(model.requiredText, entity.requiredText);
    });

    test('toMap', () {
      var model = JustificativeOptionModel(
        option: 'option',
        requiredImage: true,
        requiredText: true,
      );

      var map = model.toMap();

      expect(map['option'], model.option);
      expect(map['requiredImage'], model.requiredImage);
      expect(map['requiredText'], model.requiredText);
    });
  });

  group('JustificativeModel', () {
    test('fromMap', () {
      var map = {
        'options': [
          {
            'option': 'option',
            'requiredImage': true,
            'requiredText': true,
          }
        ],
        'selectedOption': 'selectedOption',
        'text': 'text',
        'image': 'image',
      };

      var model = JustificativeModel.fromMap(map);

      expect(model.options.length, 1);
      expect(model.selectedOption, map['selectedOption']);
      expect(model.justificationText, map['justification_text']);
      expect(model.justificationImage, map['justification_image']);
    });

    test('fromEntity', () {
      var entity = JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          )
        ],
        selectedOption: 'selectedOption',
        justificationText: 'text',
        justificationImage: 'image',
      );

      var model = JustificativeModel.fromEntity(entity);

      expect(model.options.length, entity.options.length);
      expect(model.selectedOption, entity.selectedOption);
      expect(model.justificationText, entity.justificationText);
      expect(model.justificationImage, entity.justificationImage);
    });

    test('toMap', () {
      var model = JustificativeModel(
        options: [
          JustificativeOptionModel(
            option: 'option',
            requiredImage: true,
            requiredText: true,
          )
        ],
        selectedOption: 'selectedOption',
        justificationText: 'text',
        justificationImage: 'image',
      );

      var map = model.toMap();

      expect(map['options'].length, model.options.length);
      expect(map['selectedOption'], model.selectedOption);
      expect(map['justification_text'], model.justificationText);
      expect(map['justification_image'], model.justificationImage);
    });
  });
}
