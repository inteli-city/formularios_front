import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';

void main() {
  group('JustificativeOptionEntity', () {
    test('should create a valid JustificativeOptionEntity instance', () {
      final option = JustificativeOptionEntity(
        option: 'Option 1',
        requiredImage: true,
        requiredText: false,
      );

      expect(option.option, 'Option 1');
      expect(option.requiredImage, true);
      expect(option.requiredText, false);
    });
  });

  group('JustificativeEntity', () {
    test('should create a valid JustificativeEntity instance with all fields',
        () {
      final option1 = JustificativeOptionEntity(
        option: 'Option 1',
        requiredImage: true,
        requiredText: false,
      );

      final justificative = JustificativeEntity(
        options: [option1],
        selectedOption: 'Option 1',
        justificationText: 'Sample text',
        justificationImage: 'image/path',
      );

      expect(justificative.options.length, 1);
      expect(justificative.options[0].option, 'Option 1');
      expect(justificative.selectedOption, 'Option 1');
      expect(justificative.justificationText, 'Sample text');
      expect(justificative.justificationImage, 'image/path');
    });

    test('should create a valid JustificativeEntity instance with null fields',
        () {
      final option1 = JustificativeOptionEntity(
        option: 'Option 1',
        requiredImage: true,
        requiredText: false,
      );

      final justificative = JustificativeEntity(
        options: [option1],
        selectedOption: null,
        justificationText: null,
        justificationImage: null,
      );

      expect(justificative.options.length, 1);
      expect(justificative.options[0].option, 'Option 1');
      expect(justificative.selectedOption, null);
      expect(justificative.justificationText, null);
      expect(justificative.justificationImage, null);
    });
  });
}
