import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';

class DefaultOrderWidget extends StatelessWidget {
  final String defaultOrderTitle;
  const DefaultOrderWidget({super.key, required this.defaultOrderTitle});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.marginSmall, vertical: 0),
      elevation: Theme.of(context).cardTheme.elevation,
      shape: Theme.of(context).cardTheme.shape,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingMedium),
        child: Text(defaultOrderTitle,
            style: AppTextStyles.bodyText1.copyWith(color: AppColors.white)),
      ),
    );
  }
}
