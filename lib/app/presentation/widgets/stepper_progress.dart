import 'package:flutter/material.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class StepperProgress extends StatelessWidget {
  final int totalSteps;
  final List<bool> isStepDone;
  final Function(int) onStepTapped;

  const StepperProgress({
    super.key,
    required this.totalSteps,
    required this.isStepDone,
    required this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stepper(
        type: StepperType.horizontal,
        elevation: 5,
        physics: const BouncingScrollPhysics(),
        stepIconWidth: 32,
        stepIconHeight: 32,
        connectorThickness: 2,
        connectorColor:
            WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
        currentStep: isStepDone.indexOf(false),
        steps: _buildSteps(context),
        onStepTapped: (step) {
          onStepTapped(step);
        },
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
        isActive: index <= isStepDone.indexOf(false),
        state: isStepDone[index] ? StepState.complete : StepState.indexed,
        content: Container(),
      );
    });
  }
}
