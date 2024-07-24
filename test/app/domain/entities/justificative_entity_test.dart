import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';

void main() {
  group('justificationOptionEntity', () {
    test('should create a valid justificationOptionEntity instance', () {
      final option = JustificationOptionEntity(
        option: 'Option 1',
        requiredImage: true,
        requiredText: false,
      );

      expect(option.option, 'Option 1');
      expect(option.requiredImage, true);
      expect(option.requiredText, false);
    });
  });

  group('justificationEntity', () {
    test('should create a valid justificationEntity instance with all fields',
        () {
      final option1 = JustificationOptionEntity(
        option: 'Option 1',
        requiredImage: true,
        requiredText: false,
      );

      final justification = JustificationEntity(
        options: [option1],
        selectedOption: 'Option 1',
        justificationText: 'Sample text',
        justificationImage: 'image/path',
      );

      expect(justification.options.length, 1);
      expect(justification.options[0].option, 'Option 1');
      expect(justification.selectedOption, 'Option 1');
      expect(justification.justificationText, 'Sample text');
      expect(justification.justificationImage, 'image/path');
    });

    test('should create a valid justificationEntity instance with null fields',
        () {
      final option1 = JustificationOptionEntity(
        option: 'Option 1',
        requiredImage: true,
        requiredText: false,
      );

      final justification = JustificationEntity(
        options: [option1],
        selectedOption: null,
        justificationText: null,
        justificationImage: null,
      );

      expect(justification.options.length, 1);
      expect(justification.options[0].option, 'Option 1');
      expect(justification.selectedOption, null);
      expect(justification.justificationText, null);
      expect(justification.justificationImage, null);
    });
  });
}
