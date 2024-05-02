import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';
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
    return SizedBox(
      height: ScreenHelper.height(context) * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          FormStatusEnum.values.length,
          (index) => _choiceChip(index, FormStatusEnum.values[index]),
        ),
      ),
    );
  }

  Widget _choiceChip(int index, FormStatusEnum statusEnum) {
    var filterController = injector.get<FilterFormsController>();
    return ChoiceChip(
      labelPadding: EdgeInsets.zero,
      label: SizedBox(
        width: ScreenHelper.width(context) * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              statusEnum.enumString,
              style: AppTextStyles.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                color: _isSelectedList[index]
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              style: AppTextStyles.titleMedium.copyWith(
                color: _isSelectedList[index]
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
              '(${injector.get<FormUserProvider>().getFormsCountByStatus(statusEnum)})',
            ),
          ],
        ),
      ),
      selected: _isSelectedList[index],
      onSelected: (bool selected) {
        setState(() {
          for (int i = 0; i < _isSelectedList.length; i++) {
            _isSelectedList[i] = (i == index && selected);
          }
          print(statusEnum);
          filterController.setStatus(selected ? statusEnum : null);
          injector.get<FormUserProvider>().filterForms(
                city: filterController.filteredCity,
                enumStatus: filterController.filteredStatus,
                street: filterController.filteredStreet,
                system: filterController.filteredSystem,
                template: filterController.filteredTemplate,
              );
        });
      },
      selectedColor: Theme.of(context).colorScheme.primary,
      checkmarkColor: AppColors.green,
      showCheckmark: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingSmall,
        vertical: AppDimensions.paddingMedium,
      ),
      elevation: 5,
      pressElevation: 5,
      shadowColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusExtraLarge),
      ),
    );
  }
}
