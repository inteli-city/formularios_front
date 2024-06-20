import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';

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
            return combine(
              [
                () => isRequired(
                      value,
                      field.isRequired,
                      singleFormProvider.isSendingForm,
                    ),
                () => maxValue(value, field.maxValue),
                () => minValue(value, field.minValue),
                () => regex(value, field.regex),
              ],
            );
          },
        ),
        field.isRequired
            ? Positioned(
                top: 10.0,
                right: 10.0,
                child: Text(
                  '*',
                  style: TextStyle(
                    color: AppColors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
