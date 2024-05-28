import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';

class StepperController {
  int currentStep = 0;
  int currentSectionIndex = 0;
  final ScrollController listViewController = ScrollController();

  void setCurrentSectionIndex(int index) {
    currentSectionIndex = index;
  }
  void stepperScrollToSection(
      {required int index, required BuildContext context}) {
    double screenWidth = ScreenHelper.width(context);
    double targetPosition = index * screenWidth;
    listViewController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
