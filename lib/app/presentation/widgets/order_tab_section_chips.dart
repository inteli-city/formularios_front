import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/widgets/search_filter_tab.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_responsive_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';

class OrderTabSectionChips extends StatefulWidget {
  const OrderTabSectionChips({super.key});

  @override
  State<OrderTabSectionChips> createState() => _OrderTabSectionChipsState();
}

class _OrderTabSectionChipsState extends State<OrderTabSectionChips> {
  final List<String> filterValueList = [
    'Não Iniciado',
    'Em andamento',
    'Concluído',
  ];
  final List<bool> _isSelectedList = [false, false, false];
  @override
  Widget build(BuildContext context) {
    
    double responsiveVerticalSpace =
        ResponsiveDimensions.getResponsiveVerticalSpace(context);
    double responsiveHorizontalSpace =
        ResponsiveDimensions.getResponsiveHorizontalSpace(context);
    double responsivePadding =
        ResponsiveDimensions.getResponsivePadding(context);
    double screenHeight = ScreenHelper.height(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeight * 0.1,
          child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: responsivePadding),
              children: [
                _choiceChip(filterValueList[0], 0, FormStatusEnum.NAO_INICIADO,
                    context),
                SizedBox(
                  width: responsiveHorizontalSpace * 1.2,
                ),
                _choiceChip(filterValueList[1], 1, FormStatusEnum.EM_ANDAMENTO,
                    context),
                SizedBox(
                  width: responsiveHorizontalSpace * 1.2,
                ),
                _choiceChip(
                    filterValueList[2], 2, FormStatusEnum.CONCLUIDO, context),
              ]),
        ),
        SizedBox(
          height: responsiveVerticalSpace * 1.5,
        ),
        const SearchFilterTab(),
      ],
    );
  }

  Widget _choiceChip(String labelValue, int index, FormStatusEnum statusEnum,
      BuildContext context) {
    double responsivePadding =
        ResponsiveDimensions.getResponsivePadding(context);
    double responsiveFontSize =
        ResponsiveDimensions.getResponsiveFontSize(context);
    double responsiveBorderThickness =
        ResponsiveDimensions.getResponsiveBorderThickness(context);
    double responsiveRadius = ResponsiveDimensions.getResponsiveRadius(context);

    return ChoiceChip(
      labelPadding: EdgeInsets.zero,
      label: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              style: AppTextStyles.bodyText1.copyWith(
                  fontSize: responsiveFontSize,
                  fontWeight: FontWeight.bold,
                  color: _isSelectedList[index]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary),
              textAlign: TextAlign.center,
              labelValue,
            ),
            Text(
              style: AppTextStyles.subtitle1.copyWith(
                  fontSize: responsiveFontSize * 0.8,
                  color: _isSelectedList[index]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary),
              textAlign: TextAlign.center,
              '(0)',
            ),
          ]),
      selected: _isSelectedList[index],
      onSelected: (bool selected) {
        setState(() {
          for (int i = 0; i < _isSelectedList.length; i++) {
            _isSelectedList[i] = (i == index && selected);
          }
          if (selected) {
            injector.get<FormUserProvider>().filterFormsByStatus(statusEnum);
          } else {
            injector.get<FormUserProvider>().filterFormsByStatus(null);
          }
        });
      },
      selectedColor: Theme.of(context).colorScheme.secondary,
      checkmarkColor: AppColors.green,
      showCheckmark: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.symmetric(
          horizontal: responsivePadding * 2,
          vertical: AppDimensions.paddingMedium),
      elevation: 3,
      pressElevation: 3,
      shadowColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: responsiveBorderThickness,
              color: _isSelectedList[index]
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(responsiveRadius)),
    );
  }
}
