import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class FormCard extends StatelessWidget {
  final FormEntity form;

  const FormCard({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardTheme.color,
      shape: Theme.of(context).cardTheme.shape,
      elevation: Theme.of(context).cardTheme.elevation,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              form.templateName,
              style: const TextStyle(
                fontSize: AppDimensions.fontMedium,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.verticalSpaceSmall),
            Text(
              form.street,
              style: TextStyle(
                fontSize: AppDimensions.fontMedium,
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(height: AppDimensions.verticalSpaceSmall),
            Text(
              form.expiration.toString(),
              style: TextStyle(
                fontSize: AppDimensions.fontMedium,
                color: AppColors.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
