import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

abstract class ISendFormUsecase {
  Future<Either<Failure, FormEntity>> call({
    required String formId,
    required List<SectionEntity> sections,
    String? vinculationFormId,
  });
}

class SendFormUsecase implements ISendFormUsecase {
  final IFormRepository repository;

  SendFormUsecase({required this.repository});

  @override
  Future<Either<Failure, FormEntity>> call({
    required String formId,
    required List<SectionEntity> sections,
    String? vinculationFormId,
  }) async {
    return await repository.postForm(
      formId: formId,
      sections: sections,
      vinculationFormId: vinculationFormId,
    );
  }
}
