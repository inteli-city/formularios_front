import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class CustomSwitchButtonField extends StatefulWidget with ValidationMixin {
  final SwitchButtonFieldEntity field;
  final SectionEntity sectionEntity;
  final Function(bool?) onChanged;

  CustomSwitchButtonField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.sectionEntity,
  });

  @override
  State<CustomSwitchButtonField> createState() =>
      _CustomSwitchButtonFieldState();
}

class _CustomSwitchButtonFieldState extends State<CustomSwitchButtonField> {
  final formController = Modular.get<FormController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          widget.field.placeholder,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Switch(
          activeColor: Theme.of(context).colorScheme.secondary,
          activeTrackColor: Theme.of(context).colorScheme.primary,
          inactiveThumbColor: Theme.of(context).colorScheme.secondary,
          inactiveTrackColor: AppColors.gray,
          value: formController.getFieldValue(widget.sectionEntity.sectionId,
                  widget.field.key, widget.field.value) ??
              false,
          onChanged: (value) {
            setState(() {
              widget.onChanged(value);
            });
          },
        ),
      ],
    );
  }
}
