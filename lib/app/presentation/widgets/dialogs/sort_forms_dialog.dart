import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:formularios_front/app/presentation/controllers/sort_forms_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class SortFormsDialog extends StatefulWidget {
  const SortFormsDialog({super.key});

  @override
  State<SortFormsDialog> createState() => _SortFormsDialog();
}

class _SortFormsDialog extends State<SortFormsDialog> {
  var controller = Modular.get<SortFormsController>();
  @override
  Widget build(BuildContext context) {
    var formProvider = context.watch<FormUserProvider>();
    return Container(
      padding: const EdgeInsets.only(top: AppDimensions.paddingExtraLarge),
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (OrderEnum order in OrderEnum.values)
                RadioListTile<OrderEnum>(
                  shape: const StadiumBorder(),
                  title: Text(
                    order.enumString,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  activeColor: AppColors.primaryBlue,
                  value: order,
                  groupValue: controller.selectedOrder,
                  onChanged: (OrderEnum? value) {
                    setState(() {
                      controller.setSelectedOrder(value);
                    });
                  },
                ),
              Container(
                decoration: BoxDecoration(color: AppColors.primaryBlue),
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        vertical: AppDimensions.paddingMedium,
                      ),
                    ),
                    side: const MaterialStatePropertyAll(BorderSide.none),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryBlue),
                  ),
                  onPressed: () {
                    formProvider.orderForms(controller.selectedOrder);
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
