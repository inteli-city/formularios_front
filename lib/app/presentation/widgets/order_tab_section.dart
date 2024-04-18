import 'package:flutter/material.dart';
import 'package:formularios_front/app/presentation/widgets/default_order_widget.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class OrderTabSection extends StatelessWidget {
  const OrderTabSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingSmall,
        vertical: AppDimensions.paddingMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultOrderWidget(
            defaultOrderTitle: 'Em andamento',
          ),
          DefaultOrderWidget(
            defaultOrderTitle: 'Não Iniciado',
          ),
          DefaultOrderWidget(
            defaultOrderTitle: 'Concluído',
          ),
        ],
      ),
    );
  }
}
