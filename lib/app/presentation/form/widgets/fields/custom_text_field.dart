import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';

class CustomTextFormField extends StatelessWidget with ValidationMixin {
  final TextFieldEntity field;
  final FormController formController;
  final Function(String) onChanged;

  CustomTextFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.formController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: field.value,
      decoration: InputDecoration(
        labelText: field.placeholder,
      ),
      maxLength: field.maxLength,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return combine(
          [
            () => isRequired(
                value, field.isRequired, formController.getIsSendingForm()),
            () => maxLength(value, field.maxLength),
            () => regex(value, field.regex),
          ],
        );
      },
    );
  }
}
