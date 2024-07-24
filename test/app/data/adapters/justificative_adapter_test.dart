import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/data/adapters/justification_adapter.dart';

void main() {
  group('justificationOptionAdapter', () {
    test('deve converter JSON para justificationOptionEntity', () {
      final json = {
        'option': 'Option 1',
        'required_image': true,
        'required_text': false,
      };

      final option = JustificationOptionAdapter.fromJson(json);

      expect(option.option, 'Option 1');
      expect(option.requiredImage, true);
      expect(option.requiredText, false);
    });

    test('deve converter justificationOptionEntity para JSON', () {
      final option = JustificationOptionEntity(
        option: 'Option 1',
        requiredImage: true,
        requiredText: false,
      );

      final json = JustificationOptionAdapter.toJson(option);

      expect(json['option'], 'Option 1');
      expect(json['required_image'], true);
      expect(json['required_text'], false);
    });

    test('deve converter lista de JSON para lista de justificationOptionEntity',
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

      final options = JustificationOptionAdapter.fromJsonList(jsonList);

      expect(options.length, 2);
      expect(options[0].option, 'Option 1');
      expect(options[1].option, 'Option 2');
    });
  });

  group('JustificationAdapter', () {
    test('deve converter JSON para justificationEntity', () {
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

      final justification = JustificationAdapter.fromJson(json);

      expect(justification.options.length, 1);
      expect(justification.options[0].option, 'Option 1');
      expect(justification.selectedOption, 'Option 1');
      expect(justification.justificationText, 'justification_text');
      expect(justification.justificationImage, 'justification_image');
    });

    test('deve converter justificationEntity para JSON', () {
      final justification = JustificationEntity(
        options: [
          JustificationOptionEntity(
            option: 'Option 1',
            requiredImage: true,
            requiredText: false,
          ),
        ],
        selectedOption: 'Option 1',
        justificationText: 'justification_text',
        justificationImage: 'justification_image',
      );

      final json = JustificationAdapter.toJson(justification);

      expect(json['options'].length, 1);
      expect(json['options'][0]['option'], 'Option 1');
      expect(json['selected_option'], 'Option 1');
      expect(json['justification_text'], 'justification_text');
      expect(json['justification_image'], 'justification_image');
    });

    test('deve converter lista de JSON para lista de justificationEntity', () {
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

      final justifications = JustificationAdapter.fromJsonList(jsonList);

      expect(justifications.length, 2);
      expect(justifications[0].options[0].option, 'Option 1');
      expect(justifications[1].options[0].option, 'Option 2');
    });
  });
}
