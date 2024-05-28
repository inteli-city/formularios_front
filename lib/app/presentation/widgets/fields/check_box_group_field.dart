import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';

class CustomCheckBoxGroupFormField extends StatelessWidget {
  final CheckBoxGroupFieldEntity field;
  final FormSectionController controller;

  const CustomCheckBoxGroupFormField({
    super.key,
    required this.field,
    required this.controller,
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
              controller.setFieldValue(
                field.key,
                selectedOptions?.join(','),
              );
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          );
        }),
      ],
    );
  }
}
