import 'package:flutter/material.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class DialogTextField extends StatelessWidget with ValidationMixin {
  final String label;
  final bool isEnabled;
  final CancelFormController controller;
  const DialogTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingSmall),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.fontMedium),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingLarge,
                  vertical: AppDimensions.paddingMedium),
              child: TextFormField(
                onChanged: (value) =>
                    controller.setJustificationText(value),
                enabled: isEnabled,
                decoration: const InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.only(bottom: 8),
                  hintText: 'Insira o texto',
                ),
                maxLines: null,
                validator: (value) {
                  return combine(
                    [
                      () => isRequired(
                            value,
                            true,
                            true,
                          ),
                    ],
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
