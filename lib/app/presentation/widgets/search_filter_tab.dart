import 'package:flutter/material.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/widgets/filter_order_dialog_widget.dart';
import 'package:formularios_front/app/presentation/widgets/sort_modal_widget.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSearchField(context),
        badges.Badge(
          showBadge: badgeCount != 0,
          position: badges.BadgePosition.topEnd(),
          badgeStyle: badges.BadgeStyle(
              badgeColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.all(AppDimensions.paddingSmall * 0.8)),
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
                      return const FilterOrderDialogWidget();
                    },
                  ) ??
                  badgeCount;
              setState(() {
                badgeCount = newCount;
              });
            },
            icon: const Icon(Icons.filter_list_rounded),
          ),
        )
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppDimensions.radiusExtraLarge,
        ),
      ),
      borderSide: BorderSide(
        width: AppDimensions.borderMedium,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
    return SizedBox(
      width: ScreenHelper.width(context) * 0.8,
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            hintText: 'Pesquisar',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            enabledBorder: border,
            focusedBorder: border,
            border: border,
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppDimensions.verticalSpaceMedium,
              horizontal: AppDimensions.horizontalSpaceLarge,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            suffixIcon: IconButton(
              onPressed: () => showSortModal(context),
              icon: Icon(
                Icons.sort,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size,
              ),
            )),
      ),
    );
  }
}
