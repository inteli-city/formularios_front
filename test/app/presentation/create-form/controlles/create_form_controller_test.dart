import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/create-form/controlles/create_form_controller.dart';
import 'package:mockito/mockito.dart';

class Listener extends Mock {
  void call();
}

void main() {
  group('CreateFormController Tests', () {
    CreateFormController controller = CreateFormController();
    late Listener listener;

    setUp(() {
      listener = Listener();
      controller.addListener(listener.call);
    });

    test('Initial values are null', () {
      expect(controller.latitude, isNull);
      expect(controller.longitude, isNull);
      expect(controller.city, isNull);
      expect(controller.street, isNull);
      expect(controller.number, isNull);
    });

    test('setAddress updates values correctly', () {
      controller.setAdress(12.34, 56.78, 'City', 'Street', 123);

      expect(controller.latitude, 12.34);
      expect(controller.longitude, 56.78);
      expect(controller.city, 'City');
      expect(controller.street, 'Street');
      expect(controller.number, 123);
    });

    test('setAddress notifies listeners', () {
      controller.setAdress(12.34, 56.78, 'City', 'Street', 123);
      verify(listener()).called(1);
    });
  });
}
