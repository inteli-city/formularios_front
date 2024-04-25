import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_responsive_dimensions.dart';

class SearchFilterTab extends StatefulWidget {
  const SearchFilterTab({super.key});

  @override
  State<SearchFilterTab> createState() => _SearchFilterTabState();
}

class _SearchFilterTabState extends State<SearchFilterTab> {
  @override
  Widget build(BuildContext context) {
    double responsiveIconSize =
        ResponsiveDimensions.getResponsiveIconSize(context);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _buildSearchField(context),
      Icon(
        Icons.menu,
        size: responsiveIconSize,
        color: Theme.of(context).colorScheme.primary,
      )
    ]);
  }

  Widget _buildSearchField(BuildContext context) {
    double responsivePadding =
        ResponsiveDimensions.getResponsivePadding(context);
    double responsiveIconSize =
        ResponsiveDimensions.getResponsiveIconSize(context);
    double responsiveBorderThickness =
        ResponsiveDimensions.getResponsiveBorderThickness(context);
    double responsiveRadius = ResponsiveDimensions.getResponsiveRadius(context);
    double responsiveFontSize =
        ResponsiveDimensions.getResponsiveFontSize(context);

    return SizedBox(
        width: ScreenHelper.width(context) * 0.8,
        child: TextField(
            style: TextStyle(
              fontSize: responsiveFontSize,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  gapPadding: responsivePadding,
                  borderRadius:
                      BorderRadius.all(Radius.circular(responsiveRadius)),
                  borderSide: BorderSide(
                      width: responsiveBorderThickness,
                      color: Theme.of(context).colorScheme.primary)),
              contentPadding: EdgeInsets.symmetric(
                  vertical: responsivePadding, horizontal: responsivePadding),
              prefixIcon: Icon(
                Icons.search_rounded,
                size: responsiveIconSize,
                color: Theme.of(context).colorScheme.primary,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  iconSize: responsiveIconSize,
                  icon: Icon(
                    Icons.filter_alt_sharp,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            )));
  }
}
