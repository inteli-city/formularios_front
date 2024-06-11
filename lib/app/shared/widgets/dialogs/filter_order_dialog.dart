import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/home/controllers/filter_form_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';
import 'package:formularios_front/generated/l10n.dart';

class FilterOrderDialog extends StatefulWidget {
  const FilterOrderDialog({
    super.key,
  });

  @override
  State<FilterOrderDialog> createState() => _FilterOrderDialogState();
}

class _FilterOrderDialogState extends State<FilterOrderDialog> {
  var controller = Modular.get<FilterFormsController>();
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
                      S.current.filters,
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
                child: Text(S.current.clearFilters),
              ),
              _buildDropdownItem(
                hintText: 'Tipo',
                selectedValue: selectedType,
                optionValues: context.read<FormProvider>().templates,
                onChanged: (value) {
                  selectedType = value;
                },
              ),
              _buildDropdownItem(
                hintText: 'Rua',
                selectedValue: selectedStreet,
                optionValues: context.read<FormProvider>().streets,
                onChanged: (value) {
                  selectedStreet = value;
                },
              ),
              _buildDropdownItem(
                hintText: 'Cidade',
                selectedValue: selectedCity,
                optionValues: context.read<FormProvider>().cities,
                onChanged: (value) {
                  selectedCity = value;
                },
              ),
              _buildDropdownItem(
                hintText: 'Sistema de Origem',
                selectedValue: selectedSystem,
                optionValues: context.read<FormProvider>().systems,
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
                  context.read<FormProvider>().filterForms(
                        template: controller.filteredTemplate,
                        street: controller.filteredStreet,
                        city: controller.filteredCity,
                        system: controller.filteredSystem,
                        enumStatus: controller.filteredStatus,
                      );
                  Navigator.pop(context);
                },
                child: Text(
                  S.current.confirm,
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
    final TextEditingController textEditingController = TextEditingController();

    List<DropdownMenuItem<String?>> dropdownItems = optionValues
        .map(
          (value) => DropdownMenuItem<String?>(
            value: value,
            child: Text(
              value,
            ),
          ),
        )
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall),
      child: DropdownButtonFormField2<String?>(
        alignment: Alignment.center,
        value: selectedValue,
        isExpanded: true,
        items: dropdownItems,
        onChanged: onChanged,
        hint: Text(
          hintText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        buttonStyleData:
            const ButtonStyleData(height: 20, padding: EdgeInsets.zero),
        decoration: InputDecoration(
          isDense: true,
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
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 80,
          searchInnerWidget: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(AppDimensions.paddingSmall),
            padding: const EdgeInsets.all(AppDimensions.paddingSmall),
            child: TextFormField(
              maxLines: 1,
              controller: textEditingController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: AppDimensions.iconMedium,
                  color: Theme.of(context).colorScheme.primary,
                ),
                isDense: true,
                contentPadding:
                    const EdgeInsets.all(AppDimensions.paddingMedium),
                hintText: 'Buscar por $hintText',
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusSmall),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
          },
        ),
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}
