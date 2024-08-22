import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomCheckBoxGroupFormField extends StatefulWidget with ValidationMixin {
  final CheckBoxGroupFieldEntity field;
  final Function(List<String?>) onChanged;
  final SectionEntity sectionEntity;
  final SingleFormProvider singleFormProvider;

  CustomCheckBoxGroupFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.sectionEntity,
    required this.singleFormProvider,
  });

  @override
  State<CustomCheckBoxGroupFormField> createState() =>
      _CustomCheckBoxGroupFormFieldState();
}

class _CustomCheckBoxGroupFormFieldState
    extends State<CustomCheckBoxGroupFormField> with ValidationMixin {
  late List<String> selectedOptions;

  @override
  void initState() {
    super.initState();

    int sectionIndex = widget.singleFormProvider.form.sections.indexWhere(
        (section) => section.sectionId == widget.sectionEntity.sectionId);
    int fieldIndex = widget
        .singleFormProvider.form.sections[sectionIndex].fields
        .indexWhere((field) => field.key == widget.field.key);
    selectedOptions = widget.singleFormProvider.form.sections[sectionIndex]
            .fields[fieldIndex].value ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    String requiredAsterisk = widget.field.isRequired ? '*' : '';
    return FormField<List<String?>>(
      initialValue: selectedOptions,
      validator: (value) {
        return combine(
          [
            () => isRequired(
                  value.toString(),
                  widget.field.isRequired,
                  widget.singleFormProvider.isSendingForm,
                ),
            () => checkLimit(value, widget.field.checkLimit),
          ],
        );
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...widget.field.options.map(
              (option) {
                return CheckboxListTile(
                  activeColor: Theme.of(context).colorScheme.primary,
                  checkColor: Theme.of(context).colorScheme.secondary,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    style: BorderStyle.solid,
                    width: AppDimensions.borderMedium,
                  ),
                  tileColor: Theme.of(context).colorScheme.secondary,
                  title: Text(
                    option,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  value: selectedOptions.contains(option),
                  onChanged: (newValue) {
                    setState(
                      () {
                        if (newValue == true) {
                          selectedOptions.add(option);
                        } else {
                          selectedOptions.remove(option);
                        }
                      },
                    );
                    widget.onChanged(selectedOptions);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
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
