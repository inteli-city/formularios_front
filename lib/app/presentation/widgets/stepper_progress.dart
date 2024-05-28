import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/controllers/stepper_controller.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class StepperProgress extends StatelessWidget {
  final int totalSteps;

  const StepperProgress({
    super.key,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    StepperController controller = Modular.get();
    return SizedBox(
      height: 70,
      child: Stepper(
        type: StepperType.horizontal,
        elevation: 5,
        physics: const BouncingScrollPhysics(),
        stepIconWidth: 32,
        stepIconHeight: 32,
        connectorThickness: 2,
        connectorColor:
            WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
        currentStep: controller.currentStep,
        steps: _buildSteps(context),
        onStepTapped: controller.setCurrentSectionIndex,
      ),
    );
  }

  List<Step> _buildSteps(BuildContext context) {
    return List.generate(totalSteps, (index) {
      return Step(
        title: const Text(''),
        stepStyle: StepStyle(
          color: AppColors.primaryBlue,
        ),
        isActive: true,
        state: StepState.indexed,
        content: Container(),
      );
    });
  }
}
