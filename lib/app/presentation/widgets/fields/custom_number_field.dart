import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';

class CustomNumberFormField extends StatelessWidget with ValidationMixin {
  final NumberFieldEntity field;
  final Function(String) onChanged;
  final FormController formController;

  CustomNumberFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.formController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: field.placeholder,
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: field.decimal,
      ),
      inputFormatters: [
        if (field.decimal)
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
        else
          FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: onChanged,
      validator: (value) {
        return combine([
          () => isRequired(
              value, field.isRequired, formController.getIsSendingForm()),
          () => maxValue(value, field.maxValue),
          () => minValue(value, field.minValue),
          () => regex(value, field.regex),
        ]);
      
      },
    );
  }
}
