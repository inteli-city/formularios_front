// ignore_for_file: constant_identifier_names

import 'package:formularios_front/app/data/repositories/form_mock_repository.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

class EnvironmentConfig {
  static const MSS_BASE_URL = String.fromEnvironment('MSS_BASE_URL');
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static IFormRepository getFormRepository() {
    // EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
    //   (element) {
    //     return element.name.toUpperCase() == ENV.toUpperCase();
    //   },
    //   orElse: () => EnvironmentEnum.DEV,
    // );
    // if (value == EnvironmentEnum.DEV) {
    return FormMockRepository();
    // } else {
    //   return DioUserRepository();
    // }
  }
}
