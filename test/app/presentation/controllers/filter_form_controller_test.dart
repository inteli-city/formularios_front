
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/controllers/filter_form_controller.dart';

void main() {
  group('FilterFormsController', () {
    late FilterFormsController controller;

    setUp(() {
      controller = FilterFormsController();
    });

    test('should initialize with all filters as null', () {
      expect(controller.filteredTemplate, isNull);
      expect(controller.filteredStreet, isNull);
      expect(controller.filteredCity, isNull);
      expect(controller.filteredSystem, isNull);
      expect(controller.filteredStatus, isNull);
    });

    test('setTemplate should update filteredTemplate', () {
      controller.setTemplate('template1');
      expect(controller.filteredTemplate, 'template1');
    });

    test('setStreet should update filteredStreet', () {
      controller.setStreet('street1');
      expect(controller.filteredStreet, 'street1');
    });

    test('setCity should update filteredCity', () {
      controller.setCity('city1');
      expect(controller.filteredCity, 'city1');
    });

    test('setSystem should update filteredSystem', () {
      controller.setSystem('system1');
      expect(controller.filteredSystem, 'system1');
    });

    test('setStatus should update filteredStatus', () {
      controller.setStatus(FormStatusEnum.CONCLUIDO);
      expect(controller.filteredStatus, FormStatusEnum.CONCLUIDO);
    });

    test('clearFilters should reset all filters to default', () {
      controller.setTemplate('template');
      controller.setStreet('street');
      controller.setCity('city');
      controller.setSystem('system');
      controller.setStatus(FormStatusEnum.NAO_INICIADO);
      
      controller.clearFilters();

      expect(controller.filteredTemplate, isNull);
      expect(controller.filteredStreet, isNull);
      expect(controller.filteredCity, isNull);
      expect(controller.filteredSystem, isNull);
    });

    test('activeFiltersAmount should return the correct number of active filters', () {
      expect(controller.activeFiltersAmount, 0);
      controller.setTemplate('template');
      expect(controller.activeFiltersAmount, 1);
      controller.setStreet('street');
      expect(controller.activeFiltersAmount, 2);
      controller.clearFilters();
      expect(controller.activeFiltersAmount, 0);
    });
  });
}
