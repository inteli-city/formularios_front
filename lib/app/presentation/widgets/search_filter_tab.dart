import 'package:flutter/material.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/widgets/dialogs/filter_order_dialog.dart';
import 'package:formularios_front/app/presentation/widgets/dialogs/sort_forms_dialog.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:badges/badges.dart' as badges;

class SearchFilterTab extends StatefulWidget {
  const SearchFilterTab({super.key});

  @override
  State<SearchFilterTab> createState() => _SearchFilterTabState();
}

class _SearchFilterTabState extends State<SearchFilterTab> {
  var filterController = injector.get<FilterFormsController>();
  var sortController = injector.get<SortFormsController>();
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
                  barrierDismissible: false,
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
      ),
    );
  }
}
