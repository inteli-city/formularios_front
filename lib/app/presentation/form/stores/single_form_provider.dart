import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:intl/intl.dart';

class SingleFormProvider extends ChangeNotifier {
  final FormEntity form;
  final FormsProvider _formsProvider;

  SingleFormProvider(this._formsProvider, {required this.form});

  String get creationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.creationDate, isUtc: true));

  String get expirationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.expirationDate, isUtc: true));

  bool isFormStateLoading = false;

  void setIsFormStateLoading(bool value) {
    isFormStateLoading = value;
    notifyListeners();
  }

  void setFormStatus(FormStatusEnum status) {
    form.status = status;
    notifyListeners();
  }

  Future<void> cancelForm(
      {required JustificativeEntity justificative,
      required String formId}) async {
    setIsFormStateLoading(true);
    await _formsProvider.cancelForm(
      justificative: justificative,
      formId: formId
    );
    setIsFormStateLoading(false);
  }

  Future<void> saveForm() async {
    setIsFormStateLoading(true);
    await _formsProvider.saveForm(
      form: form,
    );
    setIsFormStateLoading(false);
  }

  Future<void> sendForm() async {
    setIsFormStateLoading(true);
    await _formsProvider.sendForm(
      formId: form.formId,
      sections: form.sections,
    );
    setIsFormStateLoading(false);
  }

  Future<void> updateFormStatus({required FormStatusEnum status}) async {
    setIsFormStateLoading(true);
    FormEntity? formUpdated = await _formsProvider.updateFormStatus(
      formId: form.formId,
      status: status,
    );
    if (formUpdated != null) {
      setFormStatus(status);
    }
    setIsFormStateLoading(false);
  }

  bool isSendingForm = false;

  void setIsSendingForm(bool value) {
    isSendingForm = value;
    notifyListeners();
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
