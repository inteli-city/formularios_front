import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';

class CustomTypeAheadFormField extends StatefulWidget {
  final TypeAheadFieldEntity field;
  final Function(String?) onChanged;

  const CustomTypeAheadFormField({
    super.key,
    required this.field,
    required this.onChanged,
  });

  @override
  State<CustomTypeAheadFormField> createState() => _TypeAheadFormFieldState();
}

class _TypeAheadFormFieldState extends State<CustomTypeAheadFormField>
    with ValidationMixin {
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
    final formController = Modular.get<FormController>();
    return TypeAheadField<String>(
      controller: _textController,
      builder: (context, controller, focusNode) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: widget.field.maxLength,
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: widget.field.placeholder,
          ),
          onChanged: (value) => widget.onChanged(value),
          validator: (value) => combine([
            () => maxLength(value, widget.field.maxLength),
            () => regex(value, widget.field.regex),
            () => isRequired(
                  value,
                  widget.field.isRequired,
                  formController.getIsSendingForm(),
                )
          ]),
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
      },
    );
  }
}
