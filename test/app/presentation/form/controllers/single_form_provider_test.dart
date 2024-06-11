import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'single_form_provider_test.mocks.dart';

@GenerateMocks([SingleFormProvider, FormEntity])
void main() {
  late FormEntity mockEntity;
  late SingleFormProvider controller;

  MockSingleFormProvider mockProvider = MockSingleFormProvider();
  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());

  group('Form Details Controller Test', () {
    setUp(() {
      mockEntity = MockFormEntity();
      when(mockEntity.creationDate).thenReturn(1622563200000);
      when(mockEntity.formId).thenReturn('externForm1');
      when(mockEntity.expirationDate).thenReturn(1622649600000);
      when(mockEntity.sections).thenReturn([]);
      when(mockProvider.getFormByExternId(any)).thenReturn(mockEntity);
      controller = SingleFormProvider(mockProvider, form: mockEntity);
    });

    test('Should have correct creationDate format', () {
      expect(controller.creationDate, '01/06/2021 16:00:00');
    });

    test('Should have correct expirationDate format', () {
      expect(controller.expirationDate, '02/06/2021 16:00:00');
    });
  });
}
