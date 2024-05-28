import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';

class CustomCheckBoxFormField extends StatelessWidget {
  final CheckBoxFieldEntity field;
  final FormSectionController controller;

  const CustomCheckBoxFormField({
    super.key,
    required this.field,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      onSaved: (newValue) {
        controller.setFieldValue(
          field.key,
          newValue.toString(),
        );
      },
      builder: (state) {
        return CheckboxListTile(
          title: Text(field.placeholder),
          value: field.value,
          onChanged: (newValue) {
            controller.setFieldValue(
              field.key,
              newValue.toString(),
            );
          },
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
