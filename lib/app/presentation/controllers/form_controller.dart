import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/shared/helpers/functions/global_snackbar.dart';

class FormController {
  List<SectionEntity> sections;

  FormController({required this.sections});

  bool get validateRequiredFields {
    for (var section in sections) {
      for (var field in section.fields) {
        if (field.isRequired && field.value == null) {
          GlobalSnackBar.error("O campo ${field.placeholder} é obrigatório");
          return false;
        }
      }
    }
    return true;
  }

  void setFieldValue(String sectionId, String key, dynamic value) {
    sections
        .firstWhere((section) => section.sectionId == sectionId)
        .fields
        .firstWhere((field) => field.key == key)
        .value = value;
  }

  void saveForm() {
    // validar se os fields preenchidos estão corretos
    GlobalSnackBar.success("Formulário salvo com sucesso");
  }

  void sendForm() {
    // validar se as sections estão corretas
    GlobalSnackBar.error(
        "Todas as secões devem ser salvas antes de enviar o formulário");
  }
}
