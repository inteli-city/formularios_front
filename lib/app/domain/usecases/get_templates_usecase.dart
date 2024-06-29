import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/domain/repositories/template_repository.dart';

abstract class IGetTemplatesUsecase {
  Future<Either<Failure, List<TemplateEntity>>> call();
}

class GetTemplatesUsecase implements IGetTemplatesUsecase {
  final ITemplateRepository _templateRepository;

  GetTemplatesUsecase(this._templateRepository);

  @override
  Future<Either<Failure, List<TemplateEntity>>> call() async {
    return _templateRepository.getTemplates();
  }
}
