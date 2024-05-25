import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

// formatting, isRequired
class CustomTypeAheadFormField extends StatelessWidget {
  final TypeAheadFieldEntity field;
  final TextEditingController controller;

  const CustomTypeAheadFormField({
    super.key,
    required this.field,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      builder: (context, controller, focusNode) {
        return TextField(
          maxLength: field.maxLength,
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          decoration: InputDecoration(
            labelText: field.placeholder,
            border: const OutlineInputBorder(),
          ),
          inputFormatters: [
            if (field.maxLength != null)
              LengthLimitingTextInputFormatter(field.maxLength),
            if (field.regex != null)
              FilteringTextInputFormatter.allow(RegExp(field.regex!)),
          ],
        );
      },
      controller: controller,
      suggestionsCallback: (pattern) async {
        return field.options
            .where(
              (option) => option.toLowerCase().contains(pattern.toLowerCase()),
            )
            .toList();
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
      onSelected: (suggestion) {
        controller.text = suggestion;
      },
    );
  }
}
