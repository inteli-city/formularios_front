import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/home/controllers/select_chip_controller.dart';

void main() {
  group('SelectChipController', () {
    late SelectChipController controller;

    setUp(() {
      controller = SelectChipController();
    });

    test('initial state of isSelectedList should be all false', () {
      expect(controller.isSelectedList, equals([false, false, false, false]));
    });

    test('getSelectedChip should return correct chip state', () {
      expect(controller.getSelectedChip(0), false);
      expect(controller.getSelectedChip(1), false);
      expect(controller.getSelectedChip(2), false);
      expect(controller.getSelectedChip(3), false);

      controller.setChipValue(0, true);
      expect(controller.getSelectedChip(0), true);
    });

    test('setChipValue should update the chip state correctly', () {
      expect(controller.isSelectedList[0], false);
      controller.setChipValue(0, true);
      expect(controller.isSelectedList[0], true);

      controller.setChipValue(0, false);
      expect(controller.isSelectedList[0], false);

      controller.setChipValue(2, true);
      expect(controller.isSelectedList[2], true);

      controller.setChipValue(3, true);
      expect(controller.isSelectedList[2], true);
    });

    test('setChipValue should not affect other chips', () {
      controller.setChipValue(1, true);
      expect(controller.isSelectedList[0], false);
      expect(controller.isSelectedList[1], true);
      expect(controller.isSelectedList[2], false);
    });
  });
}
