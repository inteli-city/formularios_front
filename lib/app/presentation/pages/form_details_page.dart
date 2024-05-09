import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_details_controller.dart';
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
  FormDetailsController controller = Modular.get<FormDetailsController>();

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
              Text(
                '${controller.form.system} - ${controller.form.template}',
                style: Theme.of(context).textTheme.displayLarge,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: AppDimensions.verticalSpaceMedium,
              ),
              _buildFormDetails(),
              _buildFormDetailsActions(),
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
              [S.current.externId, form.externFormId],
              [S.current.internId, form.internFormId],
              [S.current.vinculationId, form.vinculationFormId ?? ''],
            ],
          ),
          _buildDetaislRow(
            details: [
              [S.current.creatorUserId, form.creatorUserId],
              [S.current.coordinatorId, form.coordinatorsId.join('-')],
            ],
          ),
          _buildDetaislRow(
            details: [
              [S.current.priority, form.priority.enumString],
              ['Status', form.status.enumString]
            ],
          ),
          _buildDetaislRow(
            details: [
              [S.current.creationDate, controller.creationDate],
              [S.current.expirationDate, controller.expirationDate],
            ],
          ),
          _buildDetaislRow(
            details: [
              [S.current.street, form.street],
              [S.current.number, form.number.toString()],
            ],
          ),
          _buildDetaislRow(
            details: [
              [S.current.latitude, form.latitude.toString()],
              [S.current.longitude, form.longitude.toString()],
            ],
          ),
          _buildDetaislRow(
            details: [
              [S.current.startDate, S.current.startDate],
              [S.current.endDate, S.current.endDate]
            ],
          ),
          _buildFormDetail(
            S.current.description,
            form.description,
          ),
        ],
      ),
    ));
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
    double screenWidth = ScreenHelper.width(context);

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 12,
              shadowColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusMedium,
                ), // Rounded corners
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Iniciar',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.5,
                  fontSize: screenWidth < breakpointSmallMobile ? 12 : 16),
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.verticalSpaceMedium),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: AppDimensions.paddingMedium,
                  ),
                  elevation: 2,
                  backgroundColor: AppColors.red,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  'Cancelar Formulário',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        fontSize: screenWidth < breakpointSmallMobile ? 12 : 16,
                      ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: AppDimensions.paddingMedium,
                  ),
                  elevation: 2,
                  surfaceTintColor: Theme.of(context).colorScheme.secondary,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Text(
                  'Vincular Formulário',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                      height: 1.2,
                      fontSize: screenWidth < breakpointSmallMobile ? 12 : 16),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
