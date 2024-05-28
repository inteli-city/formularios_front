import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

class CustomTextFormField extends StatelessWidget {
  final TextFieldEntity field;
  final Function(String) onChanged;

  const CustomTextFormField({
    super.key,
    required this.field,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: field.placeholder,
      ),
      maxLength: field.maxLength,
      onChanged: onChanged,
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
