import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';

class CustomTypeAheadFormField extends StatefulWidget {
  final TypeAheadFieldEntity field;
  final FormSectionController controller;

  const CustomTypeAheadFormField(
      {super.key, required this.field, required this.controller});

  @override
  State<CustomTypeAheadFormField> createState() => _TypeAheadFormFieldState();
}

class _TypeAheadFormFieldState extends State<CustomTypeAheadFormField> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: widget.field.value ?? '',
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      controller: _textController,
      builder: (context, controller, focusNode) {
        return TextField(
          maxLength: widget.field.maxLength,
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          decoration: InputDecoration(
            labelText: widget.field.placeholder,
          ),
          inputFormatters: [
            if (widget.field.maxLength != null)
              LengthLimitingTextInputFormatter(widget.field.maxLength),
            if (widget.field.regex != null)
              FilteringTextInputFormatter.allow(RegExp(widget.field.regex!)),
          ],
        );
      },
      suggestionsCallback: (pattern) async {
        return widget.field.options
            .where(
              (option) => option.toLowerCase().contains(pattern.toLowerCase()),
            )
            .toList();
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(
            suggestion,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      },
      onSelected: (suggestion) {
        _textController.text = suggestion;
        widget.controller.setFieldValue(widget.field.key, suggestion);
      },
    );
  }
}
