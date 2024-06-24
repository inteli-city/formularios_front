// ignore_for_file: constant_identifier_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/data/repositories/form_repository_impl.dart';
import 'package:formularios_front/app/data/repositories/form_repository_mock.dart';
import 'package:formularios_front/app/data/repositories/user_mock_repository.dart';
import 'package:formularios_front/app/data/repositories/user_repository_impl.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:formularios_front/app/shared/helpers/enums/environment_enum.dart';

class EnvironmentConfig {
  static const MSS_BASE_URL = String.fromEnvironment('MSS_BASE_URL');
  static const ENV = String.fromEnvironment('ENV');

  static IFormRepository getFormRepository() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.LOCAL,
    );
    if (value == EnvironmentEnum.LOCAL) {
      return FormMockRepository();
    } else {
      return FormRepositoryImpl(Modular.get(), Modular.get());
    }
  }

  static IUserRepository getUserRepository() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.LOCAL,
    );
    if (value == EnvironmentEnum.LOCAL) {
      return UserRepositoryMock();
    } else {
      return UserRepositoryImpl(
        Modular.get(),
      );
    }
  }
}
