import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/presentation/stores/providers/selected_filter_data_provider.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';

class FilterOrderDialogWidget extends StatelessWidget {
  final List<FormEntity> forms;
  const FilterOrderDialogWidget({
    super.key,
    required this.forms,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(AppDimensions.paddingSmall),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 0, horizontal: AppDimensions.paddingMedium),
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
              Text(
                'Filtrar :',
                textAlign: TextAlign.center,
                style: AppTextStyles.headline
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              _buildFilterSection(forms),
              Text(
                'Ordenar :',
                textAlign: TextAlign.center,
                style: AppTextStyles.headline
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              _buildOrderSection(),
              _buildFilterDialogActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterDialogActions(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.green),
      ),
      onPressed: () {
        handleConfirmFilter();
        Navigator.pop(context);
      },
      child: Text(
        'Confirmar',
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: AppColors.white),
      ),
    );
  }

  void handleConfirmFilter() {
    final selectedValues =
        injector.get<SelectedFilterDataProvider>().selectedValues;
    injector
        .get<FormUserProvider>()
        .filterAndOrderFormsByAttributes(selectedValues);
    injector
        .get<SelectedFilterDataProvider>()
        .updateSelectedValues(selectedValues);
  }

  Widget _buildDropDownDivider() {
    return const Divider(
      height: AppDimensions.verticalSpaceExtraLarge * 1.5,
    );
  }

  Widget _buildDropdownItem(
    String hintText,
    String attribute,
    List<String?> optionValues,
  ) {
    Map<String, String?> selectedValues =
        injector.get<SelectedFilterDataProvider>().selectedValues;

    List<DropdownMenuItem> dropdownItems = [
      const DropdownMenuItem(
        alignment: Alignment.center,
        value: null,
        child: Text(
          'Limpar Seleção',
        ),
      ),
    ];

    dropdownItems.addAll(optionValues.map((String? value) {
      return DropdownMenuItem(
        value: value,
        alignment: Alignment.center,
        child: Text(
          value ?? '',
          textAlign: TextAlign.center,
        ),
      );
    }));

    return DropdownButtonFormField(
      value: selectedValues[attribute],
      elevation: 5,
      isDense: true,
      iconSize: AppDimensions.iconLarge,
      isExpanded: true,
      items: dropdownItems,
      onChanged: (newValue) {
        selectedValues[attribute] = newValue;
      },
      decoration: InputDecoration(
        labelText: hintText,
        alignLabelWithHint: true,
      ),
    );
  }

  Widget _buildFilterSection(List<FormEntity?> forms) {
    final streets = forms.map((e) => e?.street).toSet().toList();
    final regions = forms.map((e) => e?.region).toSet().toList();
    final templates = forms.map((e) => e?.template).toSet().toList();
    final cities = forms.map((e) => e?.city).toSet().toList();
    final systems = forms.map((e) => e?.system).toSet().toList();

    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.paddingLarge,
        bottom: AppDimensions.paddingSmall,
      ),
      child: Column(
        children: [
          _buildDropdownItem('Tipo', 'template', templates),
          _buildDropDownDivider(),
          _buildDropdownItem('Rua', 'street', streets),
          _buildDropDownDivider(),
          _buildDropdownItem('Bairro', 'region', regions),
          _buildDropDownDivider(),
          _buildDropdownItem('Cidade', 'city', cities),
          _buildDropDownDivider(),
          _buildDropdownItem('Sistema de Origem', 'system', systems),
        ],
      ),
    );
  }

  Widget _buildOrderSection() {
    final orderDateValues =
        OrderDateEnum.values.map((e) => e.enumString).toList();
    final orderPriorityValues =
        OrderPriorityEnum.values.map((e) => e.enumString).toList();

    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.paddingLarge,
        bottom: AppDimensions.paddingSmall,
      ),
      child: Column(
        children: [
          _buildDropdownItem(
            'Data de Criação',
            "creationDate",
            orderDateValues,
          ),
          _buildDropDownDivider(),
          _buildDropdownItem('Prioridade', "priority", orderPriorityValues),
        ],
      ),
    );
  }
}
