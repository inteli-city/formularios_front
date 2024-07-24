import 'package:formularios_front/app/domain/entities/justification_entity.dart';

class CancelFormController {
  List<String>? selectedImages;
  String? justificationText;
  JustificationOptionEntity? selectedOption;

  CancelFormController({this.selectedImages, this.justificationText}) {
    selectedImages = [];
  }

  List<String>? get images => selectedImages;

  void setImage(List<String> value) => selectedImages = value;

  String? get justification => justificationText;

  void setjustification(String? value) => justificationText = value;

  JustificationOptionEntity? get option => selectedOption;

  void setOption(JustificationOptionEntity? value) => selectedOption = value;
}
