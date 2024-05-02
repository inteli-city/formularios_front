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
  var controller = injector.get<FilterFormsController>();
  String? selectedType;
  String? selectedStreet;
  String? selectedCity;
  String? selectedSystem;

  @override
  void initState() {
    super.initState();
    selectedType = controller.filteredTemplate;
    selectedStreet = controller.filteredStreet;
    selectedCity = controller.filteredCity;
    selectedSystem = controller.filteredSystem;
  }

  void clearSelections() {
    selectedType = null;
    selectedStreet = null;
    selectedCity = null;
    selectedSystem = null;
  }

  void setFilterValues() {
    controller.setTemplate(selectedType);
    controller.setStreet(selectedStreet);
    controller.setCity(selectedCity);
    controller.setSystem(selectedSystem);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(
        AppDimensions.paddingSmall,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppDimensions.paddingMedium,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                    child: Text(
                      'Filtros',
                      style: AppTextStyles.display.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    clearSelections();
                  });
                },
                child: const Text('Limpar Filtros'),
              ),
              _buildDropdownItem(
                hintText: 'Tipo',
                selectedValue: selectedType,
                optionValues: context.read<FormUserProvider>().templates,
                onChanged: (value) {
                  selectedType = value;
                },
              ),
              _buildDropdownItem(
                hintText: 'Rua',
                selectedValue: selectedStreet,
                optionValues: context.read<FormUserProvider>().streets,
                onChanged: (value) {
                  selectedStreet = value;
                },
              ),
              _buildDropdownItem(
                hintText: 'Cidade',
                selectedValue: selectedCity,
                optionValues: context.read<FormUserProvider>().cities,
                onChanged: (value) {
                  selectedCity = value;
                },
              ),
              _buildDropdownItem(
                hintText: 'Sistema de Origem',
                selectedValue: selectedSystem,
                optionValues: context.read<FormUserProvider>().systems,
                onChanged: (value) {
                  selectedSystem = value;
                },
              ),
              const SizedBox(height: AppDimensions.paddingMedium),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  setFilterValues();
                  context.read<FormUserProvider>().filterForms(
                        template: controller.filteredTemplate,
                        street: controller.filteredStreet,
                        city: controller.filteredCity,
                        system: controller.filteredSystem,
                      );
                  Navigator.pop(context);
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
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall),
      child: DropdownButtonFormField<String?>(
        value: selectedValue,
        elevation: 5,
        focusColor: AppColors.white,
        items: dropdownItems,
        onChanged: onChanged,
        style: AppTextStyles.titleMedium,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle:
              AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
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
}
