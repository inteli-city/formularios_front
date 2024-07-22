import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';

abstract class IFormDatasource {
  Future<List<FormEntity>> getUserForms();

  Future<FormEntity> updateFormStatus({
    required FormStatusEnum status,
    required String formId,
  });

  Future<FormEntity> postForm({
    required String formId,
    required List<SectionEntity> sections,
    String? vinculationFormId,
  });

  Future<FormEntity> createForm({required FormEntity form});

  Future<FormEntity> cancelForm(
      {required JustificativeEntity justificative, required String formId});
}
