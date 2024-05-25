import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/controllers/form_details_controller.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/presentation/widgets/section_form.dart';
import 'package:formularios_front/app/presentation/widgets/stepper_progress.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';

class FormSectionsPage extends StatefulWidget {
  const FormSectionsPage({super.key});

  @override
  State<FormSectionsPage> createState() => FormSectionsPageState();
}

class FormSectionsPageState extends State<FormSectionsPage> {
  FormDetailsController controller = Modular.get<FormDetailsController>();
  final ScrollController listViewController = ScrollController();

  void scrollToSection(int index) {
    double screenWidth = ScreenHelper.width(context);
    double targetPosition = index * screenWidth;
    listViewController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    FormController formController = FormController(
        sections: controller.form.sections,
        sectionControllers: List.filled(
            controller.form.sections.length, FormSectionController()));
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            StepperProgress(
              totalSteps: controller.form.sections.length,
              isStepDone: List.filled(controller.form.sections.length, false),
              onStepTapped: (index) {
                scrollToSection(index);
              },
            ),
            Expanded(
              child: ListView.builder(
                controller: listViewController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.form.sections.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: ScreenHelper.width(context),
                    child: SectionForm(
                      section: controller.form.sections[index],
                      sectionController:
                          formController.sectionControllers[index],
                      lastSection: index == controller.form.sections.length - 1,
                      formController: formController,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
