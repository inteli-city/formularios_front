import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final bool isRequired;
  const TextFieldWidget({
    super.key,
    required this.label,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (isRequired && value!.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
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
