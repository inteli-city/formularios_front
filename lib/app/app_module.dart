import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/domain/usecases/initialize_user_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/login_user_usecase.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/controllers/form_details_controller.dart';
import 'package:formularios_front/app/presentation/controllers/select_chip_controller.dart';
import 'package:formularios_front/app/presentation/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/pages/form_details_page.dart';
import 'package:formularios_front/app/presentation/pages/home_page.dart';
import 'package:formularios_front/app/presentation/pages/landing_page.dart';
import 'package:formularios_front/app/presentation/pages/splash_page.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/stores/providers/user_provider.dart';
import 'package:formularios_front/app/shared/helpers/environments/environment_config.dart';
// import 'package:formularios_front/app/shared/helpers/guards/user_guard.dart';
import 'package:formularios_front/app/shared/helpers/services/dio/dio_auth_interceptor.dart';
import 'package:formularios_front/app/shared/helpers/services/dio/dio_http_service.dart';
import 'package:formularios_front/app/shared/helpers/services/http_service.dart';
import 'package:gates_microapp_flutter/login.dart';
import 'package:logger/logger.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule(), UserModule()];

  @override
  void binds(i) {
    i.addLazySingleton(Logger.new);
    i.add<IHttpService>(DioHttpService.new);
    i.addLazySingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: EnvironmentConfig.MSS_BASE_URL))
        ..interceptors.addAll(
          [
            AuthInterceptor(),
          ],
        ),
    );
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SplashPage(),
    );
    r.module(
      '/login',
      module: MicroAppLoginModule(),
      guards: [LoginGuard()],
    );
    r.module('/home', module: HomeModule());
  }
}

class HomeModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule()];
  @override
  void binds(i) {
    i.addLazySingleton<FormUserProvider>(FormUserProvider.new);
    i.addLazySingleton<IFormRepository>(
        () => EnvironmentConfig.getFormRepository());
    i.addLazySingleton<IFetchUserFormsUsecase>(FetchUserFormsUsecase.new);
    i.addLazySingleton<IInitiliazeUserFormStatusUseCase>(
        InitiliazeUserFormStatusUseCase.new);
    i.addLazySingleton(FilterFormsController.new);
    i.addLazySingleton(SortFormsController.new);
    i.addLazySingleton(SelectChipController.new);
    i.add(
      () => FormDetailsController(
        externId: i.args.params['externId'],
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const LandingPage(),
      children: [
        ChildRoute(
          '/forms',
          child: (context) => const HomePage(),
          // guards: [UserGuard()],
        ),
      ],
    );
    r.child(
      '/:externId',
      child: (context) => const FormDetailsPage(),
      // guards: [UserGuard()],
    );
  }
}

class UserModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule()];

  @override
  void exportedBinds(i) {
    i.addSingleton(UserProvider.new);
    i.addSingleton<ILoginUserUsecase>(LoginUserUsecase.new);
    i.addSingleton<UserRepository>(() => EnvironmentConfig.getUserRepository());
  }
}
