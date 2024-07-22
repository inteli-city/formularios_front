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
    return Stack(
      children: [
        TextFormField(
          onChanged: (value) => controller.setJustificative(value),
          enabled: isEnabled,
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
          decoration: InputDecoration(
            labelText: label,
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
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryBlue,
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
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: Text(
            '*',
            style: TextStyle(
              color: AppColors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
