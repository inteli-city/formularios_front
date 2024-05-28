import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/controllers/form_details_controller.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/presentation/controllers/stepper_controller.dart';
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
  StepperController stepperController = Modular.get<StepperController>();
  late FormController formController;
  late List<SectionEntity> formSections;
  final List<GlobalKey<FormState>> _formKeys = [];

  @override
  void initState() {
    super.initState();
    formSections = formDetailsController.form.sections;
    _formKeys.addAll(
        List.generate(formSections.length, (_) => GlobalKey<FormState>()));
    formController = FormController(
      sections: formSections,
      sectionControllers: List.generate(
        formSections.length,
        (_) => FormSectionController(),
      ),
    );
  }

  void nextSection({required int index}) {
    if (index < formDetailsController.form.sections.length - 1) {
      stepperController.setCurrentSectionIndex(index++);
      stepperController.stepperScrollToSection(index: index, context: context);
    }
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
                          Modular.to.pop();
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
                  totalSteps: formSections.length,
                  isStepDone: formController.areSectionsSaved,
                  onStepTapped: (index) {
                    stepperController.stepperScrollToSection(
                        index: index, context: context);
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: stepperController.listViewController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formSections.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: ScreenHelper.width(context),
                    child: SectionForm(
                      formKey: _formKeys[index],
                      section: formSections[index],
                      sectionController:
                          formController.sectionControllers[index],
                      lastSection: index == formSections.length - 1,
                      formController: formController,
                      onSaveSubmit: () {
                        nextSection(index: index);
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
