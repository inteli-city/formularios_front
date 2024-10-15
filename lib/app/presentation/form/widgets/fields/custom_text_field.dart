import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';

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
      inputFormatters: [LengthLimitingTextInputFormatter(field.maxLength)],
      initialValue: field.value,
      decoration: const InputDecoration(
        isDense: true,
        isCollapsed: true,
        contentPadding: EdgeInsets.only(bottom: 8),
        hintText: 'Insira o texto',
      ),
      maxLines: null,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return combine(
          [
            () => isRequired(
                  value,
                  field.isRequired,
                  singleFormProvider.isFormStateLoading,
                ),
            () => maxLength(value, field.maxLength),
            () => regex(value, field.regex),
          ],
        );
      },
    );
  }
}
