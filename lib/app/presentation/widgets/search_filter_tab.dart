import 'package:flutter/material.dart';
import 'package:formularios_front/app/presentation/stores/providers/filtered_data_provider.dart';
import 'package:formularios_front/app/presentation/widgets/filter_order_dialog_widget.dart';
import 'package:formularios_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:provider/provider.dart';

class SearchFilterTab extends StatefulWidget {
  const SearchFilterTab({super.key});

  @override
  State<SearchFilterTab> createState() => _SearchFilterTabState();
}

class _SearchFilterTabState extends State<SearchFilterTab> {
  @override
  Widget build(BuildContext context) {
    var forms = context.read<FilteredDataProvider>().filteredForms;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSearchField(context),
        IconButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) => FilterOrderDialogWidget(
                forms: forms,
              ),
            );
          },
          icon: const Icon(Icons.filter_list_rounded),
          iconSize: AppDimensions.iconMedium,
          color: Theme.of(context).colorScheme.primary,
        )
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppDimensions.radiusExtraLarge,
        ),
      ),
      borderSide: BorderSide(
        width: AppDimensions.borderMedium,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
    return SizedBox(
      width: ScreenHelper.width(context) * 0.8,
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: 'Pesquisar',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          enabledBorder: border,
          focusedBorder: border,
          border: border,
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppDimensions.verticalSpaceMedium,
            horizontal: AppDimensions.horizontalSpaceMedium,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: AppDimensions.iconMedium,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
