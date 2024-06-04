import 'package:intl/intl.dart';

mixin ValidationMixin {
  String? isRequired(String? value, bool isRequired, bool isSendingForm,
      [String? message]) {
    value = value ?? '';
    if (isSendingForm && isRequired) {
      return value.isEmpty ? (message ?? 'Este campo é obrigatório') : null;
    }
    return null;
  }

  String? maxLength(String? value, int? maxLength, [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (maxLength != null && value.length > maxLength) {
      return message ?? 'Este campo deve ter no máximo $maxLength caracteres';
    }
    return null;
  }

  String? regex(String? value, String? regex, [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (regex != null && !RegExp(regex).hasMatch(value)) {
      return message ?? 'Formato inválido';
    }
    return null;
  }

  String? maxValue(String? value, int? maxValue, [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (maxValue != null &&
        int.tryParse(value) != null &&
        int.parse(value) > maxValue) {
      return message ?? 'Este campo deve ser menor que $maxValue';
    }
    return null;
  }

  String? minValue(String? value, int? minValue, [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (minValue != null &&
        int.tryParse(value) != null &&
        int.parse(value) < minValue) {
      return message ?? 'Este campo deve ser maior que $minValue';
    }
    return null;
  }

  String? maxDate(String? value, DateTime? maxDate, [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    DateTime inputDate = DateFormat('dd/MM/yyyy').parse(value);
    if (maxDate != null && inputDate.isAfter(maxDate)) {
      return message ??
          'A data deve ser anterior a ${DateFormat('dd/MM/yyyy').format(maxDate)}';
    }
    return null;
  }

  String? minDate(String? value, DateTime? minDate, [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    DateTime inputDate = DateFormat('dd/MM/yyyy').parse(value);
    if (minDate != null && inputDate.isBefore(minDate)) {
      return message ??
          'A data deve ser posterior a ${DateFormat('dd/MM/yyyy').format(minDate)}';
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
