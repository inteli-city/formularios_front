import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomDropDownFormField extends StatelessWidget {
  final DropDownFieldEntity field;
  final FormSectionController controller;

  const CustomDropDownFormField({
    super.key,
    required this.field,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: field.value,
      isExpanded: true,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        labelText: field.placeholder,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryBlue,
            width: AppDimensions.borderMedium,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryBlue,
            width: AppDimensions.borderMedium,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
      ),
      items: field.options.map((option) {
        return DropdownMenuItem(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: (newValue) {
        controller.setFieldValue(field.key, newValue);
      },
      onSaved: (newValue) {
        controller.setFieldValue(field.key, newValue);
      },
      validator: (value) {
        if (field.isRequired && (value == null || value.isEmpty)) {
          return 'Este campo é obrigatório';
        }
        return null;
      },
    );
  }
}
