import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

//regex, formatting
class CustomRadioGroupFormField extends StatelessWidget {
  final RadioGroupFieldEntity field;
  final RadioGroupController controller;

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
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ...field.options.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: controller.value,
                onChanged: (value) {
                  state.didChange(value);
                  controller.value = value;
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
