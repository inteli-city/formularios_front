import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/mixins/validation_mixin.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:intl/intl.dart';

class CustomDateFormField extends StatefulWidget with ValidationMixin {
  final DateFieldEntity field;
  final Function(DateTime?) onChanged;
  final SingleFormProvider singleFormProvider;

  CustomDateFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.singleFormProvider,
  });

  @override
  State<CustomDateFormField> createState() => _CustomDateFormFieldState();
}

class _CustomDateFormFieldState extends State<CustomDateFormField>
    with ValidationMixin {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: widget.field.value != null
          ? DateFormat('dd/MM/yyyy').format(widget.field.value!).toString()
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _textController,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.edit_calendar_outlined,
          color: AppColors.primaryBlue,
          size: AppDimensions.iconMedium,
        ),
        isDense: true,
        isCollapsed: true,
        contentPadding: const EdgeInsets.only(bottom: 8, left: 8),
        hintText: 'Selecione uma data',
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          barrierDismissible: false,
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
          initialDate: widget.field.value?.toUtc() ?? widget.field.minDate,
          firstDate: widget.field.minDate ??
              DateTime(
                1900,
              ),
          lastDate: widget.field.maxDate ?? DateTime(2100),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          _textController.text = formattedDate;
          widget.onChanged(DateFormat('dd/MM/yyyy').parse(formattedDate));
        }
      },
      validator: (value) {
        return combine(
          [
            () => isRequired(
                  value,
                  widget.field.isRequired,
                  widget.singleFormProvider.isFormStateLoading,
                ),
            () => minDate(value, widget.field.minDate),
            () => maxDate(value, widget.field.maxDate),
          ],
        );
      },
    );
  }
}
