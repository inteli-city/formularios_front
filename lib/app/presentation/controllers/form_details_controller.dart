import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:intl/intl.dart';

class FormDetailsController {
  final String formId;

  FormDetailsController({required this.formId}) {
    getForm();
  }

  late FormEntity form;

  void getForm() {
    FormUserProvider provider = Modular.get<FormUserProvider>();

    form = provider.getFormByExternId(formId);
  }

  String get creationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.creationDate, isUtc: true));

  String get expirationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.expirationDate, isUtc: true));
}
