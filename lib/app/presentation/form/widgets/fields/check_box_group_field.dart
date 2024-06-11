import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomCheckBoxGroupFormField extends StatefulWidget with ValidationMixin {
  final CheckBoxGroupFieldEntity field;
  final Function(List<String?>) onChanged;
  final SectionEntity sectionEntity;
  final FormController formController;

  CustomCheckBoxGroupFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.sectionEntity,
    required this.formController,
  });

  @override
  State<CustomCheckBoxGroupFormField> createState() =>
      _CustomCheckBoxGroupFormFieldState();
}

class _CustomCheckBoxGroupFormFieldState
    extends State<CustomCheckBoxGroupFormField> {
  late List<String> selectedOptions;

  @override
  void initState() {
    super.initState();

    int sectionIndex = widget.formController.form.sections.indexWhere(
        (section) => section.sectionId == widget.sectionEntity.sectionId);
    int fieldIndex = widget.formController.form.sections[sectionIndex].fields
        .indexWhere((field) => field.key == widget.field.key);
    selectedOptions = widget.formController.form.sections[sectionIndex]
            .fields[fieldIndex].value ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.field.placeholder,
          style: Theme.of(context).textTheme.titleMedium,
        ),
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
      ],
    );
  }
}
