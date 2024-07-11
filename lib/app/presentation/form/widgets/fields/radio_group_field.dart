import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomRadioGroupFormField extends StatefulWidget {
  final RadioGroupFieldEntity field;
  final Function(String?) onChanged;
  final SingleFormProvider singleFormProvider;
  final SectionEntity sectionEntity;

  const CustomRadioGroupFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.sectionEntity,
    required this.singleFormProvider,
  });

  @override
  State<CustomRadioGroupFormField> createState() =>
      _CustomRadioGroupFormFieldState();
}

class _CustomRadioGroupFormFieldState extends State<CustomRadioGroupFormField>
    with ValidationMixin {
  @override
  Widget build(BuildContext context) {
    String requiredAsterisk = widget.field.isRequired ? '*' : '';
    return FormField<String>(
      initialValue: widget.field.value,
      validator: (value) {
        return combine(
          [
            () => isRequired(
                  widget.field.value,
                  widget.field.isRequired,
                  widget.singleFormProvider.isSendingForm,
                ),
          ],
        );
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: AppDimensions.paddingSmall),
                child: Text(
                  '${widget.field.placeholder}:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Text(
                  requiredAsterisk,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            ]),
            ...widget.field.options.map(
              (option) {
                return RadioListTile<String>(
                  toggleable: true,
                  title: Text(option,
                      style: Theme.of(context).textTheme.titleMedium),
                  value: option,
                  groupValue: widget.singleFormProvider.getFieldValue(
                    widget.sectionEntity.sectionId,
                    widget.field.key,
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        widget.onChanged(value);
                      },
                    );
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
