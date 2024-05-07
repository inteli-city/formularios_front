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
  var controller = Modular.get<FormDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFormDetails(controller.form),
          _buildFormDetailsActions(),
        ],
      ),
    );
  }

  Widget _buildFormDetails(FormEntity form) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${form.system} - ${form.template}',
                style: Theme.of(context).textTheme.displayLarge),
            IconButton(
              onPressed: () => Modular.to.pop(),
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.primary,
              ),
              iconSize: AppDimensions.iconMedium,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildFormDetail(
                    S.current.externId,
                    form.externFormId,
                  ),
                ),
                Expanded(
                  child: _buildFormDetail(
                    S.current.internId,
                    form.internFormId,
                  ),
                ),
                Expanded(
                  child: _buildFormDetail(
                    S.current.vinculationId,
                    form.vinculationFormId,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildFormDetail(
                    S.current.creatorUserId,
                    form.creatorUserId.toString(),
                  ),
                ),
                Expanded(
                  child: _buildFormDetail(
                      S.current.coordinatorId, form.coordinatorsId.join('\n')),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildFormDetail(
                    S.current.priority,
                    form.priority.enumString,
                  ),
                ),
                Expanded(
                  child: _buildFormDetail(
                    'Status',
                    form.status.enumString,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildFormDetail(
                    S.current.creationDate,
                    controller.creationDate,
                  ),
                ),
                Expanded(
                  child: _buildFormDetail(
                    S.current.expirationDate,
                    controller.expirationDate,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildFormDetail(
                    S.current.street,
                    form.street,
                  ),
                ),
                Expanded(
                  child: _buildFormDetail(
                    S.current.number,
                    form.number.toString(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildFormDetail(
                    S.current.latitude,
                    form.latitude.toString(),
                  ),
                ),
                Expanded(
                  child: _buildFormDetail(
                    S.current.longitude,
                    form.longitude.toString(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildFormDetail(
                    S.current.startDate,
                    form.startDate.toString(),
                  ),
                ),
                Expanded(
                  child: _buildFormDetail(
                    S.current.endDate,
                    form.endDate.toString(),
                  ),
                ),
              ],
            ),
            _buildFormDetail(
              S.current.description,
              form.description,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormDetail(String attribute, String? value) {
    double screenWidth = ScreenHelper.width(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$attribute:',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth <= breakpointSmallMobile ? 10 : 12,
              ),
        ),
        Text(
          value ?? '',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: screenWidth <= breakpointSmallMobile ? 10 : 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        ),
      ],
    );
  }

  Widget _buildFormDetailsActions() {
    double screenWidth = ScreenHelper.width(context);
    double screenHeight = ScreenHelper.height(context);

    return SizedBox(
      width: screenWidth * 0.8,
      height: ScreenHelper.height(context) * 0.3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(AppColors.primaryBlue),
              ),
              child: Text(
                'Iniciar',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: screenWidth < breakpointSmallMobile ? 12 : 20),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight < breakpointMobileHeight
                ? AppDimensions.verticalSpaceSmall
                : AppDimensions.verticalSpaceLarge,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.red),
              ),
              child: Text(
                'Cancelar Formulário',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: screenWidth < breakpointSmallMobile ? 12 : 20),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight < breakpointMobileHeight
                ? AppDimensions.verticalSpaceSmall
                : AppDimensions.verticalSpaceLarge,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.secondary),
                side: MaterialStatePropertyAll(
                  BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              child: Text(
                'Vincular Formulário',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: screenWidth < breakpointSmallMobile ? 12 : 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
