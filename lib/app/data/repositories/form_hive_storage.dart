import 'package:formularios_front/app/data/models/form_model.dart';
import 'package:formularios_front/app/domain/repositories/form_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FormHiveStorage extends IFormStorage {
  final Box storage;

  FormHiveStorage._(this.storage);

  static Future<FormHiveStorage> instance() async {
    await Hive.initFlutter();
    return FormHiveStorage._(await Hive.openBox<List<Map>>('form'));
  }

  @override
  Future<void> deleteForm({required String formId}) async {
    var forms = FormModel.fromMaps(await storage.get('forms'));

    var index = forms.indexWhere((element) => element.formId == formId);

    forms.removeAt(index);

    await saveForms(forms: forms.map((e) => e.toMap()).toList());
  }

  @override
  Future<List<FormModel>> getForms() async {
    List<Map<String, dynamic>> form = storage.get('forms');

    return FormModel.fromMaps(form);
  }

  @override
  Future<void> saveForms({required List<Map<String, dynamic>> forms}) async {
    await storage.put('forms', forms);
  }

  @override
  Future<void> updateForm({required Map<String, dynamic> form}) async {
    var forms = FormModel.fromMaps(await storage.get('forms'));

    var index = forms.indexWhere((element) => element.formId == form['formId']);

    forms.removeAt(index);

    forms.insert(index, FormModel.fromMap(form));

    await saveForms(forms: forms.map((e) => e.toMap()).toList());
  }
}
