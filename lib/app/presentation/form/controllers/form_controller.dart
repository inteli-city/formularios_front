import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:intl/intl.dart';

class FormController {
  final FormEntity form;
  final FormProvider _formProvider;

  FormController(this._formProvider, {required this.form});

  String get creationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.creationDate, isUtc: true));

  String get expirationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.expirationDate, isUtc: true));

  bool isFormStateLoading = false;

  void setIsFormStateLoading(bool value) {
    isFormStateLoading = value;
  }

  void setFormStatus(FormStatusEnum status) {
    form.status = status;
  }

  Future<void> saveForm() async {
    await _formProvider.saveForm(form: form);
  }

  Future<void> sendForm() async {
    await _formProvider.sendForm(
      formId: form.formId,
      sections: form.sections,
      vinculationFormId: form.vinculationFormId,
    );
  }

  Future<void> updateFormStatus(FormStatusEnum status) async {
    var updateForm = await _formProvider.updateFormStatus(
      formId: form.formId,
      status: FormStatusEnum.IN_PROGRESS,
    );
    if (updateForm) {
      form.status = status;
    }
  }

  bool isSendingForm = false;

  void setIsSendingForm(bool value) {
    isSendingForm = value;
  }

  void setFieldValue(String sectionId, String key, dynamic value) {
    var field = form.sections
        .firstWhere((section) => section.sectionId == sectionId)
        .fields
        .firstWhere((field) => field.key == key);
    field.value = value;
  }

  dynamic getFieldValue(String sectionId, String key) {
    return form.sections
        .firstWhere((section) => section.sectionId == sectionId)
        .fields
        .firstWhere((field) => field.key == key)
        .value;
  }
}
