import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';

abstract class IFormLocalDatasource {
  Future<void> saveForms({required List<FormEntity> forms});
  Future<List<FormEntity>> getForms();
  Future<void> updateForm({required FormEntity form});
  Future<void> deleteForm({required String formId});
  Future<void> addForm({required FormEntity form});
  Future<void> cancelForm(
      {required JustificativeEntity justificative, required String formId});
}
