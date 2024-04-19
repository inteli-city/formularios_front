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
        Icons.menu,
        color: Theme.of(context).colorScheme.primary,
      )
    ]);
  }

  Widget _buildSearchField(BuildContext context) {
    return SizedBox(
        width: ScreenHelper.width(context) * 0.8,
        child: TextField(
          textAlign: TextAlign.left,
          // strutStyle: StrutStyle(height: 10),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppDimensions.radiusMedium)),
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.paddingSmall,
                  horizontal: AppDimensions.paddingSmall),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_alt_sharp,
                    color: Theme.of(context).colorScheme.primary,
                  ))),
        ));
  }
}
