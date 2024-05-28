import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

class CustomCheckBoxFormField extends StatelessWidget {
  final CheckBoxFieldEntity field;
  final Function(bool?) onChanged;

  const CustomCheckBoxFormField({
    super.key,
    required this.field,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      builder: (state) {
        return CheckboxListTile(
          title: Text(field.placeholder),
          value: field.value,
          onChanged: onChanged,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
