import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_responsive_dimensions.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double responsiveIconSize =
        ResponsiveDimensions.getResponsiveIconSize(context);
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            border: Border(
                top: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2.0))),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 2,
          elevation: 3,
          shadowColor: Theme.of(context).shadowColor,
          height: ScreenHelper.height(context) * 0.09,
          child: IconTheme(
            data: IconThemeData(
                size: responsiveIconSize,
                color: Theme.of(context).colorScheme.secondary),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBottomNavigationBarItem(
                    key: 'HomeIconButton',
                    icon: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    index: 0),
                _buildBottomNavigationBarItem(
                    key: 'PublicIconButton',
                    icon: Icon(
                      Icons.public,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    index: 1),
                const SizedBox(width: 48),
                _buildBottomNavigationBarItem(
                    key: 'AddIconButton',
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    index: 2),
                _buildBottomNavigationBarItem(
                    key: 'SettingsIconButton',
                    icon: Icon(
                      Icons.settings,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    index: 3),
              ],
            ),
          ),
        ));
  }

  IconButton _buildBottomNavigationBarItem(
      {required String key, required Icon icon, required int index}) {
    double responsiveIconSize =
        ResponsiveDimensions.getResponsiveIconSize(context);
    return IconButton(
      alignment: Alignment.center,
      iconSize: responsiveIconSize * 1.3,
      key: Key(key),
      icon: icon,
      color: _selectedIndex == index ? AppColors.black : AppColors.gray,
      onPressed: () => _onItemTapped(index),
    );
  }
}
