import 'package:formularios_front/app/domain/enum/order_enum.dart';

class SortFormsController {
  OrderEnum? selectedOrder;

  void setSelectedOrder(OrderEnum? value) {
    selectedOrder = value;
  }
}
