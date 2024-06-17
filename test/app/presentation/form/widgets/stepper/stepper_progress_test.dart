import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:mockito/annotations.dart';
import 'package:formularios_front/app/presentation/form/controllers/stepper_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/stepper/stepper_progress.dart';
import 'package:mockito/mockito.dart';

import 'stepper_progress_test.mocks.dart';

@GenerateMocks([StepperController])
void main() {

  testWidgets('StepperProgress Display', (WidgetTester tester) async {
    final mockStepperController = MockStepperController();
    when(mockStepperController.currentSectionIndex).thenReturn(0);

    Modular.bindModule(AppModule());
    Modular.bindModule(HomeModule());

    Modular.replaceInstance<StepperController>(mockStepperController);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StepperProgress(totalSteps: 3),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(Stepper), findsOneWidget);
  });
}
