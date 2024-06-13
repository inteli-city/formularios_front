import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/amplifyconfiguration.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/app_widget.dart';
import 'package:gates_microapp_flutter/amplify/amplify_config.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box storage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify(amplifyconfig);
  await Hive.initFlutter();
  storage = await Hive.openBox<List>('form');
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
