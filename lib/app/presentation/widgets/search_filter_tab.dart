import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class SearchFilterTab extends StatefulWidget {
  const SearchFilterTab({super.key});

  @override
  State<SearchFilterTab> createState() => _SearchFilterTabState();
}

class _SearchFilterTabState extends State<SearchFilterTab> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _buildSearchField(context),
      Icon(
        Icons.filter_alt_sharp,
        size: AppDimensions.iconMedium,
        color: Theme.of(context).colorScheme.primary,
      )
    ]);
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
            horizontal: AppDimensions.horizontalSpaceMedium,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: AppDimensions.iconMedium,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
