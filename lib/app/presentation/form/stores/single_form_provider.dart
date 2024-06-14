import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/data/models/section_model.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/usecases/save_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/send_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/update_form_usecase.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:gates_microapp_flutter/helpers/functions/global_snackbar.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class SingleFormProvider extends ChangeNotifier {
  final FormEntity form;
  final IUpdateFormStatusUseCase _updateFormStatusUseCase;
  final ISaveFormUsecase _saveFormUsecase;
  final ISendFormUsecase _sendFormUsecase;
  final Logger _logger;

  SingleFormProvider(this._saveFormUsecase, this._sendFormUsecase,
      this._updateFormStatusUseCase, this._logger,
      {required this.form});

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

  Future<void> saveForm() async {
    setIsFormStateLoading(true);
    await _saveFormUsecase(
      form: form,
    ).then((value) {
      return value.fold(
        (error) {
          _logger.e(error.toString());
          GlobalSnackBar.error(error.message);
        },
        (savedForm) async {
          _logger.d(
            '${DateTime.now()} - Form ${savedForm.formId} saved successfully!',
          );
          GlobalSnackBar.success('Formulário atualizado com sucesso!');
        },
      );
    });
    await Modular.get<FormsProvider>().fetchFormsLocally();
    setIsFormStateLoading(false);
  }

  Future<void> sendForm() async {
    setIsFormStateLoading(true);
    await _sendFormUsecase(
      formId: form.formId,
      sections: form.sections,
      vinculationFormId: form.vinculationFormId,
    ).then((value) {
      return value.fold(
        (error) {
          _logger.e(error.toString());
          GlobalSnackBar.error(error.message);
        },
        (sendedForm) async {
          print(form.sections.map(
            (e) => SectionModel.fromEntity(e).toMap(),
          ));
          _logger.d(
            '${DateTime.now()} - Form ${sendedForm.formId} send successfully!',
          );
          GlobalSnackBar.success('Formulário enviado com sucesso!');
        },
      );
    });
    await Modular.get<FormsProvider>().fetchFormsLocally();
    setIsFormStateLoading(false);
  }

  Future<void> updateFormStatus({required FormStatusEnum status}) async {
    setIsFormStateLoading(true);
    await _updateFormStatusUseCase(
      formId: form.formId,
      status: status,
    ).then((value) {
      return value.fold(
        (error) {
          _logger.e(error.toString());
          GlobalSnackBar.error(error.message);
        },
        (updatedForm) async {
          _logger.d(
            '${DateTime.now()} - Form ${updatedForm.formId} updated status to ${status.name}!',
          );
          GlobalSnackBar.success('Formulário atualizado com sucesso!');
          setFormStatus(status);
        },
      );
    });
    await Modular.get<FormsProvider>().fetchFormsLocally();
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
