import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/presentation/form/controllers/form_controller.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'form_details_controller_test.mocks.dart';

@GenerateMocks([FormUserProvider, FormEntity])
void main() {
  late FormEntity mockEntity;
  late FormController controller;

  MockFormUserProvider mockProvider = MockFormUserProvider();
  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());
  Modular.replaceInstance<FormUserProvider>(mockProvider);

  group('Form Details Controller Test', () {
    setUp(() {
      mockEntity = MockFormEntity();
      when(mockEntity.creationDate).thenReturn(1622563200000);
      when(mockEntity.formId).thenReturn('externForm1');
      when(mockEntity.expirationDate).thenReturn(1622649600000);
      when(mockEntity.sections).thenReturn([]);
      when(mockProvider.getFormByExternId(any)).thenReturn(mockEntity);
      controller = FormController(formId: mockEntity.formId);
      
    });

    test('Should have correct creationDate format', () {
      expect(controller.creationDate, '01/06/2021 16:00:00');
    });

    test('Should have correct expirationDate format', () {
      expect(controller.expirationDate, '02/06/2021 16:00:00');
    });
  });
}
