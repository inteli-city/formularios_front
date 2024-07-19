import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/dialogs/fields/dialog_file_field.dart';
import 'package:formularios_front/app/presentation/form/widgets/dialogs/fields/dialog_text_field.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';
import 'package:formularios_front/generated/l10n.dart';

class CancelFormDialog extends StatefulWidget {
  const CancelFormDialog({super.key});

  @override
  State<CancelFormDialog> createState() => _CancelFormDialogState();
}

class _CancelFormDialogState extends State<CancelFormDialog> {
  CancelFormController cancelFormController =
      Modular.get<CancelFormController>();
  JustificativeOptionEntity? selectedOption;

  @override
  Widget build(BuildContext context) {
    var options = context.read<SingleFormProvider>().form.justificative.options;
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
              Stack(
                children: [
                  Center(
                    child: Text(
                      'Justificativa',
                      style: AppTextStyles.display.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.verticalSpaceMedium),
              Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingSmall),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButtonFormField2<JustificativeOptionEntity>(
                        value: selectedOption,
                        isExpanded: true,
                        isDense: true,
                        items: options
                            .map((option) => DropdownMenuItem(
                                  value: option,
                                  child: Text(
                                    option.option,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ))
                            .toList(),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 0),
                          labelText: 'Selecione uma justificativa',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryBlue,
                              width: AppDimensions.borderMedium,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMedium,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.red,
                              width: AppDimensions.borderMedium,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMedium,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryBlue,
                              width: AppDimensions.borderMedium,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMedium,
                            ),
                          ),
                        ),
                        onChanged: (JustificativeOptionEntity? option) {
                          setState(() {
                            selectedOption = option;
                          });
                        },
                      ),
                      selectedOption != null
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppDimensions.paddingMedium,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  selectedOption!.requiredImage
                                      ? DialogFileField(
                                          cancelFormController:
                                              cancelFormController,
                                        )
                                      : const SizedBox(),
                                  const SizedBox(
                                    height:
                                        AppDimensions.verticalSpaceExtraLarge,
                                  ),
                                  selectedOption!.requiredText
                                      ? DialogTextField(
                                          label: 'Justificativa',
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
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
