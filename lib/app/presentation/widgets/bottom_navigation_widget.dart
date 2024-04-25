import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

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
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBottomNavigationBarItem(
            key: 'HomeIconButton',
            icon: Icons.home,
            index: 0,
          ),
          _buildBottomNavigationBarItem(
            key: 'PublicIconButton',
            icon: Icons.public,
            index: 1,
          ),
          const SizedBox(width: 48),
          _buildBottomNavigationBarItem(
            key: 'AddIconButton',
            icon: Icons.add,
            index: 2,
          ),
          _buildBottomNavigationBarItem(
            key: 'SettingsIconButton',
            icon: Icons.settings,
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(
      {required String key, required IconData icon, required int index}) {
    return IconButton(
      alignment: Alignment.center,
      key: Key(key),
      icon: Icon(
        icon,
        size: AppDimensions.iconLarge,
      ),
      color: AppColors.black,
      isSelected: _selectedIndex == index,
      onPressed: () => _onItemTapped(index),
    );
  }
}
