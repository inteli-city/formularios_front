import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';

class OrderTabSectionChips extends StatefulWidget {
  const OrderTabSectionChips({super.key});

  @override
  State<OrderTabSectionChips> createState() => _OrderTabSectionChipsState();
}

class _OrderTabSectionChipsState extends State<OrderTabSectionChips> {
  final List<bool> _isSelectedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = ScreenHelper.height(context);

    return SizedBox(
      height: screenHeight * 0.1,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        children: FormStatusEnum.values
            .map(
              (statusEnum) => _choiceChip(
                FormStatusEnum.values.indexOf(statusEnum),
                statusEnum,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _choiceChip(int index, FormStatusEnum statusEnum) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ChoiceChip(
        labelPadding: EdgeInsets.zero,
        label: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                style: AppTextStyles.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _isSelectedList[index]
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
                statusEnum.enumString,
              ),
              Text(
                style: AppTextStyles.titleMedium.copyWith(
                  color: _isSelectedList[index]
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
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
        selectedColor: Theme.of(context).colorScheme.primary,
        checkmarkColor: AppColors.green,
        showCheckmark: false,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingMedium,
        ),
        elevation: 3,
        pressElevation: 3,
        shadowColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusExtraLarge),
        ),
      ),
    );
  }
}
