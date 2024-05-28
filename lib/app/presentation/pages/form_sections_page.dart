import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/controllers/form_details_controller.dart';
import 'package:formularios_front/app/presentation/controllers/stepper_controller.dart';
import 'package:formularios_front/app/presentation/widgets/section_form.dart';
import 'package:formularios_front/app/presentation/widgets/stepper_progress.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class FormSectionsPage extends StatefulWidget {
  const FormSectionsPage({super.key});

  @override
  State<FormSectionsPage> createState() => FormSectionsPageState();
}

class FormSectionsPageState extends State<FormSectionsPage> {
  FormDetailsController formDetailsController =
      Modular.get<FormDetailsController>();
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
                  totalSteps: formController.sections.length,
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
                  itemCount: formController.sections.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: ScreenHelper.width(context),
                      child: SectionForm(
                        section: formController.sections[index],
                        lastSection:
                            index == formController.sections.length - 1,
                        formController: formController,
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formController.saveForm();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                  ),
                  child: Text(
                    'Salvar',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.white,
                        height: 1.2,
                        fontSize: AppDimensions.fontMedium),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formController.validateRequiredFields &&
                        formKey.currentState!.validate()) {
                      formController.sendForm();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                  ),
                  child: Text(
                    'Enviar',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.white,
                        height: 1.2,
                        fontSize: AppDimensions.fontMedium),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
