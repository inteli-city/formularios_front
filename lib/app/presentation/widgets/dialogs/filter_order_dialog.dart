import 'package:flutter/material.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';
import 'package:provider/provider.dart';

class FilterOrderDialog extends StatefulWidget {
  const FilterOrderDialog({
    super.key,
  });

  @override
  State<FilterOrderDialog> createState() => _FilterOrderDialogState();
}

class _FilterOrderDialogState extends State<FilterOrderDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(
        AppDimensions.paddingSmall,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: AppDimensions.paddingMedium,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    alignment: Alignment.center,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    iconSize: AppDimensions.iconLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Filtrar:',
                    style: AppTextStyles.headline
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        injector.get<FilterFormController>().clearFilters();
                      });
                    },
                    child: const Text('Limpar Filtros'),
                  ),
                ],
              ),
              _buildFilterSection(context),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.green),
                ),
                onPressed: () {
                  var controller = injector.get<FilterFormController>();
                  context.read<FormUserProvider>().filterForms(
                        template: controller.selectedTemplate,
                        street: controller.selectedStreet,
                        city: controller.selectedCity,
                        system: controller.selectedSystem,
                      );
                  Navigator.pop(context, controller.activeFiltersAmount);
                },
                child: Text(
                  'Confirmar',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem({
    required String hintText,
    required String? selectedValue,
    required Function(String?) onChanged,
    required List<String> optionValues,
  }) {
    List<DropdownMenuItem<String?>> dropdownItems = optionValues
        .map(
          (value) => DropdownMenuItem<String?>(
            value: value,
            child: Text(value),
          ),
        )
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: DropdownButtonFormField<String?>(
        value: selectedValue,
        elevation: 5,
        focusColor: AppColors.white,
        items: dropdownItems,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: hintText,
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryBlue,
              width: AppDimensions.borderMedium,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryBlue,
              width: AppDimensions.borderMedium,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context) {
    final formUserProvider = context.watch<FormUserProvider>();
    var controller = injector.get<FilterFormController>();
    return Column(
      children: [
        _buildDropdownItem(
          hintText: 'Tipo',
          selectedValue: controller.selectedTemplate,
          optionValues: formUserProvider.templates,
          onChanged: controller.setTemplate,
        ),
        _buildDropdownItem(
          hintText: 'Rua',
          selectedValue: controller.selectedStreet,
          optionValues: formUserProvider.streets,
          onChanged: controller.setStreet,
        ),
        _buildDropdownItem(
          hintText: 'Cidade',
          selectedValue: controller.selectedCity,
          optionValues: formUserProvider.cities,
          onChanged: controller.setCity,
        ),
        _buildDropdownItem(
          hintText: 'Sistema de Origem',
          selectedValue: controller.selectedSystem,
          optionValues: formUserProvider.systems,
          onChanged: controller.setSystem,
        ),
      ],
    );
  }
}
