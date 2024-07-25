import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/information_field_type.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/form/widgets/dialogs/cancel_form_dialog.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class FormDetailsPage extends StatefulWidget {
  const FormDetailsPage({super.key});

  @override
  State<FormDetailsPage> createState() => FormDetailsPageState();
}

class FormDetailsPageState extends State<FormDetailsPage> {
  SingleFormProvider controller = Modular.get<SingleFormProvider>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SingleFormProvider>(
          create: (context) => controller,
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              S.current.details,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(AppDimensions.paddingMedium),
            children: [
              _buildFormDetails(),
              const SizedBox(height: AppDimensions.verticalSpaceMedium),
              Consumer<SingleFormProvider>(builder: (_, provider, child) {
                return controller.isFormStateLoading
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 24),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : _buildFormDetailsActions();
              }),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormDetails() {
    FormEntity form = controller.form;

    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusMedium,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${controller.form.system} - ${controller.form.template}',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppDimensions.verticalSpaceMedium,
          ),
          _buildDetaislRow(
            details: [
              [
                S.current.externId,
                form.formId,
              ],
              [
                S.current.vinculationId,
                form.vinculationFormId ?? '',
              ],
            ],
          ),
          _buildDetaislRow(
            details: [
              [
                S.current.creatorUserId,
                form.creatorUserId,
              ],
            ],
          ),
          _buildDetaislRow(
            details: [
              [
                S.current.priority,
                form.priority.enumString,
              ],
              [
                'Status',
                form.status.enumString,
              ]
            ],
          ),
          _buildDetaislRow(
            details: [
              [
                S.current.creationDate,
                controller.creationDate,
              ],
              [
                S.current.expirationDate,
                controller.expirationDate,
              ],
            ],
          ),
          _buildDetaislRow(
            details: [
              [S.current.street, form.street],
              [
                S.current.number,
                form.number.toString(),
              ],
            ],
          ),
          _buildDetaislRow(
            details: [
              [
                S.current.latitude,
                form.latitude.toString(),
              ],
              [
                S.current.longitude,
                form.longitude.toString(),
              ],
            ],
          ),
          _buildDetaislRow(
            details: [
              [
                S.current.startDate,
                S.current.startDate,
              ],
              [
                S.current.conclusionDate,
                S.current.conclusionDate,
              ]
            ],
          ),
          _buildFormDetail(
            S.current.description,
            form.description,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.paddingMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildInformationFieldsSection(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetaislRow({required List<List<String>> details}) {
    return Row(
      children: details
          .map(
            (detail) => Expanded(
              child: _buildFormDetail(
                detail[0],
                detail[1],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildFormDetail(String attribute, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$attribute:',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            value ?? '',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                ),
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  Widget _buildFormDetailsActions() {
    if (controller.form.status == FormStatusEnum.CONCLUDED ||
        controller.form.status == FormStatusEnum.CANCELED) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        controller.form.status == FormStatusEnum.NOT_STARTED
            ? SizedBox(
                width: double.infinity,
                child: buildCustomElevatedButton(
                  onPressed: () async {
                    await controller.updateFormStatus(
                      status: FormStatusEnum.IN_PROGRESS,
                    );
                  },
                  text: S.current.start,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textColor: AppColors.white,
                ),
              )
            : Row(
                children: [
                  Expanded(
                    child: buildCustomElevatedButton(
                      onPressed: () {
                        Modular.to.pushNamed(
                          '/home/${controller.form.formId}/fill',
                          arguments: controller.form,
                        );
                      },
                      text: S.current.fillForm,
                      backgroundColor: AppColors.primaryBlue,
                      textColor: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: buildCustomElevatedButton(
                      onPressed: () async {
                        await controller.updateFormStatus(
                          status: FormStatusEnum.NOT_STARTED,
                        );
                      },
                      text: S.current.stepBack,
                      textColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: AppColors.white,
                      hasBorder: true,
                    ),
                  ),
                ],
              ),
        _buildDefaultActions(),
        const SizedBox(height: AppDimensions.verticalSpaceMedium),
      ],
    );
  }

  Widget buildCustomElevatedButton({
    required Function()? onPressed,
    required String text,
    Color? backgroundColor,
    Color? textColor,
    bool hasBorder = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.paddingMedium * 1.2,
        ),
        shape: StadiumBorder(
          side: hasBorder
              ? BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                )
              : BorderSide.none,
        ),
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: textColor ?? AppColors.white,
            ),
      ),
    );
  }

  Widget _buildDefaultActions() {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimensions.paddingMedium),
      child: Row(
        children: [
          Expanded(
            child: buildCustomElevatedButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return const CancelFormDialog();
                    });
              },
              text: S.current.cancel,
              backgroundColor: AppColors.red,
              textColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildInformationFieldsSection() {
    if (controller.form.informationFields == null ||
        controller.form.informationFields!.isEmpty) {
      return const [SizedBox()];
    }

    var informationFieldsRows = controller.form.informationFields!.map(
      (field) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(vertical: AppDimensions.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildInformationField(field),
          ),
        );
      },
    ).toList();

    informationFieldsRows.insert(
      0,
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Informações adicionais:',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
    return informationFieldsRows;
  }

  List<Widget> _buildInformationField(InformationFieldEntity informationField) {
    switch (informationField.informationFieldType) {
      case InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD:
        return [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.paddingSmall),
            child: Text(
              'Imagem Auxiliar:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Image.network(
            (informationField as ImageInformationFieldEntity).filePath,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.error,
                color: AppColors.red,
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ];

      case InformationFieldTypeEnum.MAP_INFORMATION_FIELD:
        return [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.paddingSmall),
            child: Text(
              'Localização:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: GoogleMap(
              indoorViewEnabled: false,
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              markers: {
                Marker(
                  infoWindow: InfoWindow.noText,
                  markerId: MarkerId((informationField).toString()),
                  position: LatLng(
                      (informationField as MapInformationFieldEntity).latitude,
                      (informationField).longitude),
                )
              },
              compassEnabled: false,
              mapToolbarEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    (informationField).latitude, (informationField).longitude),
                zoom: 12,
              ),
            ),
          ),
        ];
      case InformationFieldTypeEnum.TEXT_INFORMATION_FIELD:
        return [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.paddingSmall),
            child: Text(
              'Texto Auxiliar:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            (informationField as TextInformationFieldEntity).value,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.white, overflow: TextOverflow.clip),
          ),
        ];
      default:
        return const [SizedBox()];
    }
  }
}
