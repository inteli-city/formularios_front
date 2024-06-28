import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class IFormRepository {
  Future<Either<Failure, List<FormEntity>>> getUserForms();

  Future<Either<Failure, List<FormEntity>>> getUserFormsLocally();

  Future<Either<Failure, FormEntity>> updateFormStatus({
    required FormStatusEnum status,
    required String formId,
  });

  Future<Either<Failure, FormEntity>> updateFormLocally({
    required FormEntity form,
  });

  Future<Either<Failure, FormEntity>> postForm({
    required String formId,
    required List<SectionEntity> sections,
    String? vinculationFormId,
  });

  Future<Either<Failure, FormEntity>> createForm({required FormEntity form});
}
