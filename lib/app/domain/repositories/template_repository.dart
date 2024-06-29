import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

abstract class ITemplateRepository {
  Future<Either<Failure, List<TemplateEntity>>> getTemplates();
}
