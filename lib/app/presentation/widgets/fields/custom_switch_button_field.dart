import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class CustomSwitchButtonField extends StatelessWidget {
  final SwitchButtonFieldEntity field;
  final Function(bool?) onChanged;

  const CustomSwitchButtonField({
    super.key,
    required this.field,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          field.placeholder,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Switch(
          activeColor: Theme.of(context).colorScheme.secondary,
          activeTrackColor: Theme.of(context).colorScheme.primary,
          inactiveThumbColor: Theme.of(context).colorScheme.secondary,
          inactiveTrackColor: AppColors.gray,
          value: field.value ?? false,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
