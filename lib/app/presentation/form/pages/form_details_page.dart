import 'dart:convert';

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
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class FormDetailsPage extends StatelessWidget {
  const FormDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SingleFormProvider controller = Modular.get<SingleFormProvider>();

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
              FormDetails(controller: controller),
              const SizedBox(height: AppDimensions.verticalSpaceMedium),
              Consumer<SingleFormProvider>(builder: (_, provider, child) {
                return controller.isFormStateLoading
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 24),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : FormDetailsActions(controller: controller);
              }),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}

class FormDetails extends StatelessWidget {
  final SingleFormProvider controller;

  const FormDetails({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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
          _buildDetaislRow(details: [
            [S.current.externId, form.formId],
            [S.current.vinculationId, form.vinculationFormId ?? ''],
          ], context: context),
          _buildDetaislRow(details: [
            [S.current.creatorUserId, form.creatorUserId]
          ], context: context),
          _buildDetaislRow(details: [
            [S.current.priority, form.priority.enumString],
            ['Status', form.status.enumString],
          ], context: context),
          _buildDetaislRow(details: [
            [S.current.creationDate, controller.creationDate],
            [S.current.expirationDate, controller.expirationDate],
          ], context: context),
          _buildDetaislRow(details: [
            [S.current.street, form.street],
            [S.current.number, form.number.toString()],
          ], context: context),
          _buildDetaislRow(details: [
            [S.current.latitude, form.latitude.toString()],
            [S.current.longitude, form.longitude.toString()],
          ], context: context),
          _buildDetaislRow(details: [
            [S.current.startDate, S.current.startDate],
            [S.current.conclusionDate, S.current.conclusionDate],
          ], context: context),
          _buildFormDetail(S.current.description, form.description, context),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.paddingMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildInformationFieldsSection(context),
            ),
          ),
          JustificationView(controller: controller),
        ],
      ),
    );
  }

  Widget _buildDetaislRow(
      {required List<List<String>> details, required BuildContext context}) {
    return Row(
      children: details
          .map(
            (detail) => Expanded(
              child: _buildFormDetail(detail[0], detail[1], context),
            ),
          )
          .toList(),
    );
  }

  Widget _buildFormDetail(
      String attribute, String? value, BuildContext context) {
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
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                ),
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildInformationFieldsSection(BuildContext context) {
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
            children: _buildInformationField(field, context),
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

  List<Widget> _buildInformationField(
      InformationFieldEntity informationField, BuildContext context) {
    switch (informationField.informationFieldType) {
      case InformationFieldTypeEnum.IMAGE_INFORMATION_FIELD:
        return [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.paddingSmall),
            child: Text(
              'Imagem Auxiliar:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(
            height: 200,
            child: GoogleMap(
              mapType: MapType.normal,
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
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Text(
            (informationField as TextInformationFieldEntity).value,
            textAlign: TextAlign.justify,
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

class JustificationView extends StatelessWidget {
  final SingleFormProvider controller;

  const JustificationView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var justification = controller.form.justification;

    if (justification.justificationImage == null &&
        justification.justificationText == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Text(
              'Justificativa Apresentada:',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.white,
                  ),
              textAlign: TextAlign.justify,
            ),
            justification.justificationText != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimensions.paddingSmall),
                    child: Column(
                      children: [
                        Text(
                          'Texto Justificado:',
                          textAlign: TextAlign.justify,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                          overflow: TextOverflow.clip,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimensions.paddingSmall),
                          child: Text(
                            justification.justificationText!,
                            textAlign: TextAlign.justify,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.white,
                                    ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            justification.justificationImage != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimensions.paddingSmall),
                    child: Column(
                      children: [
                        Text(
                          'Imagem Justificada:',
                          textAlign: TextAlign.justify,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                          overflow: TextOverflow.clip,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimensions.paddingSmall),
                          child:
                              isValidBase64(justification.justificationImage!)
                                  ? Image.memory(
                                      base64Decode(
                                          justification.justificationImage!),
                                      width: ScreenHelper.width(context),
                                      height: ScreenHelper.width(context) / 2,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(
                                      justification.justificationImage!,
                                      width: ScreenHelper.width(context),
                                      height: ScreenHelper.width(context) / 2,
                                      fit: BoxFit.fill,
                                    ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  bool isValidBase64(String base64String) {
    try {
      base64Decode(base64String);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class FormDetailsActions extends StatelessWidget {
  final SingleFormProvider controller;

  const FormDetailsActions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildButtonsByStatus(controller.form.status, context),
        [FormStatusEnum.CANCELED, FormStatusEnum.CONCLUDED]
                .contains(controller.form.status)
            ? const SizedBox.shrink()
            : Padding(
                padding:
                    const EdgeInsets.only(top: AppDimensions.paddingMedium),
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
                        context: context,
                      ),
                    ),
                  ],
                ),
              )
      ],
    );
  }

  Widget _buildButtonsByStatus(FormStatusEnum status, BuildContext context) {
    switch (status) {
      case FormStatusEnum.NOT_STARTED:
        return SizedBox(
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
              context: context),
        );
      case FormStatusEnum.IN_PROGRESS:
        return Row(
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
                context: context,
              ),
            ),
            const SizedBox(width: 8),
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
                  context: context),
            ),
          ],
        );
      case FormStatusEnum.CONCLUDED:
        return Row(
          children: [
            Expanded(
              child: buildCustomElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed(
                    '/home/${controller.form.formId}/fill',
                    arguments: controller.form,
                  );
                },
                text: S.current.viewFilledForm,
                backgroundColor: AppColors.primaryBlue,
                textColor: AppColors.white,
                context: context,
              ),
            ),
          ],
        );
      case FormStatusEnum.CANCELED:
        return const SizedBox.shrink();
    }
  }

  Widget buildCustomElevatedButton({
    required Function()? onPressed,
    required String text,
    Color? backgroundColor,
    Color? textColor,
    bool hasBorder = false,
    required BuildContext context,
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
}
