import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';

class CustomNumberFormField extends StatelessWidget with ValidationMixin {
  final NumberFieldEntity field;
  final Function(String) onChanged;
  final SingleFormProvider singleFormProvider;

  CustomNumberFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.singleFormProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        TextFormField(
          initialValue: field.value == null ? '' : field.value.toString(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: 'Insira o valor',
            isDense: true,
        isCollapsed: true,
            contentPadding: const EdgeInsets.only(bottom: 8),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 1)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 1)),
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
            return combine(
              [
                () => isRequired(
                      value,
                      field.isRequired,
                      singleFormProvider.isSendingForm,
                    ),
                () => maxValue(value, field.maxValue),
                () => minValue(value, field.minValue),
              ],
            );
          },
        ),
      ],
    );
  }
}
