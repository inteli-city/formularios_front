import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';

class CustomCheckBoxFormField extends StatelessWidget with ValidationMixin {
  final CheckBoxFieldEntity field;
  final Function(bool?) onChanged;

  CustomCheckBoxFormField({
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
          value: field.value ?? false,
          onChanged: onChanged,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
