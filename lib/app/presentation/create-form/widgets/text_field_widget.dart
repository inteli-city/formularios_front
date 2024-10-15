import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final bool isRequired;
  final bool isEnabled;
  final TextEditingController controller;
  const TextFieldWidget({
    super.key,
    required this.label,
    this.isRequired = true,
    required this.controller,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingMedium,
              vertical: AppDimensions.paddingSmall),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimensions.fontMedium),
                    ),
                    isRequired
                        ? Text(
                            '*',
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Container(),
                  ]),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMedium,
                  vertical: AppDimensions.paddingMedium,
                ),
                child: TextFormField(
                  controller: controller,
                  enabled: isEnabled,
                  validator: (value) {
                    if (isRequired && value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.only(bottom: 8),
                    hintText: 'Insira o texto',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
