import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/justification_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/external/datasources/form_hive_local_datasource.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:formularios_front/app/data/adapters/form_adapter.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

import 'form_hive_local_datasource_test.mocks.dart';

@GenerateMocks([Box])
void main() {
  late FormHiveLocalDatasource datasource;
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    datasource = FormHiveLocalDatasource(mockBox);
  });

  group('FormHiveLocalDatasource', () {
    final form = FormEntity(
      formId: '123',
      creatorUserId: '456',
      userId: '789',
      template: 'template1',
      area: 'area1',
      system: 'system1',
      street: 'street1',
      city: 'city1',
      number: 0,
      latitude: 0,
      longitude: 0,
      region: 'region1',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.IN_PROGRESS,
      expirationDate: 0,
      creationDate: 0,
      sections: [
        SectionEntity(sectionId: '123', fields: [
          TextFieldEntity(
              placeholder: 'placeholder', key: 'key', isRequired: true)
        ])
      ],
      comments: 'comments',
      description: 'description',
      conclusionDate: 0,
      informationFields: [],
      justification: JustificationEntity(
          options: [
            JustificationOptionEntity(
                option: 'option', requiredImage: true, requiredText: true)
          ],
          selectedOption: null,
          justificationText: 'justificationText',
          justificationImage: 'justificationImage'),
      startDate: 0,
      vinculationFormId: '321',
      formTitle: 'title',
      canVinculate: true,
    );

    final updatedFormCopy = FormEntity(
      formId: '123',
      creatorUserId: '456',
      userId: '789',
      template: 'template1',
      area: 'area1',
      system: 'system1',
      street: 'street1',
      city: 'city1',
      number: 0,
      latitude: 0,
      longitude: 0,
      region: 'region1',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.CANCELED,
      expirationDate: 0,
      creationDate: 0,
      sections: [
        SectionEntity(sectionId: '123', fields: [
          TextFieldEntity(
              placeholder: 'placeholder', key: 'key', isRequired: true)
        ])
      ],
      comments: 'comments',
      description: 'description',
      conclusionDate: 0,
      informationFields: [],
      justification: JustificationEntity(
          options: [
            JustificationOptionEntity(
                option: 'option', requiredImage: true, requiredText: true)
          ],
          selectedOption: 'selectedOption',
          justificationText: 'justificationText',
          justificationImage: 'justificationImage'),
      startDate: 0,
      vinculationFormId: '321',
      formTitle: 'title',
      canVinculate: true,
    );

    test('deve salvar formulários', () async {
      final forms = [form];

      await datasource.saveForms(forms: forms);

      verify(mockBox.put(
              'forms', forms.map((e) => FormAdapter.toJson(e)).toList()))
          .called(1);
    });

    test('deve buscar formulários', () async {
      when(mockBox.get('forms')).thenReturn([FormAdapter.toJson(form)]);

      final result = await datasource.getForms();

      expect(result.length, 1);
      expect(result.first.formId, form.formId);
    });

    test('deve deletar formulário', () async {
      when(mockBox.get('forms')).thenReturn([FormAdapter.toJson(form)]);

      await datasource.deleteForm(formId: '123');

      verify(mockBox.put('forms', [])).called(1);
    });

    test('deve atualizar formulário', () async {
      when(mockBox.get('forms')).thenReturn([FormAdapter.toJson(form)]);

      await datasource.updateForm(form: updatedFormCopy);

      verify(mockBox.put('forms', [FormAdapter.toJson(updatedFormCopy)]))
          .called(1);
    });

    test('deve adicionar formularios', () async {
      when(mockBox.get('forms')).thenReturn([]);

      await datasource.addForm(form: form);

      verify(mockBox.put('forms', [FormAdapter.toJson(form)])).called(1);
    });

    test('deve cancelar formularios', () async {
      when(mockBox.get('forms')).thenReturn([FormAdapter.toJson(form)]);

      await datasource.cancelForm(
        formId: '123',
        justification: JustificationEntity(
          options: [
            JustificationOptionEntity(
                option: 'option', requiredImage: true, requiredText: true)
          ],
          selectedOption: 'option',
          justificationText: 'justificationText',
          justificationImage: 'justificationImage',
        ),
      );

      expect(mockBox.get('forms')[0]['justification']['selected_option'],
          'option');
    });
  });
}
