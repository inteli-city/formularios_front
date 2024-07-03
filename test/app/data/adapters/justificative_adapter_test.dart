import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/data/adapters/justificative_adapter.dart';

void main() {
  group('JustificativeOptionAdapter', () {
    test('deve converter JSON para JustificativeOptionEntity', () {
      final json = {
        'option': 'Option 1',
        'required_image': true,
        'required_text': false,
      };

      final option = JustificativeOptionAdapter.fromJson(json);

      expect(option.option, 'Option 1');
      expect(option.requiredImage, true);
      expect(option.requiredText, false);
    });

    test('deve converter JustificativeOptionEntity para JSON', () {
      final option = JustificativeOptionEntity(
        option: 'Option 1',
        requiredImage: true,
        requiredText: false,
      );

      final json = JustificativeOptionAdapter.toJson(option);

      expect(json['option'], 'Option 1');
      expect(json['required_image'], true);
      expect(json['required_text'], false);
    });

    test('deve converter lista de JSON para lista de JustificativeOptionEntity',
        () {
      final jsonList = [
        {
          'option': 'Option 1',
          'required_image': true,
          'required_text': false,
        },
        {
          'option': 'Option 2',
          'required_image': false,
          'required_text': true,
        },
      ];

      final options = JustificativeOptionAdapter.fromJsonList(jsonList);

      expect(options.length, 2);
      expect(options[0].option, 'Option 1');
      expect(options[1].option, 'Option 2');
    });
  });

  group('JustificativeAdapter', () {
    test('deve converter JSON para JustificativeEntity', () {
      final json = {
        'options': [
          {
            'option': 'Option 1',
            'required_image': true,
            'required_text': false,
          },
        ],
        'selected_option': 'Option 1',
        'justification_text': 'justification_text',
        'justification_image': 'justification_image',
      };

      final justificative = JustificativeAdapter.fromJson(json);

      expect(justificative.options.length, 1);
      expect(justificative.options[0].option, 'Option 1');
      expect(justificative.selectedOption, 'Option 1');
      expect(justificative.justificationText, 'justification_text');
      expect(justificative.justificationImage, 'justification_image');
    });

    test('deve converter JustificativeEntity para JSON', () {
      final justificative = JustificativeEntity(
        options: [
          JustificativeOptionEntity(
            option: 'Option 1',
            requiredImage: true,
            requiredText: false,
          ),
        ],
        selectedOption: 'Option 1',
        justificationText: 'justification_text',
        justificationImage: 'justification_image',
      );

      final json = JustificativeAdapter.toJson(justificative);

      expect(json['options'].length, 1);
      expect(json['options'][0]['option'], 'Option 1');
      expect(json['selected_option'], 'Option 1');
      expect(json['justification_text'], 'justification_text');
      expect(json['justification_image'], 'justification_image');
    });

    test('deve converter lista de JSON para lista de JustificativeEntity', () {
      final jsonList = [
        {
          'options': [
            {
              'option': 'Option 1',
              'required_image': true,
              'required_text': false,
            },
          ],
          'selected_option': 'Option 1',
          'justification_text': 'justification_text',
          'justification_image': 'justification_image',
        },
        {
          'options': [
            {
              'option': 'Option 2',
              'required_image': false,
              'required_text': true,
            },
          ],
          'selected_option': 'Option 2',
          'justification_text': 'justification_text 2',
          'justification_image': 'justification_image',
        },
      ];

      final justificatives = JustificativeAdapter.fromJsonList(jsonList);

      expect(justificatives.length, 2);
      expect(justificatives[0].options[0].option, 'Option 1');
      expect(justificatives[1].options[0].option, 'Option 2');
    });
  });
}
