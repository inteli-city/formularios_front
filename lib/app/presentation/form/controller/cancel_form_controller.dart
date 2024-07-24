import 'package:formularios_front/app/domain/entities/justification_entity.dart';

class CancelFormController {
  String? selectedImage;
  String? justificationText;
  JustificationOptionEntity? selectedOption;

  CancelFormController({this.selectedImage, this.justificationText});

  void setSelectedOption(JustificationOptionEntity? option) {
    selectedOption = option;
  }

  void setImage(String value) => selectedImage = value;

  void setJustificationText(String? value) => justificationText = value;

  void setOption(JustificationOptionEntity? value) => selectedOption = value;
}
