import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:provider/provider.dart';

void showSortModal(BuildContext context) {
  OrderEnum? selectedOrder;

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      var formProvider = context.watch<FormUserProvider>();

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding:
                const EdgeInsets.only(top: AppDimensions.paddingExtraLarge),
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (OrderEnum order in OrderEnum.values)
                      RadioListTile<OrderEnum>(
                        shape: const StadiumBorder(),
                        title: Text(
                          order.enumString,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        activeColor: AppColors.primaryBlue,
                        value: order,
                        groupValue: selectedOrder,
                        onChanged: (OrderEnum? value) {
                          setState(() {
                            selectedOrder =
                                value; 
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
                                  vertical: AppDimensions.paddingMedium * 1.2)),
                          side: const MaterialStatePropertyAll(BorderSide.none),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryBlue),
                        ),
                        onPressed: () {
                          formProvider.orderForms(selectedOrder);
                          Navigator.pop(context, selectedOrder);
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
        },
      );
    },
  );
}
