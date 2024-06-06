import 'package:formularios_front/app/data/models/form_model.dart';

abstract class IFormStorage {
  Future<void> saveForms({required List<Map<String, dynamic>> forms});
  Future<List<FormModel>> getForms();
  Future<void> updateForm({required Map<String, dynamic> form});
  Future<void> deleteForm({required String formId});
}
