import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/domain/usecases/save_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/send_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/update_form_usecase.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/stores/states/form_user_state.dart';
import 'package:formularios_front/app/shared/helpers/functions/global_snackbar.dart';
import 'package:logger/logger.dart';

class FormProvider extends ChangeNotifier {
  final IFetchUserFormsUsecase _fetchUserFormsUsecase;
  final IUpdateFormStatusUseCase _updateFormStatusUseCase;
  final ISaveFormUsecase _saveFormUsecase;
  final ISendFormUsecase _sendFormUsecase;

  FormProvider(
    this._fetchUserFormsUsecase,
    this._updateFormStatusUseCase,
    this._saveFormUsecase,
    this._sendFormUsecase,
  );

  // Altera o estado de fetch, para atualizações em tela para todos os forms
  FormUserState state = FormUserInitialState();
  List<FormEntity> _allForms = [];
  List<FormEntity> _copyAllFilterForms = [];

  FormEntity getFormByExternId(String externId) {
    return _allForms.firstWhere(
      (element) => element.formId == externId,
    );
  }

  List<String> get templates =>
      _allForms.map((form) => form.template).toSet().toList();

  List<String> get streets =>
      _allForms.map((form) => form.street).toSet().toList();

  List<String> get systems =>
      _allForms.map((form) => form.system).toSet().toList();

  List<String> get cities =>
      _allForms.map((form) => form.city).toSet().toList();

  void setState(FormUserState value) {
    state = value;
    notifyListeners();
  }

  Future<void> fetchUserForms() async {
    setState(FormUserLoadingState());
    setState(await _fetchUserFormsUsecase(
      userId: '1',
    ).then((value) {
      return value.fold(
        (error) {
          Modular.get<Logger>().e(error.toString());
          GlobalSnackBar.error(error.message);
          return FormUserErrorState(error: error);
        },
        (forms) {
          Modular.get<Logger>().d(
            '${DateTime.now()} - Forms from user fetched successfully!',
          );
          _allForms = forms;

          return FormUserSuccessState(forms: forms);
        },
      );
    }));
  }

  Future<bool> updateFormStatus(
      {required String formId, required FormStatusEnum status}) async {
    return await _updateFormStatusUseCase(
      formId: formId,
      status: status,
    ).then((value) {
      return value.fold(
        (error) {
          Modular.get<Logger>().e(error.toString());
          GlobalSnackBar.error(error.message);
          return false;
        },
        (updatedForm) async {
          Modular.get<Logger>().d(
            '${DateTime.now()} - Form with ${updatedForm.formId} updated status successfully!',
          );
          GlobalSnackBar.success('Formulário atualizado com sucesso!');
          await fetchUserForms();
          return true;
        },
      );
    });
  }

  Future<void> saveForm({
    required FormEntity form,
  }) async {
    await _saveFormUsecase(
      form: form,
    ).then((value) {
      return value.fold(
        (error) {
          Modular.get<Logger>().e(error.toString());
          GlobalSnackBar.error(error.message);
          setState(FormUserErrorState(error: error));

          return FormUserErrorState(error: error);
        },
        (updatedForm) async {
          Modular.get<Logger>().d(
            '${DateTime.now()} - Form with ${updatedForm.formId} updated status successfully!',
          );
          GlobalSnackBar.success('Formulário atualizado com sucesso!');
          await fetchUserForms();
        },
      );
    });
  }

  Future<void> sendForm({
    required String formId,
    required List<SectionEntity> sections,
    String? vinculationFormId,
  }) async {
    await _sendFormUsecase(
      formId: formId,
      sections: sections,
      vinculationFormId: vinculationFormId,
    ).then((value) {
      return value.fold(
        (error) {
          Modular.get<Logger>().e(error.toString());
          GlobalSnackBar.error(error.message);
        },
        (updatedForm) async {
          Modular.get<Logger>().d(
            '${DateTime.now()} - Form with ${updatedForm.formId} updated status successfully!',
          );
          GlobalSnackBar.success('Formulário enviado com sucesso!');
          await fetchUserForms();
        },
      );
    });
  }

  String getFormsCountByStatus(FormStatusEnum status) {
    var filterController = Modular.get<FilterFormsController>();
    List<FormEntity> filterFormsByStatus =
        filterController.activeFiltersAmount == 0
            ? _allForms.where((form) => form.status == status).toList()
            : _copyAllFilterForms
                .where((form) => form.status == status)
                .toList();

    return filterFormsByStatus.length.toString();
  }

  void filterForms({
    required String? template,
    required String? street,
    required String? city,
    required String? system,
    required FormStatusEnum? enumStatus,
  }) {
    List<FormEntity> toFilterForms = _allForms;

    if (template != null) {
      toFilterForms =
          toFilterForms.where((form) => form.template == template).toList();
    }
    if (street != null) {
      toFilterForms =
          toFilterForms.where((form) => form.street == street).toList();
    }
    if (city != null) {
      toFilterForms = toFilterForms.where((form) => form.city == city).toList();
    }
    if (system != null) {
      toFilterForms =
          toFilterForms.where((form) => form.system == system).toList();
    }
    _copyAllFilterForms = toFilterForms;
    if (enumStatus != null) {
      toFilterForms =
          toFilterForms.where((form) => form.status == enumStatus).toList();
    }

    setState(FormUserSuccessState(forms: toFilterForms));
  }

  void orderForms(OrderEnum? orderEnum) {
    List<FormEntity> orderedForms =
        List.from((state as FormUserSuccessState).forms);

    switch (orderEnum) {
      case OrderEnum.PRIORIDADE_BAIXO_ALTO:
        orderedForms
            .sort((a, b) => a.priority.index.compareTo(b.priority.index));
      case OrderEnum.PRIORIDADE_ALTO_BAIXO:
        orderedForms
            .sort((a, b) => b.priority.index.compareTo(a.priority.index));
      case OrderEnum.MAIS_RECENTE:
        orderedForms.sort((a, b) => a.creationDate.compareTo(b.creationDate));
      case OrderEnum.MAIS_ANTIGO:
        orderedForms.sort((a, b) => b.creationDate.compareTo(a.creationDate));
      default:
        orderedForms = _allForms;
    }
    setState(FormUserSuccessState(forms: orderedForms));
  }
}
