import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';

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
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: field.decimal,
      ),
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
