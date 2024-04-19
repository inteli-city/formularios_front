import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';

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
    return BottomAppBar(
      height: ScreenHelper.height(context) * 0.09,
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBottomNavigationBarItem(
              key: 'HomeIconButton',
              icon: const Icon(
                Icons.home,
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
    );
  }

  IconButton _buildBottomNavigationBarItem(
      {required String key, required Icon icon, required int index}) {
    return IconButton(
      alignment: Alignment.center,
      key: Key(key),
      icon: icon,
      color: _selectedIndex == index ? AppColors.black : AppColors.gray,
      onPressed: () => _onItemTapped(index),
    );
  }
}
