import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';

void main() {
  test('Section Entity Test', () {
    final FieldEntity fieldEntity0 = FieldEntity(
        name: 'field-0', placeholder: 'placeholder', isRequired: true);
    final FieldEntity fieldEntity1 = FieldEntity(
        name: 'field-1', placeholder: 'placeholder', isRequired: true);
    final FieldEntity fieldEntity2 = FieldEntity(
        name: 'field-2', placeholder: 'placeholder', isRequired: true);

    final sectionFieldEntity = SectionEntity(
        sectionId: 'section-id',
        fields: [fieldEntity0, fieldEntity1, fieldEntity2]);

    expect(sectionFieldEntity.sectionId, 'section-id');
    expect(
        sectionFieldEntity.fields, [fieldEntity0, fieldEntity1, fieldEntity2]);
  });
}
