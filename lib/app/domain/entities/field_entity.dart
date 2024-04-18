class FieldEntity {
  final String name;
  final String placeholder;
  final String? regex;
  final String? formatting;
  final bool isRequired;

  FieldEntity({
    required this.name,
    required this.placeholder,
    this.regex,
    this.formatting,
    required this.isRequired,
  });
}
