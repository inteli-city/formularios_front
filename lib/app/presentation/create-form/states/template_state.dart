import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class TemplateState {
  const TemplateState();
}

class TemplateInitialState extends TemplateState {}

class TemplateLoadingState extends TemplateState {}

class TemplateErrorState extends TemplateState {
  final Failure error;

  const TemplateErrorState({required this.error});
}

class TemplateSuccessState extends TemplateState {
  final List<TemplateEntity> templates;

  const TemplateSuccessState({required this.templates});
}
