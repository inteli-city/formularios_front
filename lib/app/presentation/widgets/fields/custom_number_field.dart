import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

class CustomNumberFormField extends StatelessWidget {
  final NumberFieldEntity field;
  final Function(String) onChanged;

  const CustomNumberFormField({
    super.key,
    required this.field,
    required this.onChanged,
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
        var numberValue = double.tryParse(value ?? '');
        if (field.minValue != null && numberValue! < field.minValue!) {
          return 'Valor mínimo é ${field.minValue}';
        }
        if (field.maxValue != null && numberValue! > field.maxValue!) {
          return 'Valor máximo é ${field.maxValue}';
        }
        return null;
      },
    );
  }
}
