import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:intl/intl.dart';

class CustomDateFormField extends StatefulWidget {
  final DateFieldEntity field;
  final FormSectionController controller;

  const CustomDateFormField({
    super.key,
    required this.field,
    required this.controller,
  });

  @override
  State<CustomDateFormField> createState() => _CustomDateFormFieldState();
}

class _CustomDateFormFieldState extends State<CustomDateFormField> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: widget.field.value != null
          ? DateFormat('dd/MM/yyyy').format(widget.field.value!)
          : '',
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: widget.field.placeholder,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        floatingLabelStyle: Theme.of(context).textTheme.headlineLarge,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: AppDimensions.borderThin,
              style: BorderStyle.solid),
        ),
      ),
      onChanged: (value) {
        widget.controller.setFieldValue(widget.field.key, value);
      },
      onSaved: (value) {
        widget.controller.setFieldValue(widget.field.key, value);
      },
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Theme.of(context).colorScheme.primary,
                  onPrimary: Theme.of(context).colorScheme.secondary,
                  onSurface: Theme.of(context).colorScheme.primary,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              child: child!,
            );
          },
          initialDatePickerMode: DatePickerMode.day,
          context: context,
          initialDate: widget.field.value?.toUtc() ?? DateTime.now(),
          firstDate: widget.field.minDate ?? DateTime(1900),
          lastDate: widget.field.maxDate ?? DateTime(2100),
          locale: const Locale('pt', 'BR'),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          _textController.text = formattedDate;
          widget.controller.setFieldValue(widget.field.key, formattedDate);
        }
      },
      validator: (value) {
        if (widget.field.isRequired && (value == null || value.isEmpty)) {
          return 'Este campo é obrigatório';
        }
        return null;
      },
    );
  }
}
