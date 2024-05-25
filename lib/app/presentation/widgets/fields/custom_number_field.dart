import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomNumberFormField extends StatelessWidget {
  final NumberFieldEntity field;
  final FormSectionController controller;

  const CustomNumberFormField({
    super.key,
    required this.field,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: field.placeholder,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium)),
        floatingLabelStyle: Theme.of(context).textTheme.headlineLarge,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: AppDimensions.borderThin,
              style: BorderStyle.solid),
        ),
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: field.decimal),
      onChanged: (value) {
        controller.setFieldValue(field.key, value);
      },
      onSaved: (value) {
        controller.setFieldValue(field.key, value);
      },
      validator: (value) {
        if (field.isRequired && (value == null || value.isEmpty)) {
          return 'Este campo é obrigatório';
        }
        final numValue = num.tryParse(value ?? '');
        if (numValue == null) {
          return 'Número inválido';
        }
        if (field.minValue != null && numValue < field.minValue!) {
          return 'Valor mínimo é ${field.minValue}';
        }
        if (field.maxValue != null && numValue > field.maxValue!) {
          return 'Valor máximo é ${field.maxValue}';
        }
        return null;
      },
    );
  }
}
