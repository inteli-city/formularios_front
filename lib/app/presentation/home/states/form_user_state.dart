import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class FormUserState {
  const FormUserState();
}

class FormUserInitialState extends FormUserState {}

class FormUserLoadingState extends FormUserState {}

class FormUserErrorState extends FormUserState {
  final Failure error;

  const FormUserErrorState({required this.error});
}

class FormUserSuccessState extends FormUserState {
  final List<FormEntity> forms;

  const FormUserSuccessState({required this.forms});
}
