import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomDropDownFormField extends StatelessWidget with ValidationMixin {
  final DropDownFieldEntity field;
  final Function(String?) onChanged;
  final FormController formController;
  CustomDropDownFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.formController,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      alignment: Alignment.centerLeft,
      isDense: true,
      isExpanded: true,
      hint: Text(
        field.placeholder,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      value: field.value,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
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
      items: field.options.map((option) {
        return DropdownMenuItem(
          value: option,
          child: Text(
            option,
          ),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        return combine([
          () => isRequired(
              value, field.isRequired, formController.getIsSendingForm()),
          () => regex(value, field.regex),
        ]);
      },
    );
  }
}
