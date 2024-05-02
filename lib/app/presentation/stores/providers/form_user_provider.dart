import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/states/form_user_state.dart';
import 'package:formularios_front/app/shared/helpers/functions/global_snackbar.dart';
import 'package:logger/logger.dart';

class FormUserProvider extends ChangeNotifier {
  final IFetchUserFormsUsecase _fetchUserFormsUsecase;

  FormUserProvider(
    this._fetchUserFormsUsecase,
  );
  FormUserState state = FormUserInitialState();
  List<FormEntity> _allForms = [];

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

  void fetchUserForms() async {
    setState(FormUserLoadingState());
    setState(await _fetchUserFormsUsecase(
      userId: '1',
    ).then((value) {
      return value.fold(
        (error) {
          injector.get<Logger>().e(error.toString());
          GlobalSnackBar.error(error.message);
          return FormUserErrorState(error: error);
        },
        (forms) {
          injector.get<Logger>().d(
                '${DateTime.now()} - Forms from user "1" fetched successfully!',
              );
          _allForms = forms;

          return FormUserSuccessState(forms: forms);
        },
      );
    }));
  }

  String getFormsCountByStatus(FormStatusEnum status) {
    return _allForms.where((form) => form.status == status).length.toString();
  }

  void filterFormsByStatus(FormStatusEnum? enumStatus) {
    if (enumStatus == null) {
      setState(FormUserSuccessState(forms: _allForms));
      return;
    }
    List<FormEntity> filteredForms =
        _allForms.where((form) => form.status == enumStatus).toList();

    setState(FormUserSuccessState(forms: filteredForms));
  }

  void filterForms({
    required String? template,
    required String? street,
    required String? city,
    required String? system,
  }) {
    List<FormEntity> filteredForms = _allForms;

    if (template != null) {
      filteredForms =
          filteredForms.where((form) => form.template == template).toList();
    }
    if (street != null) {
      filteredForms =
          filteredForms.where((form) => form.street == street).toList();
    }
    if (city != null) {
      filteredForms = filteredForms.where((form) => form.city == city).toList();
    }
    if (system != null) {
      filteredForms =
          filteredForms.where((form) => form.system == system).toList();
    }

    setState(FormUserSuccessState(forms: filteredForms));
  }

  void orderForms(OrderEnum? orderEnum) {
    List<FormEntity> orderedForms = _allForms;

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
        setState(FormUserSuccessState(forms: _allForms));
    }

    setState(FormUserSuccessState(forms: orderedForms));
  }
}
