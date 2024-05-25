import 'package:flutter/material.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:intl/intl.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

class CustomDateFormField extends StatelessWidget {
  final DateFieldEntity field;
  final FormSectionController controller;

  const CustomDateFormField({
    super.key,
    required this.field,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: field.placeholder,
        border: const OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate:
              field.value != null ? field.value?.toLocal() : DateTime.now(),
          firstDate: field.minDate ?? DateTime(1900),
          lastDate: field.maxDate ?? DateTime(2100),
          locale: const Locale('pt', 'BR'),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          controller.setFieldValue(field.key, formattedDate);
        }
      },
      onSaved: (value) {
        controller.setFieldValue(field.key, value);
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
