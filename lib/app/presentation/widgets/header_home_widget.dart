import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/widgets/dialogs/filter_order_dialog.dart';
import 'package:formularios_front/app/presentation/widgets/dialogs/sort_forms_dialog.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:badges/badges.dart' as badges;
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';

class HeaderHomeWidget extends StatefulWidget {
  const HeaderHomeWidget({super.key});

  @override
  State<HeaderHomeWidget> createState() => _HeaderHomeWidgetState();
}

class _HeaderHomeWidgetState extends State<HeaderHomeWidget> {
  final List<bool> _isSelectedList = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenHelper.height(context) * 0.15,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                FormStatusEnum.values.length,
                (index) => _choiceChip(index, FormStatusEnum.values[index]),
              ),
            ),
            _buildSearchFilterTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchFilterTab() {
    var filterController = injector.get<FilterFormsController>();
    var sortController = injector.get<SortFormsController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
          ),
          onPressed: () async {
            await showModalBottomSheet(
              useRootNavigator: true,
              context: context,
              builder: (context) => const SortFormsDialog(),
            );
            setState(() {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: AppDimensions.paddingSmall),
                child: Text(
                  sortController.selectedOrder != null
                      ? sortController.selectedOrder!.enumString
                      : 'Ordenar',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: AppDimensions.paddingMedium,
        ),
        badges.Badge(
          showBadge: filterController.activeFiltersAmount != 0,
          position: badges.BadgePosition.topEnd(),
          badgeStyle: badges.BadgeStyle(
            badgeColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(
              AppDimensions.paddingSmall * 0.8,
            ),
          ),
          badgeContent: Text(
            filterController.activeFiltersAmount.toString(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          child: IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return const FilterOrderDialog();
                },
              );
              setState(() {});
            },
            icon: const Icon(Icons.filter_list),
          ),
        )
      ],
    );
  }

  Widget _choiceChip(int index, FormStatusEnum statusEnum) {
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
        horizontal: AppDimensions.paddingSmall,
        vertical: AppDimensions.paddingMedium,
      ),
      elevation: 5,
      pressElevation: 5,
      shadowColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: AppDimensions.borderMedium,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusExtraLarge),
      ),
    );
  }
}
