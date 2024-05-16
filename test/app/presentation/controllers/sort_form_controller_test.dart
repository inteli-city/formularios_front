import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/enum/order_enum.dart';
import 'package:formularios_front/app/presentation/controllers/sort_forms_controller.dart';

void main() {
  late SortFormsController mockController;
  setUp(() {
    mockController = SortFormsController();
  });

  test('should return null when setSelectedOrder is called with null', () {
    mockController.setSelectedOrder(null);
    expect(mockController.selectedOrder, null);
  });

  test(
      'should return an orderEnum value when setSelectedOrder is called with a value',
      () {
    mockController.setSelectedOrder(OrderEnum.MAIS_ANTIGO);
    expect(mockController.selectedOrder, OrderEnum.MAIS_ANTIGO);
  });
}
