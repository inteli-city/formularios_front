import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';

class CustomDropDownFormField extends StatelessWidget with ValidationMixin {
  final DropDownFieldEntity field;
  final Function(String?) onChanged;
  final SingleFormProvider singleFormProvider;

  CustomDropDownFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.singleFormProvider,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      isDense: true,
      value: field.value,
      hint: const Text(
        'Selecionar valor',
        textAlign: TextAlign.center,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 8),
        hintText: 'Selecionar valor',
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 1)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 1)),
      ),
      items: field.options.map(
        (option) {
          return DropdownMenuItem(
            value: option,
            child: Text(
              option,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        },
      ).toList(),
      onChanged: onChanged,
      validator: (value) {
        return combine(
          [
            () => isRequired(
                  value,
                  field.isRequired,
                  singleFormProvider.isSendingForm,
                ),
          ],
        );
      },
    );
  }
}
