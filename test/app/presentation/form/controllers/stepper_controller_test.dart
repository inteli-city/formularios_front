import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/form/controllers/stepper_controller.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([StepperController])
void main() {
  StepperController controller = StepperController();
  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());
  Modular.replaceInstance<StepperController>(controller);

  group('Stepper Controller Test', () {
    test('setCurrentSectionIndex should update currentSectionIndex', () {
      controller.setCurrentSectionIndex(1);
      expect(controller.currentSectionIndex, 1);
    });

    test('getCurrentSectionIndex should return currentSectionIndex', () {
      controller.currentSectionIndex = 1;
      expect(controller.currentSectionIndex, 1);
    });

    test('stepper controller should scroll to section', () {
      
      controller.stepperScrollToSection(index: 1, context: Modular.get());
      expect(controller.currentSectionIndex, 1);
    });
  });
}
