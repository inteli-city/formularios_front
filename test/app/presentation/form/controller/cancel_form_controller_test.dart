import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';

void main() {
  group('CancelFormController', () {
    test('should initialize with empty selectedImages', () {
      final controller = CancelFormController();
      expect(controller.images, isEmpty);
    });

    test('should set and get images', () {
      final controller = CancelFormController();
      final images = ['image1.png', 'image2.png'];

      controller.setImage(images);

      expect(controller.images, equals(images));
    });

    test('should set and get justification', () {
      final controller = CancelFormController();
      const justification = 'This is a justification text';

      controller.setjustification(justification);

      expect(controller.justification, equals(justification));
    });

    test('should set and get option', () {
      final controller = CancelFormController();
      const option = 'Option 1';

      controller.setOption(JustificationOptionEntity(
          option: option, requiredImage: true, requiredText: true));

      expect(controller.option!.option, equals(option));
    });
  });
}
