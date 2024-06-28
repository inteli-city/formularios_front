import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';

abstract class ITemplateRepository {
  Future<Either<Failure, List<TemplateEntity>>> getTemplates();
}
