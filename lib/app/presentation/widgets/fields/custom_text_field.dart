import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomTextFormField extends StatelessWidget {
  final TextFieldEntity field;
  final FormSectionController controller;

  const CustomTextFormField({
    super.key,
    required this.field,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: field.placeholder,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        floatingLabelStyle: Theme.of(context).textTheme.headlineLarge,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: AppDimensions.borderThin,
              style: BorderStyle.solid),
        ),
      ),
      maxLength: field.maxLength,
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
        if (field.regex != null &&
            !RegExp(field.regex!).hasMatch(value ?? '')) {
          return 'Formato inválido';
        }
        return null;
      },
    );
  }
}
