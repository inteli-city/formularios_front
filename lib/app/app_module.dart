import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/data/repositories/form_hive_storage.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/repositories/form_storage.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/domain/usecases/save_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/send_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/update_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/login_user_usecase.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/select_chip_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/form/controllers/stepper_controller.dart';
import 'package:formularios_front/app/presentation/form/pages/form_details_page.dart';
import 'package:formularios_front/app/presentation/form/pages/form_sections_page.dart';
import 'package:formularios_front/app/presentation/home/pages/home_page.dart';
import 'package:formularios_front/app/presentation/landing/pages/landing_page.dart';
import 'package:formularios_front/app/presentation/landing/pages/splash_page.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/stores/providers/user_provider.dart';
import 'package:formularios_front/app/shared/helpers/environments/environment_config.dart';
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
    i.addLazySingleton<FormProvider>(FormProvider.new);
    i.addLazySingleton<IFormRepository>(
        () => EnvironmentConfig.getFormRepository());
    i.addLazySingleton<IFetchUserFormsUsecase>(FetchUserFormsUsecase.new);
    i.addLazySingleton<IUpdateFormStatusUseCase>(UpdateFormStatusUseCase.new);
    i.addLazySingleton<ISendFormUsecase>(SendFormUsecase.new);
    i.addLazySingleton<ISaveFormUsecase>(SaveFormUsecase.new);
    i.addLazySingleton(FilterFormsController.new);
    i.addLazySingleton(StepperController.new);
    i.addLazySingleton(SortFormsController.new);
    i.addLazySingleton(SelectChipController.new);
    i.addLazySingleton<IFormStorage>(() => FormHiveStorage.instance());
    i.add(
      () => FormController(
        i.get<FormProvider>(),
        form: i.args.data,
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
    r.child(
      '/:externId/fill',
      child: (context) => const FormSectionsPage(),
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
