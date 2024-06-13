import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class CustomCheckBoxFormField extends StatefulWidget {
  final CheckBoxFieldEntity field;
  final Function(bool?) onChanged;
  final SectionEntity sectionEntity;
  final SingleFormProvider singleFormProvider;

  const CustomCheckBoxFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.sectionEntity,
    required this.singleFormProvider,
  });

  @override
  State<CustomCheckBoxFormField> createState() =>
      _CustomCheckBoxFormFieldState();
}

class _CustomCheckBoxFormFieldState extends State<CustomCheckBoxFormField> {
  late bool? selectOption;
  @override
  void initState() {
    super.initState();
    int sectionIndex = widget.singleFormProvider.form.sections.indexWhere(
        (section) => section.sectionId == widget.sectionEntity.sectionId);
    int fieldIndex = widget
        .singleFormProvider.form.sections[sectionIndex].fields
        .indexWhere((field) => field.key == widget.field.key);
    selectOption = widget.singleFormProvider.form.sections[sectionIndex]
            .fields[fieldIndex].value ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      builder: (state) {
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
            widget.field.placeholder,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          value: selectOption,
          onChanged: (value) {
            setState(() {
              selectOption = value;
              widget.onChanged(selectOption);
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
