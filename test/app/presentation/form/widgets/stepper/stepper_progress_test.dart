import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/presentation/form/widgets/stepper/stepper_component.dart';
import 'package:formularios_front/app/presentation/form/widgets/stepper/stepper_progress.dart';

void main() {
  PageController pageController = PageController();
  testWidgets('StepperProgress Display', (WidgetTester tester) async {

    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StepperProgress(totalSteps: 3, pageController: pageController,),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(StepperComponent), findsWidgets);
  });
}
