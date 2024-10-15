import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/presentation/form/stores/single_form_provider.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'single_form_provider_test.mocks.dart';

@GenerateMocks([FormsProvider, FormEntity])
void main() {
  late FormEntity mockEntity;
  late SingleFormProvider singleFormProvider;
  late MockFormsProvider mockProvider;

  mockProvider = MockFormsProvider();
  Modular.bindModule(AppModule());
  Modular.bindModule(HomeModule());

  group('Single Form Provider Test', () {
    setUp(() {
      Modular.replaceInstance<FormsProvider>(mockProvider);

      mockEntity = MockFormEntity();
      singleFormProvider = SingleFormProvider(
        mockProvider,
        form: mockEntity,
      );

      when(mockEntity.creationDate).thenReturn(1622563200000);
      when(mockEntity.formId).thenReturn('externForm1');
      when(mockEntity.expirationDate).thenReturn(1622649600000);
      when(mockEntity.sections).thenReturn([
        SectionEntity(sectionId: 'section1', fields: [
          TextFieldEntity(
            placeholder: 'placeholder',
            key: 'key1',
            isRequired: true,
          )
        ])
      ]);
      when(mockProvider.getFormByExternId(mockEntity.formId))
          .thenReturn(mockEntity);
    });

    test('Should have correct creationDate format', () {
      expect(singleFormProvider.creationDate, '01/06/2021 16:00:00');
    });

    test('Should have correct expirationDate format', () {
      expect(singleFormProvider.expirationDate, '02/06/2021 16:00:00');
    });

    test('should set form is loading', () {
      singleFormProvider.setIsFormStateLoading(true);

      expect(singleFormProvider.isFormStateLoading, true);
    });

    test('Should set form status ', () {
      when(mockEntity.status).thenReturn(FormStatusEnum.CANCELED);
      singleFormProvider.setFormStatus(FormStatusEnum.CANCELED);

      expect(singleFormProvider.form.status, FormStatusEnum.CANCELED);
    });

    test('Should set sending form', () {
      singleFormProvider.setIsFormStateLoading(true);
      expect(singleFormProvider.isFormStateLoading, true);
    });

    test('Should set field value', () {
      singleFormProvider.setFieldValue('section1', 'key1', 'value1');
      expect(singleFormProvider.getFieldValue('section1', 'key1'), 'value1');
    });

    test('Should return field value', () {
      singleFormProvider.setFieldValue('section1', 'key1', 'value1');

      expect(singleFormProvider.getFieldValue('section1', 'key1'), 'value1');
    });

    test('Should send form', () async {
      when(mockProvider.sendForm(
        formId: mockEntity.formId,
        sections: mockEntity.sections,
      )).thenAnswer((_) async => mockEntity);

      await singleFormProvider.sendForm();

      expect(singleFormProvider.isFormStateLoading, false);
    });

    test('Should save form', () async {
      when(mockProvider.saveForm(
        form: mockEntity,
      )).thenAnswer((_) async => mockEntity);

      await singleFormProvider.saveForm();

      expect(singleFormProvider.isFormStateLoading, false);
    });

    test('Should update form status', () async {
      when(mockEntity.status).thenReturn(FormStatusEnum.CANCELED);
      when(mockProvider.updateFormStatus(
              formId: 'externForm1', status: FormStatusEnum.CANCELED))
          .thenAnswer((_) async => mockEntity);

      await singleFormProvider.updateFormStatus(
          status: FormStatusEnum.CANCELED);
      expect(singleFormProvider.form.status, FormStatusEnum.CANCELED);
    });
  });
}
