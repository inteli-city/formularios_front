class JustificationOptionEntity {
  final String option;
  final bool requiredImage;
  final bool requiredText;

  JustificationOptionEntity({
    required this.option,
    required this.requiredImage,
    required this.requiredText,
  });
}

class JustificationEntity {
  final List<JustificationOptionEntity> options;
  final String? selectedOption;
  final String? justificationText;
  final String? justificationImage;

  JustificationEntity({
    required this.options,
    required this.selectedOption,
    required this.justificationText,
    required this.justificationImage,
  });
}
