import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/presentation/states/form_user_state.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/helpers/utils/breakpoints.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:intl/intl.dart';

class FormDetailsPage extends StatefulWidget {
  final String externFormId;
  const FormDetailsPage({super.key, required this.externFormId});

  @override
  State<FormDetailsPage> createState() => FormDetailsPageState();
}

class FormDetailsPageState extends State<FormDetailsPage> {
  late FormUserState state;
  late FormEntity form;

  @override
  void initState() {
    super.initState();
    state = Modular.get<FormUserProvider>().state;
    form = (state as FormUserSuccessState)
        .forms
        .firstWhere((form) => form.externFormId == widget.externFormId);
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${form.system} - ${form.template}',
                  style: Theme.of(context).textTheme.displayLarge),
              IconButton(
                onPressed: () => Modular.to.navigate('/home/forms'),
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.primary,
                ),
                iconSize: AppDimensions.iconMedium,
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormDetail(
                        S.current.externId,
                        form.externFormId,
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 2,
                      ),
                      _buildFormDetail(
                        S.current.internId,
                        form.internFormId,
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 2,
                      ),
                      _buildFormDetail(
                        S.current.vinculationId,
                        form.vinculationFormId,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormDetail(
                        S.current.creatorUserId,
                        form.creatorUserId.toString(),
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 2,
                      ),
                      _buildFormDetail(S.current.coordinatorId,
                          form.coordinatorsId.join('\n')),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormDetail(
                        S.current.priority,
                        form.priority.enumString,
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 4,
                      ),
                      _buildFormDetail(
                        'Status',
                        form.status.enumString,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormDetail(
                        S.current.creationDate,
                        creationDate,
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 2,
                      ),
                      _buildFormDetail(
                        S.current.expirationDate,
                        expirationDate,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormDetail(
                        S.current.street,
                        form.street,
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 2,
                      ),
                      _buildFormDetail(
                        S.current.number,
                        form.number.toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormDetail(
                        S.current.latitude,
                        form.latitude.toString(),
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 4,
                      ),
                      _buildFormDetail(
                        S.current.longitude,
                        form.longitude.toString(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormDetail(
                        S.current.startDate,
                        form.startDate.toString(),
                      ),
                      const SizedBox(
                        width: AppDimensions.horizontalSpaceExtraLarge * 4,
                      ),
                      _buildFormDetail(
                        S.current.endDate,
                        form.endDate.toString(),
                      ),
                    ],
                  ),
                  _buildFormDetail(
                    S.current.description,
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
    double screenWidth = ScreenHelper.width(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
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
