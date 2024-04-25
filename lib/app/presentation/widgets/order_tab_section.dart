import 'package:flutter/material.dart';
import 'package:formularios_front/app/presentation/widgets/default_order_widget.dart';
import 'package:formularios_front/app/presentation/widgets/search_filter_tab.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class OrderTabSection extends StatelessWidget {
  OrderTabSection({super.key});
  final List<String> filterValueList = [
    'Não Iniciado',
    'Em andamento',
    'Concluído',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          child: LayoutBuilder(
            builder: (context, _) {
              return ListView.builder(
                itemCount: filterValueList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return DefaultOrderWidget(
                    keyValue: filterValueList[index],
                    defaultOrderTitle: filterValueList[index],
                    count: 0,
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(
          height: AppDimensions.verticalSpaceMedium,
        ),
        const SearchFilterTab(),
      ],
    );
  }
}
