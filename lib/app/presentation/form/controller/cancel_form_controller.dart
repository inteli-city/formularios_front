class CancelFormController {
  List<String>? selectedImages;
  String? justificativeText;
  String? selectedOption;

  CancelFormController({this.selectedImages, this.justificativeText}) {
    selectedImages = [];
  }

  List<String>? get images => selectedImages;

  void setImage(List<String> value) => selectedImages = value;

  String? get justificative => justificativeText;

  void setJustificative(String? value) => justificativeText = value;

  String? get option => selectedOption;

  void setOption(String? value) => selectedOption = value;
}
