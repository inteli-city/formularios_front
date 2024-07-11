import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

abstract class ICreateFormUsecase {
  Future<Either<Failure, FormEntity>> call({
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
  });
}

class CreateFormUsecase implements ICreateFormUsecase {
  final IFormRepository repository;

  CreateFormUsecase({required this.repository});

  @override
  Future<Either<Failure, FormEntity>> call({
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
    FormEntity form = FormEntity(
      formTitle: template.formTitle,
      formId: '',
      creatorUserId: '',
      userId: '',
      vinculationFormId: null,
      template: template.template,
      area: area,
      system: template.system,
      street: street,
      city: city,
      number: number,
      latitude: latitude,
      longitude: longitude,
      region: region,
      description: description,
      priority: priority,
      status: FormStatusEnum.NOT_STARTED,
      expirationDate:
          DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
      creationDate: 0,
      startDate: null,
      conclusionDate: null,
      justificative: template.justificative,
      comments: null,
      sections: template.sections,
      canVinculate: template.canVinculate,
    );

    return repository.createForm(form: form);
  }
}
