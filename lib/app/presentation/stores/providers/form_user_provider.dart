import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
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

  void filterFormsByStatus(FormStatusEnum? enumStatus) {
    if (enumStatus == null) {
      setState(FormUserSuccessState(forms: _allForms));
      return;
    }

    setState(FormUserSuccessState(
        forms: _allForms.where((form) => form.status == enumStatus).toList()));
  }
}
