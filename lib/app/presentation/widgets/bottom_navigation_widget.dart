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
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavigationBarItem(
              icon: const Icon(
                Icons.abc,
                size: AppDimensions.iconLarge,
              ),
              index: 0),
          _buildBottomNavigationBarItem(
              icon: const Icon(
                Icons.abc,
                size: AppDimensions.iconLarge,
              ),
              index: 1),
          const SizedBox(width: 48),
          _buildBottomNavigationBarItem(
              icon: const Icon(Icons.abc, size: AppDimensions.iconLarge),
              index: 2),
          _buildBottomNavigationBarItem(
              icon: const Icon(Icons.abc, size: AppDimensions.iconLarge),
              index: 3),
        ],
      ),
    );
  }

  IconButton _buildBottomNavigationBarItem(
      {required Icon icon, required int index}) {
    return IconButton(
      icon: icon,
      color: _selectedIndex == index ? AppColors.black : AppColors.gray,
      onPressed: () => _onItemTapped(index),
    );
  }
}
