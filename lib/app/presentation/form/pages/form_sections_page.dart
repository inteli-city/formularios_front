import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/form/controllers/stepper_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/section/section_form.dart';
import 'package:formularios_front/app/presentation/form/widgets/stepper/stepper_progress.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class FormSectionsPage extends StatefulWidget {
  const FormSectionsPage({super.key});

  @override
  State<FormSectionsPage> createState() => FormSectionsPageState();
}

class FormSectionsPageState extends State<FormSectionsPage> {
  FormController formController = Modular.get<FormController>();
  StepperController stepperController = Modular.get<StepperController>();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
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
                      ),
                    ),
                    const SizedBox(
                      width: AppDimensions.horizontalSpaceLarge,
                    ),
                    Text(
                      '${formController.form.template} - ${formController.form.formTitle}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                StepperProgress(
                  totalSteps: formController.form.sections.length,
                ),
              ],
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: ListView.builder(
                  controller: stepperController.listViewController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: formController.form.sections.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: ScreenHelper.width(context),
                      child: SectionForm(
                        section: formController.form.sections[index],
                        lastSection:
                            index == formController.form.sections.length - 1,
                        formKey: formKey,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
