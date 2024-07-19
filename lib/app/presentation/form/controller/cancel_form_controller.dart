class CancelFormController {
  String? selectedImage;
  String? justificativeText;

  CancelFormController({this.selectedImage, this.justificativeText});

  String? get image => selectedImage;

  void setImage(String? value) => selectedImage = value;

  String? get justificative => justificativeText;

  void setJustificative(String? value) => justificativeText = value;
}
