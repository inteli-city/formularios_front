import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';

class CustomTextFormField extends StatelessWidget with ValidationMixin {
  final TextFieldEntity field;
  final Function(String) onChanged;

  CustomTextFormField({
    super.key,
    required this.field,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final formController = Modular.get<FormController>();
    return TextFormField(
      initialValue: field.value,
      decoration: InputDecoration(
        labelText: field.placeholder,
      ),
      maxLength: field.maxLength,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return combine([
          () => isRequired(
              value, field.isRequired, formController.getIsSendingForm()),
          () => maxLength(value, field.maxLength),
          () => regex(value, field.regex),
        ]);
      },
    );
  }
}
