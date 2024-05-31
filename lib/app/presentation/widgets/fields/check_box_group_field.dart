import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';

class CustomCheckBoxGroupFormField extends StatelessWidget
    with ValidationMixin {
  final CheckBoxGroupFieldEntity field;
  final Function(String) onChanged;

  CustomCheckBoxGroupFormField({
    super.key,
    required this.field,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    List<String>? selectedOptions = field.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field.placeholder),
        ...field.options.map((option) {
          return CheckboxListTile(
            title: Text(option),
            value: selectedOptions?.contains(option),
            onChanged: (newValue) {
              if (newValue == true) {
                selectedOptions?.add(option);
              } else {
                selectedOptions?.remove(option);
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          );
        }),
      ],
    );
  }
}
