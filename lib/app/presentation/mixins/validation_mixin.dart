import 'package:intl/intl.dart';

import '../../../generated/l10n.dart';

mixin ValidationMixin {
  String? isRequired(String? value, bool isRequired, bool isSendingForm,
      [String? message]) {
    value = value ?? '';
    if (isSendingForm && isRequired) {
      return value.isEmpty ? (message ?? S.current.thisFieldIsRequired) : null;
    }
    return null;
  }

  String? maxLength(String? value, int? maxLength, [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (maxLength != null && value.length > maxLength) {
      return message ??
          '${S.current.thisFieldShouldHaveMaximumLength} $maxLength caracteres';
    }
    return null;
  }

  String? minLength(String? value, int? minLength, [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (minLength != null && value.length < minLength) {
      return message ??
          '${S.current.thisFieldShouldHaveMinimumLength} $minLength caracteres';
    }
    return null;
  }

  String? regex(String? value, String? regex, [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (regex != null && !RegExp(regex).hasMatch(value)) {
      return message ?? S.current.invalidFormat;
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
      return message ?? '${S.current.thisFieldShouldHaveMaximumValue}$maxValue';
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
      return message ?? '${S.current.thisFieldShouldHaveMinimumValue}$minValue';
    }
    return null;
  }

  String? maxQuantity(int? quantity, int? maxQuantity, [String? message]) {
    if (maxQuantity != null && quantity != null && quantity > maxQuantity) {
      return message ?? '${S.current.maxFilesQuantity}$maxQuantity';
    }
    return null;
  }

  String? minQuantity(int? quantity, int? minQuantity, [String? message]) {
    if (minQuantity != null && quantity != null && quantity < minQuantity) {
      return message ?? '${S.current.minFilesQuantity}$minQuantity';
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
          '${S.current.thisDateShouldBeBefore} ${DateFormat('dd/MM/yyyy').format(maxDate)}';
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
          '${S.current.thisDateSouldBeAfter} ${DateFormat('dd/MM/yyyy').format(minDate)}';
    }
    return null;
  }

  String? checkLimit(List<String?>? value, int? maxCheckLimit,
      [String? message]) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (maxCheckLimit != null && value.length > maxCheckLimit) {
      return message ?? '${S.current.maxCheckLimit} $maxCheckLimit';
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
