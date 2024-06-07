import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomCheckBoxGroupFormField extends StatefulWidget with ValidationMixin {
  final CheckBoxGroupFieldEntity field;
  final Function(String) onChanged;
  final SectionEntity sectionEntity;

  CustomCheckBoxGroupFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.sectionEntity,
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
    final formController = Modular.get<FormController>();
    selectedOptions = formController.formData[widget.sectionEntity.sectionId]
            [widget.field.key] ??
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
        ...widget.field.options.map((option) {
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
              setState(() {
                if (newValue == true) {
                  selectedOptions.add(option);
                } else {
                  selectedOptions.remove(option);
                }
              });
              widget.onChanged(selectedOptions.toString());
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          );
        }),
      ],
    );
  }
}
