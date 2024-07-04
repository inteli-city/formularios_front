import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/usecases/create_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/fetch_forms_locally_usecase.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/domain/usecases/save_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/send_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/update_form_usecase.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/home/states/form_user_state.dart';
import 'package:gates_microapp_flutter/shared/helpers/functions/global_snackbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FormsProvider extends ChangeNotifier {
  final IFetchUserFormsUsecase _fetchUserFormsUsecase;
  final IFetchFormsLocallyUsecase _fetchFormsLocallyUsecase;
  final IUpdateFormStatusUseCase _updateFormStatusUseCase;
  final ISendFormUsecase _sendFormUsecase;
  final ISaveFormUsecase _saveFormUsecase;
  final ICreateFormUsecase _createFormUsecase;

  FormsProvider(
    this._fetchUserFormsUsecase,
    this._fetchFormsLocallyUsecase,
    this._updateFormStatusUseCase,
    this._sendFormUsecase,
    this._saveFormUsecase,
    this._createFormUsecase,
  ) {
    syncForms();
    _startRetryTimer();
  }

  final List<Function> _pendingRequests = [];

  int get pendingRequestsCount => _pendingRequests.length;

  void _startRetryTimer() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      _retryPendingRequests();
    });
  }

  Future<void> _retryPendingRequests() async {
    if (_pendingRequests.isNotEmpty) {
      List<Function> requestsToRetry = List.from(_pendingRequests);
      _pendingRequests.clear();

      for (var request in requestsToRetry) {
        await request();
      }
    }
  }

  void _addRequestToRetryQueue(Function request) {
    _pendingRequests.add(request);
  }

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

  List<(FormEntity, LatLng)> get locations => _allForms
      .map((form) => (form, LatLng(form.latitude, form.longitude)))
      .toList();

  void setState(FormUserState value) {
    state = value;
    notifyListeners();
  }

  Future<void> fetchFormsLocally() async {
    setState(FormUserLoadingState());
    setState(await _fetchFormsLocallyUsecase().then((value) {
      return value.fold(
        (error) {
          GlobalSnackBar.error(error.errorMessage);
          return FormUserErrorState(error: error);
        },
        (forms) {
          _allForms = forms;
          ('fetchFormsLocally success');
          return FormUserSuccessState(forms: forms);
        },
      );
    }));
  }

  Future<void> syncForms() async {
    setState(FormUserLoadingState());
    setState(await _fetchUserFormsUsecase().then((value) {
      return value.fold(
        (error) {
          GlobalSnackBar.error(error.errorMessage);
          return FormUserErrorState(error: error);
        },
        (forms) {
          _allForms = forms;
          return FormUserSuccessState(forms: forms);
        },
      );
    }));
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

  Future<FormEntity?> updateFormStatus(
      {required String formId, required FormStatusEnum status}) async {
    var result = await _updateFormStatusUseCase(
      formId: formId,
      status: status,
    );

    return result.fold(
      (error) {
        GlobalSnackBar.error(error.errorMessage);
        _addRequestToRetryQueue(
            () => updateFormStatus(formId: formId, status: status));
        return null;
      },
      (updatedForm) async {
        GlobalSnackBar.success('Formulário atualizado com sucesso!');
        await fetchFormsLocally();
        return updatedForm;
      },
    );
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
          GlobalSnackBar.error(error.errorMessage);
          _addRequestToRetryQueue(() => sendForm(
                formId: formId,
                sections: sections,
                vinculationFormId: vinculationFormId,
              ));
        },
        (sendedForm) async {
     
          GlobalSnackBar.success('Formulário enviado com sucesso!');

          await fetchFormsLocally();
        },
      );
    });
  }

  Future<void> saveForm({required FormEntity form}) async {
    await _saveFormUsecase(
      form: form,
    ).then((value) {
      return value.fold(
        (error) {
          GlobalSnackBar.error(error.errorMessage);
        },
        (savedForm) async {
          GlobalSnackBar.success('Formulário atualizado com sucesso!');
        },
      );
    });
    await fetchFormsLocally();
  }

  Future<void> createForm({
    required TemplateEntity template,
    required String area,
    required String city,
    required String street,
    required int number,
    required double latitude,
    required double longitude,
    required String region,
    required PriorityEnum priority,
    required String? description,
  }) async {
    await _createFormUsecase(
      template: template,
      area: area,
      city: city,
      street: street,
      number: number,
      latitude: latitude,
      longitude: longitude,
      region: region,
      priority: priority,
      description: description,
    ).then((value) {
      return value.fold(
        (error) {
          GlobalSnackBar.error(error.errorMessage);
        },
        (createdForm) async {
          GlobalSnackBar.success('Formulário atualizado com sucesso!');
        },
      );
    });
    await fetchFormsLocally();
  }
}
