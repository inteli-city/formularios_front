import 'package:formularios_front/app/domain/entities/justificative_entity.dart';

class CancelFormController {
  List<String>? selectedImages;
  String? justificativeText;
  JustificativeOptionEntity? selectedOption;

  CancelFormController({this.selectedImages, this.justificativeText}) {
    selectedImages = [];
  }

  List<String>? get images => selectedImages;

  void setImage(List<String> value) => selectedImages = value;

  String? get justificative => justificativeText;

  void setJustificative(String? value) => justificativeText = value;

  JustificativeOptionEntity? get option => selectedOption;

  void setOption(JustificativeOptionEntity? value) => selectedOption = value;
}
