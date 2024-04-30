import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:logger/logger.dart';
import 'package:formularios_front/app/shared/helpers/environments/environment_config.dart';
import 'package:formularios_front/app/shared/helpers/services/dio/dio_auth_interceptor.dart';
import 'package:formularios_front/app/shared/helpers/services/dio/dio_http_service.dart';
import 'package:formularios_front/app/shared/helpers/services/http_service.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.addLazySingleton(Logger.new);
  injector.add<IHttpService>(DioHttpService.new);
  injector.addLazySingleton(FormUserProvider.new);
  injector.addLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: EnvironmentConfig.MSS_BASE_URL))
      ..interceptors.addAll(
        [
          AuthInterceptor(),
        ],
      ),
  );
  injector.addLazySingleton<IFormRepository>(
      () => EnvironmentConfig.getFormRepository());
  injector.addLazySingleton<IFetchUserFormsUsecase>(
      () => FetchUserFormsUsecase(repository: injector.get<IFormRepository>()));
  injector.addLazySingleton(FilterFormController.new);
  injector.commit();
}
