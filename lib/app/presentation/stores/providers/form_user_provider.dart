import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/states/form_user_state.dart';
import 'package:formularios_front/app/presentation/stores/providers/filtered_data_provider.dart';
import 'package:formularios_front/app/shared/helpers/functions/global_snackbar.dart';
import 'package:logger/logger.dart';

class FormUserProvider extends ChangeNotifier {
  final IFetchUserFormsUsecase _fetchUserFormsUsecase;

  final FilteredDataProvider _filteredDataProvider;

  FormUserProvider(
    this._fetchUserFormsUsecase,
    this._filteredDataProvider,
  );
  FormUserState state = FormUserInitialState();
  List<FormEntity> _allForms = [];

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
          _filteredDataProvider.setFilteredForms(forms);

          return FormUserSuccessState(forms: forms);
        },
      );
    }));
  }

  void filterFormsByStatus(FormStatusEnum? enumStatus) {
    if (enumStatus == null) {
      _filteredDataProvider.setFilteredForms(_allForms);
      return;
    }
    List<FormEntity> filteredForms =
        _allForms.where((form) => form.status == enumStatus).toList();

    _filteredDataProvider.setFilteredForms(filteredForms);
  }

  List<FormEntity> filterFormsByAttribute(
      List<FormEntity> forms, String attribute, String value) {
    switch (attribute) {
      case 'city':
        return forms.where((form) => form.city == value).toList();
      case 'template':
        return forms.where((form) => form.template == value).toList();
      case 'region':
        return forms.where((form) => form.region == value).toList();
      case 'street':
        return forms.where((form) => form.street == value).toList();
      case 'system':
        return forms.where((form) => form.system == value).toList();
      default:
        throw Exception('Invalid attribute');
    }
  }

  List<FormEntity> orderFormsByDate(
      List<FormEntity> forms, String? orderDirection) {
    if (orderDirection != null) {
      forms.sort((a, b) =>
          orderDirection == OrderDateEnum.MAIS_RECENTE.enumString
              ? a.creationDate.compareTo(b.creationDate)
              : b.creationDate.compareTo(a.creationDate));
    }
    return forms;
  }

  List<FormEntity> orderFormsByPriority(
      List<FormEntity> forms, String? priorityDirection) {
    if (priorityDirection != null) {
      forms.sort((a, b) =>
          priorityDirection == OrderPriorityEnum.MAIOR_PRIORIDADE.toString()
              ? b.priority.index.compareTo(a.priority.index)
              : a.priority.index.compareTo(b.priority.index));
    }
    return forms;
  }

  void filterAndOrderFormsByAttributes(Map<String, String?> attributes) {
    List<FormEntity> filteredForms = _allForms;

    attributes.forEach((key, value) {
      if (value != null) {
        switch (key) {
          case 'priority':
            filteredForms = orderFormsByPriority(filteredForms, value);
            break;
          case 'creationDate':
            filteredForms = orderFormsByDate(filteredForms, value);
            break;
          default:
            filteredForms = filterFormsByAttribute(filteredForms, key, value);
        }
      }
    });

    _filteredDataProvider.setFilteredForms(filteredForms);
  }
}
