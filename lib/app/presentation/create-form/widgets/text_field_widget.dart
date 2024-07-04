import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final bool isRequired;
  final bool isEnabled;
  final TextEditingController controller;
  const TextFieldWidget({
    super.key,
    required this.label,
    this.isRequired = true,
    required this.controller,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEnabled,
      validator: (value) {
        if (isRequired && value!.isEmpty) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 0),
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
    );
  }
}
