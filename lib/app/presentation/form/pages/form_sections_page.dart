import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
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
  SingleFormProvider formController = Modular.get<SingleFormProvider>();
  StepperController stepperController = Modular.get<StepperController>();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Fill form',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            StepperProgress(
              totalSteps: formController.form.sections.length,
            ),
            Padding(
              padding: const EdgeInsets.all(
                AppDimensions.paddingMedium,
              ),
              child: Text(
                '${formController.form.system} - ${formController.form.template}',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
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
                        formController: formController,
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
