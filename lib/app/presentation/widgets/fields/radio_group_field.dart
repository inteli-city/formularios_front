import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';

//regex, formatting
class CustomRadioGroupFormField extends StatelessWidget {
  final RadioGroupFieldEntity field;
  final FormSectionController controller;

  const CustomRadioGroupFormField({
    super.key,
    required this.field,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: field.value,
      validator: (value) {
        if (field.isRequired && (value == null || value.isEmpty)) {
          return 'This field is required';
        }
        return null;
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field.placeholder,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ...field.options.map((option) {
              return RadioListTile<String>(
                title:
                    Text(option, style: Theme.of(context).textTheme.bodyLarge),
                value: option,
                groupValue: controller.getFieldValue(field.key),
                onChanged: (value) {
                  state.didChange(value);
                  controller.setFieldValue(field.key, value);
                },
              );
            }),
            if (state.hasError)
              Text(
                state.errorText ?? '',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
          ],
        );
      },
    );
  }
}

class RadioGroupController {
  String? value;

  RadioGroupController({this.value});

  String? get getRadioGroupValue => value;
}
