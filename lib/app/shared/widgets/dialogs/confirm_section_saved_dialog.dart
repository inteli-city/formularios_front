import 'package:flutter/material.dart';

Future<String?> confirmSectionSavedDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('Deseja salvar as alterações?',style: Theme.of(context).textTheme.bodyLarge,),
      content: const Text('Caso não salve, as alterações serão perdidas.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancelar'),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Salvar'),
          child: const Text('Salvar'),
        ),
      ],
    ),
  );
}
