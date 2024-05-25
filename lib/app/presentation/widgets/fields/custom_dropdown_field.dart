import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';

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
    return DropdownButtonFormField<String>(
      value: field.value,
      decoration: InputDecoration(
        labelText: field.placeholder,
        border: const OutlineInputBorder(),
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
