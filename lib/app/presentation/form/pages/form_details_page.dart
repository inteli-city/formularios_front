import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/helpers/utils/breakpoints.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/generated/l10n.dart';

class FormDetailsPage extends StatefulWidget {
  const FormDetailsPage({super.key});

  @override
  State<FormDetailsPage> createState() => FormDetailsPageState();
}

class FormDetailsPageState extends State<FormDetailsPage> {
  FormController controller = Modular.get<FormController>();
  FormUserProvider formUserProvider = Modular.get<FormUserProvider>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.paddingMedium,
            horizontal: AppDimensions.paddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Modular.to.pop(),
                  ),
                  Text(
                    '${controller.form.system} - ${controller.form.template}',
                    style: Theme.of(context).textTheme.displayLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: AppDimensions.verticalSpaceMedium,
              ),
              _buildFormDetails(),
              controller.form.status == FormStatusEnum.CONCLUDED
                  ? Container()
                  : _buildFormDetailsActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormDetails() {
    FormEntity form = controller.form;

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
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
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            value ?? '',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge!,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  Widget _buildFormDetailsActions() {
    List<FormStatusEnum> formStatusWithoutActions = [
      FormStatusEnum.CANCELED,
      FormStatusEnum.CONCLUDED
    ];

    return Column(
      children: [
        formStatusWithoutActions.contains(controller.form.status)
            ? const SizedBox()
            : _buildFormStatusWithActions()
      ],
    );
  }

  Widget buildCustomElevatedButton({
    required VoidCallback onPressed,
    required String text,
    Color? backgroundColor,
    Color? textColor,
    bool hasBorder = false,
  }) {
    double screenWidth = ScreenHelper.width(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.paddingMedium * 1.2,
          horizontal: 0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusMedium,
          ),
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
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: textColor ?? AppColors.white,
              height: 1.2,
              fontSize: (screenWidth < breakpointSmallMobile ? 12 : 16),
            ),
      ),
    );
  }

  Widget _buildFormStatusWithActions() {
    return Column(
      children: [
        controller.form.status == FormStatusEnum.NOT_STARTED
            ? SizedBox(
                width: double.infinity,
                child: buildCustomElevatedButton(
                  onPressed: () async {
                    await formUserProvider.updateFormStatus(
                      formId: controller.form.formId,
                      status: FormStatusEnum.IN_PROGRESS,
                    );
                    Modular.to.navigate('/home/forms');
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
                      onPressed: () {},
                      text: S.current.stepBack,
                      textColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: AppColors.white,
                      hasBorder: true,
                    ),
                  ),
                ],
              ),
        _buildDefaultActions(),
      ],
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
                await formUserProvider.updateFormStatus(
                  formId: controller.form.formId,
                  status: FormStatusEnum.CANCELED,
                );
              },
              text: S.current.cancel,
              backgroundColor: AppColors.red,
              textColor: AppColors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: buildCustomElevatedButton(
              onPressed: () {},
              text: S.current.linkForm,
              backgroundColor: Theme.of(context).colorScheme.surface,
              textColor: Theme.of(context).colorScheme.primary,
              hasBorder: true,
            ),
          ),
        ],
      ),
    );
  }
}
