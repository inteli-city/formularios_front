import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class CustomSwitchButtonField extends StatefulWidget with ValidationMixin {
  final SwitchButtonFieldEntity field;
  final SectionEntity sectionEntity;
  final Function(bool?) onChanged;
  final SingleFormProvider singleFormProvider;

  CustomSwitchButtonField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.sectionEntity,
    required this.singleFormProvider,
  });

  @override
  State<CustomSwitchButtonField> createState() =>
      _CustomSwitchButtonFieldState();
}

class _CustomSwitchButtonFieldState extends State<CustomSwitchButtonField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Switch(
          activeColor: Theme.of(context).colorScheme.secondary,
          activeTrackColor: Theme.of(context).colorScheme.primary,
          inactiveThumbColor: Theme.of(context).colorScheme.secondary,
          inactiveTrackColor: AppColors.gray,
          value: widget.singleFormProvider.getFieldValue(
                  widget.sectionEntity.sectionId, widget.field.key) ??
              false,
          onChanged: (value) {
            setState(
              () {
                widget.onChanged(value);
              },
            );
          },
        ),
      ],
    );
  }
}
