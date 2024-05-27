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
  late FormController formController;
  final ScrollController listViewController = ScrollController();
  final List<GlobalKey<FormState>> _formKeys = [];
  int currentSectionIndex = 0;

  @override
  void initState() {
    super.initState();
    _formKeys.addAll(List.generate(
        controller.form.sections.length, (_) => GlobalKey<FormState>()));
    formController = FormController(
      sections: controller.form.sections,
      sectionControllers: List.generate(
        controller.form.sections.length,
        (_) => FormSectionController(),
      ),
    );
  }

  void stepperScrollToSection(int index) {
    double screenWidth = ScreenHelper.width(context);
    double targetPosition = index * screenWidth;
    listViewController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextSection({required int index}) {
    if (index < controller.form.sections.length - 1) {
      setState(() {
        currentSectionIndex++;
      });
      stepperScrollToSection(currentSectionIndex);
    }
  }

  void validateAndSaveSection(
      {required int index, required bool isLastSection}) {
    _formKeys[index].currentState!.save();
    formController.saveSectionData(
      sectionId: controller.form.sections[index].sectionId,
      sectionData: formController.sectionControllers[index].fieldValues,
    );
    if (isLastSection) {
      formController.sendForm();
    }

    nextSection(index: index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            StepperProgress(
              totalSteps: controller.form.sections.length,
              isStepDone: formController.areSectionsSaved,
              onStepTapped: (index) {
                stepperScrollToSection(index);
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
                      formKey: _formKeys[index],
                      section: controller.form.sections[index],
                      sectionController:
                          formController.sectionControllers[index],
                      lastSection: index == controller.form.sections.length - 1,
                      formController: formController,
                      onSave: () {
                        if (_formKeys[index].currentState!.validate() ) {
                          validateAndSaveSection(
                            index: index,
                            isLastSection:
                                index == controller.form.sections.length - 1,
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
