import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class CustomSwitchButtonField extends StatefulWidget {
  final SwitchButtonFieldEntity field;
  final FormSectionController controller;

  const CustomSwitchButtonField({
    super.key,
    required this.field,
    required this.controller,
  });

  @override
  State<CustomSwitchButtonField> createState() =>
      _CustomSwitchButtonFieldState();
}

class _CustomSwitchButtonFieldState extends State<CustomSwitchButtonField> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.field.value ?? false;
  }

  void _onSwitchChanged(bool value) {
    setState(() {
      _switchValue = value;
      widget.controller.setFieldValue(widget.field.key, value);
    });
  }

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
          value: _switchValue,
          onChanged: widget.field.isRequired ? _onSwitchChanged : null,
        ),
      ],
    );
  }
}
