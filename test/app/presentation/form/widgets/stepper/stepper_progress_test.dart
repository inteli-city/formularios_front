import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
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
          body: StepperProgress(
            totalSteps: 3,
            pageController: pageController,
            sections: [
              SectionEntity(
                sectionId: 'sectionId',
                fields: [
                  TextFieldEntity(
                    placeholder: ' placeholder',
                    key: 'key',
                    isRequired: true,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(StepperComponent), findsWidgets);
  });
}
