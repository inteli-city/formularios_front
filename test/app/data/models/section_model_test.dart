import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/models/justificative_model.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
void main() {
  group('JustificativeOptionModel Tests', () {
    final optionMap = {
      'option': 'Option 1',
      'required_image': true,
      'required_text': false,
    };

    test('should create JustificativeOptionModel from map', () {
      final model = JustificativeOptionModel.fromMap(optionMap);

      expect(model.option, 'Option 1');
      expect(model.requiredImage, true);
      expect(model.requiredText, false);
    });

    test('should convert JustificativeOptionModel to map', () {
      final model = JustificativeOptionModel.fromMap(optionMap);
      final map = model.toMap();

      expect(map, optionMap);
    });

    test('should create JustificativeOptionModel from entity', () {
      final entity = JustificativeOptionEntity(
        option: 'Option 1',
        requiredImage: true,
        requiredText: false,
      );

      final model = JustificativeOptionModel.fromEntity(entity);

      expect(model.option, 'Option 1');
      expect(model.requiredImage, true);
      expect(model.requiredText, false);
    });

    test('should convert list of maps to list of JustificativeOptionModel', () {
      final optionsListMap = [optionMap, optionMap];

      final models = JustificativeOptionModel.fromMaps(optionsListMap);

      expect(models.length, 2);
      expect(models[0].option, 'Option 1');
      expect(models[0].requiredImage, true);
      expect(models[0].requiredText, false);
    });
  });

  group('JustificativeModel Tests', () {
    final justificativeMap = {
      'options': [
        {
          'option': 'Option 1',
          'required_image': true,
          'required_text': false,
        },
      ],
      'selected_option': 'Option 1',
      'justification_text': 'Some text',
      'justification_image': '/path/to/image.png',
    };

    test('should create JustificativeModel from map', () {
      final model = JustificativeModel.fromMap(justificativeMap);

      expect(model.options.length, 1);
      expect(model.options[0].option, 'Option 1');
      expect(model.selectedOption, 'Option 1');
      expect(model.justificationText, 'Some text');
      expect(model.justificationImage, '/path/to/image.png');
    });

    test('should convert JustificativeModel to map', () {
      final model = JustificativeModel.fromMap(justificativeMap);
      final map = model.toMap();

      expect(map, justificativeMap);
    });

    test('should create JustificativeModel from entity', () {
      final options = [
        JustificativeOptionEntity(
          option: 'Option 1',
          requiredImage: true,
          requiredText: false,
        ),
      ];

      final entity = JustificativeEntity(
        options: options,
        selectedOption: 'Option 1',
        justificationText: 'Some text',
        justificationImage: '/path/to/image.png',
      );

      final model = JustificativeModel.fromEntity(entity);

      expect(model.options.length, 1);
      expect(model.options[0].option, 'Option 1');
      expect(model.selectedOption, 'Option 1');
      expect(model.justificationText, 'Some text');
      expect(model.justificationImage, '/path/to/image.png');
    });
  });
}
