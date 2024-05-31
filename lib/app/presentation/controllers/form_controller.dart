import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/shared/helpers/functions/global_snackbar.dart';

class FormController {
  List<SectionEntity> sections;
  bool isSendingForm = false;
  FormController({required this.sections});

  void setIsSendingForm(bool value) {
    isSendingForm = value;
  }

  bool getIsSendingForm() => isSendingForm;

  void setFieldValue(String sectionId, String key, dynamic value) {
    sections
        .firstWhere((section) => section.sectionId == sectionId)
        .fields
        .firstWhere((field) => field.key == key)
        .value = value;
  }

  void sendForm() {
    setIsSendingForm(true);
    GlobalSnackBar.error(
        "Todas os campos devem ser salvos antes de enviar o formulário");
  }
}
