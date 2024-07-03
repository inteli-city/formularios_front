import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/select_chip_controller.dart';
import 'package:formularios_front/app/presentation/home/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/shared/widgets/dialogs/filter_order_dialog.dart';
import 'package:formularios_front/app/shared/widgets/dialogs/sort_forms_dialog.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:badges/badges.dart' as badges;
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';

class FilterTabWidget extends StatefulWidget {
  const FilterTabWidget({super.key});

  @override
  State<FilterTabWidget> createState() => _FilterTabWidgetState();
}

class _FilterTabWidgetState extends State<FilterTabWidget> {
  FilterFormsController filterController = Modular.get<FilterFormsController>();
  SelectChipController selectChipController =
      Modular.get<SelectChipController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: ScreenHelper.height(context) * 0.1,
          child: ListView.separated(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppDimensions.paddingSmall * 0.5),
            separatorBuilder: (context, index) => const SizedBox(
              width: AppDimensions.horizontalSpaceSmall,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: FormStatusEnum.values.length,
            itemBuilder: (context, index) => ChoiceChip(
              labelPadding: EdgeInsets.zero,
              label: SizedBox(
                width: ScreenHelper.width(context) * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      FormStatusEnum.values[index].enumString,
                      style: AppTextStyles.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: selectChipController.getSelectedChip(index)
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      style: AppTextStyles.titleMedium.copyWith(
                        color: selectChipController.getSelectedChip(index)
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                      '(${context.read<FormsProvider>().getFormsCountByStatus(FormStatusEnum.values[index])})',
                    ),
                  ],
                ),
              ),
              selected: selectChipController.getSelectedChip(index),
              onSelected: (bool selected) {
                setState(() {
                  for (int i = 0;
                      i < selectChipController.isSelectedList.length;
                      i++) {
                    bool value = (i == index && selected);
                    selectChipController.setChipValue(i, value);
                  }
                  filterController.setStatus(
                      selected ? FormStatusEnum.values[index] : null);
                  context.read<FormsProvider>().filterForms(
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
                borderRadius:
                    BorderRadius.circular(AppDimensions.radiusExtraLarge),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.paddingMedium),
        const SearchFilterTabWidget(),
      ],
    );
  }
}

class SearchFilterTabWidget extends StatefulWidget {
  const SearchFilterTabWidget({super.key});

  @override
  State<SearchFilterTabWidget> createState() => _SearchFilterTabWidgetState();
}

class _SearchFilterTabWidgetState extends State<SearchFilterTabWidget> {
  FilterFormsController filterController = Modular.get<FilterFormsController>();
  SortFormsController sortController = Modular.get<SortFormsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall),
      child: Row(
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
                        : S.of(context).sort,
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
          const Spacer(),
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
                  barrierDismissible: false,
                  builder: (context) {
                    return const FilterOrderDialog();
                  },
                );
                setState(() {});
              },
              icon: const Icon(Icons.filter_list),
            ),
          ),
          const SizedBox(
            width: AppDimensions.paddingMedium,
          ),
          Tooltip(
            padding: const EdgeInsets.all(AppDimensions.paddingSmall),
            showDuration: const Duration(seconds: 5),
            textAlign: TextAlign.center,
            message: S.of(context).priorityTooltip,
            triggerMode: TooltipTriggerMode.tap,
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.paddingSmall),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius:
                    BorderRadius.circular(AppDimensions.radiusExtraLarge),
              ),
              child: Icon(
                Icons.question_mark,
                color: Theme.of(context).colorScheme.secondary,
                size: AppDimensions.iconMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChoiceChipWidget extends StatefulWidget {
  final int index;
  final FormStatusEnum statusEnum;
  const ChoiceChipWidget(
      {super.key, required this.index, required this.statusEnum});

  @override
  State<ChoiceChipWidget> createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  FilterFormsController filterController = Modular.get<FilterFormsController>();
  SelectChipController selectChipController =
      Modular.get<SelectChipController>();

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      labelPadding: EdgeInsets.zero,
      label: SizedBox(
        width: ScreenHelper.width(context) * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.statusEnum.enumString,
              style: AppTextStyles.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                color: selectChipController.getSelectedChip(widget.index)
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              style: AppTextStyles.titleMedium.copyWith(
                color: selectChipController.getSelectedChip(widget.index)
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
              '(${context.read<FormsProvider>().getFormsCountByStatus(widget.statusEnum)})',
            ),
          ],
        ),
      ),
      selected: selectChipController.getSelectedChip(widget.index),
      onSelected: (bool selected) {
        setState(() {
          for (int i = 0; i < selectChipController.isSelectedList.length; i++) {
            bool value = (i == widget.index && selected);
            selectChipController.setChipValue(i, value);
          }
          filterController.setStatus(selected ? widget.statusEnum : null);
          context.read<FormsProvider>().filterForms(
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
