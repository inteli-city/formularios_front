class JustificativeOptionEntity {
  final String option;
  final bool requiredImage;
  final bool requiredText;

  JustificativeOptionEntity({
    required this.option,
    required this.requiredImage,
    required this.requiredText,
  });
}

class JustificativeEntity {
  final List<JustificativeOptionEntity> options;
  final String? selectedOption;
  final String? text;
  final String? image;

  JustificativeEntity({
    required this.options,
    required this.selectedOption,
    required this.text,
    required this.image,
  });
}
