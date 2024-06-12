import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomDropDownFormField extends StatelessWidget with ValidationMixin {
  final DropDownFieldEntity field;
  final Function(String?) onChanged;
  final SingleFormProvider singleFormProvider;

  CustomDropDownFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.singleFormProvider,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      isDense: true,
      value: field.value,
      decoration: InputDecoration(
        label: Text(
          field.placeholder,
        ),
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
      items: field.options.map(
        (option) {
          return DropdownMenuItem(
            value: option,
            child: Text(
              option,
              textAlign: TextAlign.center,
            ),
          );
        },
      ).toList(),
      onChanged: onChanged,
      validator: (value) {
        return combine(
          [
            () => isRequired(
                  value,
                  field.isRequired,
                  singleFormProvider.isSendingForm,
                ),
            () => regex(value, field.regex),
          ],
        );
      },
    );
  }
}
