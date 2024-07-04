import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/presentation/create-form/controlles/create_form_controller.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:formularios_front/app/presentation/create-form/states/template_state.dart';
import 'package:formularios_front/app/presentation/create-form/stores/template_provider.dart';
import 'package:formularios_front/app/presentation/create-form/widgets/text_field_widget.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CreateFormPage extends StatefulWidget {
  const CreateFormPage({super.key});

  @override
  State<CreateFormPage> createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TemplateEntity? selectedTemplate;
  PriorityEnum? selectedPriority;

  void resetFields() {
    latitudeController.clear();
    longitudeController.clear();
    cityController.clear();
    streetController.clear();
    numberController.clear();
    descriptionController.clear();
    areaController.clear();
    regionController.clear();
    selectedTemplate = null;
    selectedPriority = null;
  }

  void setAdressFields(
      String city, String street, double lat, double long, String number) {
    cityController.text = city;
    streetController.text = street;
    latitudeController.text = lat.toStringAsFixed(5);
    longitudeController.text = long.toStringAsFixed(5);
    numberController.text = number;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TemplateProvider>(builder: (_, provider, child) {
      var state = provider.state;
      return state is TemplateErrorState
          ? errorBuild(state.error)
          : state is TemplateSuccessState
              ? successBuild(state.templates)
              : const Center(child: CircularProgressIndicator());
    });
  }

  Widget errorBuild(Failure error) {
    return Center(
      key: const Key('error-build'),
      child: Text(error.toString()),
    );
  }

  Widget successBuild(List<TemplateEntity> templates) {
    var provider = Modular.get<TemplateProvider>();

    var formKey = GlobalKey<FormState>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CreateFormController>(
            create: (_) => Modular.get<CreateFormController>()),
      ],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              key: const Key('success-build'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crie um formulário',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: AppDimensions.paddingLarge),
                DropdownButtonFormField2<TemplateEntity>(
                  isExpanded: true,
                  isDense: true,
                  value: selectedTemplate,
                  validator: (value) {
                    if (value == null) {
                      return '';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(height: 0),
                    labelText: 'Selecione um template',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryBlue,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.red,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryBlue,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                  ),
                  items: templates.map(
                    (template) {
                      return DropdownMenuItem(
                        value: template,
                        child: Text(
                          template.formTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (TemplateEntity? template) {
                    selectedTemplate = template;
                  },
                ),
                const SizedBox(height: AppDimensions.paddingMedium),
                DropdownButtonFormField2<PriorityEnum>(
                  isExpanded: true,
                  isDense: true,
                  value: selectedPriority,
                  validator: (value) {
                    if (value == null) {
                      return '';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(height: 0),
                    labelText: 'Prioridade',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryBlue,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.red,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryBlue,
                        width: AppDimensions.borderMedium,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                  ),
                  items: PriorityEnum.values.map(
                    (priority) {
                      return DropdownMenuItem(
                        value: priority,
                        child: Text(
                          priority.enumString,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (PriorityEnum? priority) {
                    selectedPriority = priority;
                  },
                ),
                const SizedBox(height: AppDimensions.paddingMedium),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        label: 'Área',
                        controller: areaController,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        label: 'Região',
                        controller: regionController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.paddingMedium),
                TextFieldWidget(
                  label: 'Descrição',
                  isRequired: false,
                  controller: descriptionController,
                ),
                const SizedBox(height: AppDimensions.paddingMedium),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: GoogleMap(
                    gestureRecognizers: {
                      Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer())
                    },
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
                    onTap: (LatLng latLng) async {
                      final lat = latLng.latitude;
                      final long = latLng.longitude;
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(lat, long);
                      if (placemarks.isNotEmpty) {
                        final address = placemarks.first;
                        String city = address.subAdministrativeArea!;
                        String street = address.thoroughfare!;
                        String number = address.subThoroughfare!;

                        setAdressFields(city, street, lat, long, number);

                        Modular.get<CreateFormController>().setAdress(
                          lat,
                          long,
                          city,
                          street,
                          int.parse(number),
                        );
                      }
                    },
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(-23.6114, -46.694),
                      zoom: 12,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.paddingMedium),
                Consumer<CreateFormController>(builder: (_, provider, child) {
                  return TextFieldWidget(
                    label: 'Cidade',
                    controller: cityController,
                    isEnabled: false,
                  );
                }),
                const SizedBox(height: AppDimensions.paddingMedium),
                Consumer<CreateFormController>(builder: (_, provider, child) {
                  return TextFieldWidget(
                    label: 'Rua',
                    controller: streetController,
                  );
                }),
                const SizedBox(height: AppDimensions.paddingMedium),
                Consumer<CreateFormController>(builder: (_, provider, child) {
                  return TextFieldWidget(
                    label: 'Número',
                    controller: numberController,
                  );
                }),
                const SizedBox(height: AppDimensions.paddingMedium),
                Consumer<CreateFormController>(builder: (_, provider, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          label: 'Latitude',
                          controller: latitudeController,
                          isEnabled: false,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFieldWidget(
                          label: 'Longitude',
                          controller: longitudeController,
                          isEnabled: false,
                        ),
                      )
                    ],
                  );
                }),
                const SizedBox(height: AppDimensions.paddingMedium),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: provider.isLoading
                        ? () {}
                        : () async {
                            if (formKey.currentState!.validate()) {
                              await provider.createForm(
                                template: selectedTemplate!,
                                area: areaController.text,
                                city: cityController.text,
                                street: streetController.text,
                                number: int.parse(numberController.text),
                                latitude: double.parse(latitudeController.text),
                                longitude:
                                    double.parse(longitudeController.text),
                                region: regionController.text,
                                priority: selectedPriority!,
                                description: descriptionController.text,
                              );
                              resetFields();
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.primaryBlue,
                    ),
                    child: provider.isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Criar Formulário',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                  ),
                ),
                const SizedBox(height: AppDimensions.paddingMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
