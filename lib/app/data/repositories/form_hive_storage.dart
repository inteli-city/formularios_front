import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/domain/repositories/form_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FormHiveStorage extends IFormStorage {
  final Box storage;

  FormHiveStorage(this.storage);

  @override
  Future<void> deleteForm({required String formId}) async {
    var forms = FormModel.fromMaps(await storage.get('forms'));

    var index = forms.indexWhere((element) => element.formId == formId);

    forms.removeAt(index);

    await saveForms(forms: forms.map((e) => e.toMap()).toList());
  }

  @override
  Future<List<FormModel>> getForms() async {
    List form = storage.get('forms');

    return FormModel.fromMaps(form);
  }

  @override
  Future<void> saveForms({required List forms}) async {
    await storage.put('forms', forms);
  }

  @override
  Future<void> updateForm({required Map<String, dynamic> form}) async {
    List forms = await storage.get('forms');

    var index =
        forms.indexWhere((element) => element['form_id'] == form['form_id']);

    forms.removeAt(index);

    forms.insert(index, form);

    await saveForms(forms: forms);
  }
}
