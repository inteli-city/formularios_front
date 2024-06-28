import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/usecases/get_templates_usecase.dart';
import 'package:formularios_front/app/presentation/create-form/states/template_state.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:logger/logger.dart';

class TemplateProvider extends ChangeNotifier {
  final Logger _logger;
  final IGetTemplatesUsecase _getTemplatesUsecase;
  // ignore: unused_field
  final FormsProvider _formsProvider;

  TemplateProvider(
      this._logger, this._getTemplatesUsecase, this._formsProvider) {
    fetchTemplates();
  }

  TemplateState state = TemplateInitialState();

  List<TemplateEntity> _templates = [];

  List<TemplateEntity> get templates => _templates;

  bool isLoading = false;

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setState(TemplateState value) {
    state = value;
    notifyListeners();
  }

  Future<void> fetchTemplates() async {
    setState(TemplateLoadingState());
    setState(await _getTemplatesUsecase().then((value) {
      return value.fold(
        (error) {
          _logger.e(error.toString());
          return TemplateErrorState(error: error);
        },
        (templates) {
          _logger.d(
            '${DateTime.now()} - Templates fetched successfully!',
          );
          _templates = templates;

          return TemplateSuccessState(templates: templates);
        },
      );
    }));
  }

  Future<void> createForm({
    required TemplateEntity template,
    required String area,
    required String city,
    required String street,
    required int number,
    required double latitude,
    required double longitude,
    required String region,
    required PriorityEnum priority,
    required String? description,
  }) async {
    setIsLoading(true);
    await _formsProvider.createForm(
      template: template,
      area: area,
      city: city,
      street: street,
      number: number,
      latitude: latitude,
      longitude: longitude,
      region: region,
      priority: priority,
      description: description,
    );
    setIsLoading(false);
  }
}
