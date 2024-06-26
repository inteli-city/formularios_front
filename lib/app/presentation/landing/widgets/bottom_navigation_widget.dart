import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index, String route) {
    setState(() {
      _selectedIndex = index;
      Modular.to.navigate('./$route');
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
            route: 'forms',
          ),
          _buildBottomNavigationBarItem(
            key: 'PublicIconButton',
            icon: Icons.public,
            index: 1,
            route: 'map',
          ),
          const SizedBox(width: 48),
          _buildBottomNavigationBarItem(
            key: 'AddIconButton',
            icon: Icons.add,
            index: 2,
            route: '',
          ),
          _buildBottomNavigationBarItem(
            key: 'SettingsIconButton',
            icon: Icons.settings,
            index: 3,
            route: 'profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(
      {required String key,
      required IconData icon,
      required int index,
      required String route}) {
    return IconButton(
      alignment: Alignment.center,
      key: Key(key),
      icon: Icon(
        icon,
        color: _selectedIndex == index
            ? Theme.of(context).colorScheme.primary
            : AppColors.gray,
        size: AppDimensions.iconLarge,
      ),
      color: Theme.of(context).colorScheme.primary,
      isSelected: _selectedIndex == index,
      onPressed: () => _onItemTapped(index, route),
    );
  }
}
