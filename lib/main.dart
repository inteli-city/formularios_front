import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/amplifyconfiguration.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/app_widget.dart';
import 'package:gates_microapp_flutter/amplify/amplify_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify(amplifyconfig);
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
