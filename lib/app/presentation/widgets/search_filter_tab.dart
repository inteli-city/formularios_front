import 'package:flutter/material.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';
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
  var controller = injector.get<FilterFormController>();
  int badgeCount = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            surfaceTintColor: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => const SortFormsDialog(),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppDimensions.paddingSmall),
                child: Text('Ordenar'),
              ),
              Icon(
                Icons.arrow_drop_down,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: AppDimensions.paddingMedium,
        ),
        badges.Badge(
          showBadge: badgeCount != 0,
          position: badges.BadgePosition.topEnd(),
          badgeStyle: badges.BadgeStyle(
            badgeColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(
              AppDimensions.paddingSmall * 0.8,
            ),
          ),
          badgeContent: Text(
            '$badgeCount',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          child: IconButton(
            onPressed: () async {
              int newCount = await showDialog(
                    context: context,
                    builder: (context) {
                      return const FilterOrderDialog();
                    },
                  ) ??
                  badgeCount;
              setState(() {
                badgeCount = newCount;
              });
            },
            icon: const Icon(Icons.filter_alt),
          ),
        )
      ],
    );
  }
}
