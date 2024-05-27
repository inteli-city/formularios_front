import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/controllers/form_details_controller.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/presentation/widgets/section_form.dart';
import 'package:formularios_front/app/presentation/widgets/stepper_progress.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class FormSectionsPage extends StatefulWidget {
  const FormSectionsPage({super.key});

  @override
  State<FormSectionsPage> createState() => FormSectionsPageState();
}

class FormSectionsPageState extends State<FormSectionsPage> {
  FormDetailsController formDetailsController =
      Modular.get<FormDetailsController>();
  late FormController formController;
  final ScrollController listViewController = ScrollController();
  final List<GlobalKey<FormState>> _formKeys = [];
  int currentSectionIndex = 0;

  @override
  void initState() {
    super.initState();
    _formKeys.addAll(List.generate(formDetailsController.form.sections.length,
        (_) => GlobalKey<FormState>()));
    formController = FormController(
      sections: formDetailsController.form.sections,
      sectionControllers: List.generate(
        formDetailsController.form.sections.length,
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
    if (index < formDetailsController.form.sections.length - 1) {
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
      sectionId: formDetailsController.form.sections[index].sectionId,
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
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Modular.navigatorDelegate!.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: AppDimensions.iconLarge,
                        )),
                    const SizedBox(
                      width: AppDimensions.horizontalSpaceLarge,
                    ),
                    Text(
                      '${formDetailsController.form.template} - ${formDetailsController.form.formTitle}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                StepperProgress(
                  totalSteps: formDetailsController.form.sections.length,
                  isStepDone: formController.areSectionsSaved,
                  onStepTapped: (index) {
                    stepperScrollToSection(index);
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: listViewController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formDetailsController.form.sections.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: ScreenHelper.width(context),
                    child: SectionForm(
                      formKey: _formKeys[index],
                      section: formDetailsController.form.sections[index],
                      sectionController:
                          formController.sectionControllers[index],
                      lastSection: index ==
                          formDetailsController.form.sections.length - 1,
                      formController: formController,
                      onSave: () {
                        if (_formKeys[index].currentState!.validate()) {
                          validateAndSaveSection(
                            index: index,
                            isLastSection: index ==
                                formDetailsController.form.sections.length - 1,
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
