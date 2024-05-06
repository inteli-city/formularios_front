import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/presentation/states/form_user_state.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/helpers/utils/breakpoints.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:intl/intl.dart';

class FormDetailsPage extends StatefulWidget {
  final String externFormId;
  const FormDetailsPage({super.key, required this.externFormId});

  @override
  State<FormDetailsPage> createState() => FormDetailsPageState();
}

class FormDetailsPageState extends State<FormDetailsPage> {
  var state = Modular.get<FormUserProvider>().state;

  @override
  Widget build(BuildContext context) {
    FormEntity form = (state as FormUserSuccessState)
        .forms
        .firstWhere((form) => form.externFormId == widget.externFormId);

    return Container(
      constraints: BoxConstraints(
          maxHeight: ScreenHelper.height(context) * 0.8,
          maxWidth: ScreenHelper.width(context)),
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_buildFormDetails(form), _buildFormDetailsActions()],
      ),
    );
  }

  Widget _buildFormDetails(FormEntity form) {
    DateTime creationDateTime =
        DateTime.fromMillisecondsSinceEpoch(form.creationDate);
    String creationDate =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(creationDateTime);

    DateTime expirationDateTime =
        DateTime.fromMillisecondsSinceEpoch(form.expirationDate);
    String expirationDate =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(expirationDateTime);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${form.system} - ${form.template}',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      height: 1.0,
                    ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.primary,
                ),
                iconSize: AppDimensions.iconLarge,
              ),
            ],
          ),
        ),
        Container(
          height: ScreenHelper.height(context) * 0.6,
          width: ScreenHelper.width(context),
          padding: const EdgeInsets.all(AppDimensions.paddingSmall),
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(width: AppDimensions.borderThin),
                  bottom: BorderSide(width: AppDimensions.borderThin))),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: ScreenHelper.height(context) * 0.6,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFormDetail(
                        'ExternId',
                        form.externFormId,
                      ),
                      _buildFormDetail(
                        'InternId',
                        form.internFormId,
                      ),
                      _buildFormDetail(
                        'VinculationId',
                        form.vinculationFormId,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormDetail(
                        'CreatorUserId',
                        form.creatorUserId.toString(),
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 3,
                      ),
                      _buildFormDetail(
                          'CoordinatorId', form.coordinatorsId.join('\n')),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFormDetail(
                        'Priority',
                        form.priority.enumString,
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 3,
                      ),
                      _buildFormDetail(
                        'Status',
                        form.status.enumString,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFormDetail(
                        'CreationDate',
                        creationDate,
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 3,
                      ),
                      _buildFormDetail(
                        'ExpirationDate',
                        expirationDate,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFormDetail(
                        'Street',
                        form.street,
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 3,
                      ),
                      _buildFormDetail(
                        'Number',
                        form.number.toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFormDetail(
                        'Lat',
                        form.latitude.toString(),
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 3,
                      ),
                      _buildFormDetail(
                        'Long',
                        form.longitude.toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFormDetail(
                        'StartDate',
                        form.startDate.toString(),
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 3,
                      ),
                      _buildFormDetail(
                        'EndDate',
                        form.endDate.toString(),
                      ),
                    ],
                  ),
                  _buildFormDetail(
                    'Description',
                    form.description,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormDetail(String attribute, String? value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
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
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
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
      width: screenWidth,
      height: ScreenHelper.height(context) * 0.3,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                    Size(300, screenWidth < breakpointSmallMobile ? 15 : 40)),
                backgroundColor:
                    MaterialStatePropertyAll(AppColors.primaryBlue),
                shadowColor: MaterialStatePropertyAll(AppColors.white),
              ),
              child: Text(
                'Iniciar',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: screenWidth < breakpointSmallMobile ? 12 : 20),
              ),
            ),
            SizedBox(
              height: screenWidth < breakpointSmallMobileHeight
                  ? AppDimensions.verticalSpaceSmall
                  : AppDimensions.verticalSpaceLarge,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                      Size(300, screenWidth < breakpointSmallMobile ? 15 : 40)),
                  backgroundColor: MaterialStatePropertyAll(AppColors.red),
                  shadowColor: MaterialStatePropertyAll(AppColors.white)),
              child: Text(
                'Cancelar Formulário',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: screenWidth < breakpointSmallMobile ? 12 : 20),
              ),
            ),
            SizedBox(
              height: screenHeight < breakpointSmallMobileHeight
                  ? AppDimensions.verticalSpaceSmall
                  : AppDimensions.verticalSpaceLarge,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(
                      300, screenWidth < breakpointSmallMobile ? 15 : 40)),
                  surfaceTintColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.secondary),
                  side: MaterialStatePropertyAll(
                      BorderSide(color: AppColors.primaryBlue)),
                  shadowColor: MaterialStatePropertyAll(AppColors.white)),
              child: Text(
                'Vincular Formulário',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: screenWidth < breakpointSmallMobile ? 12 : 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
