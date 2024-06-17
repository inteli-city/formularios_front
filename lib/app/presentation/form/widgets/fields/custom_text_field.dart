import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Stack(children: [
      TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(field.maxLength)],
        initialValue: field.value,
        maxLines: null,
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
        decoration: InputDecoration(
          labelText: field.placeholder,
        ),
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
    ]);
  }
}
