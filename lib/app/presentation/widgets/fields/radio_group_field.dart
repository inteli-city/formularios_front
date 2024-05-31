import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';

//regex, formatting
class CustomRadioGroupFormField extends StatelessWidget with ValidationMixin {
  final RadioGroupFieldEntity field;
  final Function(String?) onChanged;
  final FormController formController;
  final SectionEntity sectionEntity;

  CustomRadioGroupFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.formController,
    required this.sectionEntity,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: field.value,
      validator: (value) {
        return combine([
          () => isRequired(
              value, field.isRequired, formController.getIsSendingForm()),
          () => regex(value, field.regex),
        ]);
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field.placeholder,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ...field.options.map(
              (option) {
                return RadioListTile<String>(
                  title: Text(option,
                      style: Theme.of(context).textTheme.titleMedium),
                  value: option,
                  groupValue: formController.getFieldValue(
                      sectionEntity.sectionId, field.key, field.value),
                  onChanged: (value) {
                    state.didChange(value);
                    onChanged(value);
                  },
                );
              },
            ),
            if (state.hasError)
              Text(
                state.errorText ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.red),
              ),
          ],
        );
      },
    );
  }
}
