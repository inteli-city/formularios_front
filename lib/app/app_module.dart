import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/data/datasources/form_datasource.dart';
import 'package:formularios_front/app/data/datasources/user_datasource.dart';
import 'package:formularios_front/app/data/repositories/template_repository_mock.dart';
import 'package:formularios_front/app/domain/repositories/template_repository.dart';
import 'package:formularios_front/app/domain/usecases/cancel_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/create_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/get_templates_usecase.dart';
import 'package:formularios_front/app/external/datasources/form_datasource_impl.dart';
import 'package:formularios_front/app/external/datasources/form_hive_local_datasource.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/data/datasources/form_local_datasource.dart';
import 'package:formularios_front/app/domain/repositories/user_repository.dart';
import 'package:formularios_front/app/domain/usecases/fetch_forms_locally_usecase.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/domain/usecases/save_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/send_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/update_form_usecase.dart';
import 'package:formularios_front/app/domain/usecases/login_user_usecase.dart';
import 'package:formularios_front/app/external/datasources/user_datasource_impl.dart';
import 'package:formularios_front/app/presentation/create-form/controlles/create_form_controller.dart';
import 'package:formularios_front/app/presentation/create-form/pages/create_form_page.dart';
import 'package:formularios_front/app/presentation/create-form/stores/template_provider.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/home/controllers/select_chip_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/form/pages/form_details_page.dart';
import 'package:formularios_front/app/presentation/form/pages/form_sections_page.dart';
import 'package:formularios_front/app/presentation/home/pages/home_page.dart';
import 'package:formularios_front/app/presentation/landing/controllers/connectivity_provider.dart';
import 'package:formularios_front/app/presentation/landing/controllers/splash_controller.dart';
import 'package:formularios_front/app/presentation/landing/pages/landing_page.dart';
import 'package:formularios_front/app/presentation/landing/pages/splash_page.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/map/pages/map_page.dart';
import 'package:formularios_front/app/presentation/profile/pages/profile_page.dart';
import 'package:formularios_front/app/presentation/user/stores/user_provider.dart';
import 'package:formularios_front/app/shared/helpers/environments/environment_config.dart';
import 'package:formularios_front/app/shared/helpers/guards/user_guard.dart';
import 'package:formularios_front/main.dart';
import 'package:gates_microapp_flutter/micro_app_auth_module.dart';
import 'package:gates_microapp_flutter/micro_app_login_module.dart';
import 'package:gates_microapp_flutter/shared/guards/login_guard.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/http_clients/dio_http_client.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/http_clients/http_client.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule(), UserModule()];

  @override
  void binds(i) {
    i.addLazySingleton(ConnectivityProvider.new);
    i.add<SplashController>(SplashController.new);
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

class UserModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule()];
  @override
  void binds(i) {
    i.addLazySingleton<IHttpClient>(DioHttpClient.new);
    i.addSingleton(UserProvider.new);
    i.addSingleton<ILoginUserUsecase>(LoginUserUsecase.new);
    i.addSingleton<IUserRepository>(() => EnvironmentConfig.getUserRepository(),
        config: BindConfig());
    i.addSingleton<IUserDatasource>(UserDatasourceImpl.new);
  }
}

class HomeModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule(), UserModule()];
  @override
  void binds(i) {
    i.addSingleton<IFormDatasource>(FormDatasourceImpl.new);
    i.addLazySingleton<IFormLocalDatasource>(
        () => FormHiveLocalDatasource(storage));
    i.addLazySingleton<FormsProvider>(FormsProvider.new);
    i.addLazySingleton<TemplateProvider>(TemplateProvider.new);
    i.add<CreateFormController>(CreateFormController.new);
    i.addLazySingleton<IFormRepository>(
        () => EnvironmentConfig.getFormRepository());
    i.addLazySingleton<ITemplateRepository>(TemplateRepositoryMock.new);
    i.addLazySingleton<IFetchUserFormsUsecase>(FetchUserFormsUsecase.new);
    i.addLazySingleton<IFetchFormsLocallyUsecase>(FetchFormsLocallyUsecase.new);
    i.addLazySingleton<IUpdateFormStatusUseCase>(UpdateFormStatusUseCase.new);
    i.addLazySingleton<ICancelFormUseCase>(CancelFormUseCase.new);
    i.addLazySingleton<ISendFormUsecase>(SendFormUsecase.new);
    i.addLazySingleton<ISaveFormUsecase>(SaveFormUsecase.new);
    i.addLazySingleton<IGetTemplatesUsecase>(GetTemplatesUsecase.new);
    i.addLazySingleton<ICreateFormUsecase>(CreateFormUsecase.new);
    i.addLazySingleton(FilterFormsController.new);
    i.addLazySingleton(SortFormsController.new);
    i.add(SelectChipController.new);
    i.add(CancelFormController.new);
    i.add(
      () => SingleFormProvider(i.get(), form: i.args.data),
    );
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const LandingPage(),
      guards: [UserGuard()],
      children: [
        ChildRoute(
          '/forms',
          child: (context) => const HomePage(),
          transition: TransitionType.fadeIn,
          guards: [UserGuard()],
        ),
        ChildRoute(
          '/map',
          child: (context) => const MapPage(),
          transition: TransitionType.rightToLeftWithFade,
          guards: [UserGuard()],
        ),
        ChildRoute(
          '/create-form',
          child: (context) => const CreateFormPage(),
          transition: TransitionType.rightToLeftWithFade,
          guards: [UserGuard()],
        ),
        ChildRoute(
          '/profile',
          child: (context) => const ProfilePage(),
          transition: TransitionType.rightToLeftWithFade,
          guards: [UserGuard()],
        ),
        ChildRoute(
          '/:externId',
          child: (context) => const FormDetailsPage(),
          guards: [UserGuard()],
        ),
        ChildRoute(
          '/:externId/fill',
          child: (context) => const FormSectionsPage(),
          guards: [UserGuard()],
        )
      ],
    );
  }
}
