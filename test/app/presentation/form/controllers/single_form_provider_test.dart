import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../pages/form_details_page_test.mocks.dart';

@GenerateMocks([FormsProvider, FormEntity])
void main() {
  late FormEntity mockEntity;
  late FormsProvider mockProvider;
  late SingleFormProvider mockSingleFormProvider;

  mockProvider = MockFormsProvider();
  mockSingleFormProvider = MockSingleFormProvider();
  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());

  group('Single Form Provider Test', () {
    setUp(() {
      mockEntity = MockFormEntity();
      when(mockEntity.creationDate).thenReturn(1622563200000);
      when(mockEntity.formId).thenReturn('externForm1');
      when(mockEntity.expirationDate).thenReturn(1622649600000);
      when(mockEntity.sections).thenReturn([]);
      when(mockProvider.getFormByExternId(mockEntity.formId))
          .thenReturn(mockEntity);
      mockSingleFormProvider = MockSingleFormProvider();
      when(mockSingleFormProvider.creationDate)
          .thenReturn('01/06/2021 16:00:00');
      when(mockSingleFormProvider.expirationDate)
          .thenReturn('02/06/2021 16:00:00');
    });

    test('Should have correct creationDate format', () {
      expect(mockSingleFormProvider.creationDate, '01/06/2021 16:00:00');
    });

    test('Should have correct expirationDate format', () {
      expect(mockSingleFormProvider.expirationDate, '02/06/2021 16:00:00');
    });
  });
}
