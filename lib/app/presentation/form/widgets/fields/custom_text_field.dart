import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';

class CustomTextFormField extends StatelessWidget with ValidationMixin {
  final TextFieldEntity field;
  final SingleFormProvider singleFormProvider;
  final Function(String) onChanged;

  CustomTextFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.singleFormProvider,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: field.value,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text('*',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.red, fontWeight: FontWeight.bold)),
          hintText: field.placeholder,
          alignLabelWithHint: true),
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return combine(
          [
            () => isRequired(
                  value,
                  field.isRequired,
                  singleFormProvider.isSendingForm,
                ),
            () => maxLength(value, field.maxLength),
            () => regex(value, field.regex),
          ],
        );
      },
    );
  }
}
