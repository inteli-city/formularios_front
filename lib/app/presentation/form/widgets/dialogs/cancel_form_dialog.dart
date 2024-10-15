import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/dialogs/fields/dialog_file_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/dialogs/fields/dialog_text_field.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';

class CancelFormDialog extends StatefulWidget {
  const CancelFormDialog({super.key});

  @override
  State<CancelFormDialog> createState() => _CancelFormDialogState();
}

class _CancelFormDialogState extends State<CancelFormDialog>
    with ValidationMixin {
  CancelFormController cancelFormController =
      Modular.get<CancelFormController>();
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Dialog(
      insetPadding: const EdgeInsets.all(AppDimensions.paddingSmall),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.fillJustification,
                    style: AppTextStyles.display.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(
                height: AppDimensions.verticalSpaceExtraLarge,
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingMedium,
                            vertical: AppDimensions.paddingSmall),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DropdownButtonFormField2<JustificationOptionEntity>(
                              value: cancelFormController.selectedOption,
                              isExpanded: true,
                              isDense: true,
                              hint: Text(
                                S.current.selectValue,
                                textAlign: TextAlign.center,
                              ),
                              validator: (value) {
                                return combine(
                                  [
                                    () => isRequired(
                                          value?.option,
                                          true,
                                          true,
                                        ),
                                  ],
                                );
                              },
                              items: context
                                  .read<SingleFormProvider>()
                                  .form
                                  .justification
                                  .options
                                  .map((option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(
                                          option.option,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ))
                                  .toList(),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 8),
                              ),
                              onChanged: (JustificationOptionEntity? option) {
                                cancelFormController.setSelectedOption(option);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    cancelFormController.selectedOption != null
                        ? Container(
                            padding: EdgeInsets.symmetric(
                              vertical: cancelFormController
                                          .selectedOption!.requiredImage &&
                                      cancelFormController
                                          .selectedOption!.requiredText
                                  ? AppDimensions.paddingMedium
                                  : 0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                cancelFormController
                                        .selectedOption!.requiredImage
                                    ? DialogFileField(
                                        cancelFormController:
                                            cancelFormController,
                                        imagePicker: ImagePicker(),
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: AppDimensions.verticalSpaceExtraLarge,
                                ),
                                cancelFormController
                                        .selectedOption!.requiredText
                                    ? DialogTextField(
                                        label:
                                            'Inserir texto de jusitificação',
                                        controller: cancelFormController)
                                    : const SizedBox(),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: AppDimensions.verticalSpaceExtraLarge * 1.5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () async {
                        FormEntity form =
                            context.read<SingleFormProvider>().form;

                        if (formKey.currentState!.validate()) {
                          await Modular.get<FormsProvider>().cancelForm(
                            justification: JustificationEntity(
                              options: form.justification.options,
                              selectedOption:
                                  cancelFormController.selectedOption!.option,
                              justificationText:
                                  cancelFormController.justificationText,
                              justificationImage:
                                  cancelFormController.selectedImage,
                            ),
                            formId: form.formId,
                          );
                          Modular.to.pop();
                          Modular.to.navigate('/home/forms');
                        }
                      },
                      child: Text(
                        S.current.confirm,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.white,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
