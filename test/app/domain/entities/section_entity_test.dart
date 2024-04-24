import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';

void main() {
  test('Section Entity Test', () {
    final FieldEntity fieldEntity0 = TextFieldEntity(
      fieldType: FieldTypeEnum.DATE_FIELD,
      placeholder: 'placeholder',
      isRequired: true,
      key: 'key',
    );
    final sectionFieldEntity = SectionEntity(
        sectionId: 'section-id',
        fields: [fieldEntity0]);

    expect(sectionFieldEntity.sectionId, 'section-id');
    expect(
        sectionFieldEntity.fields, [fieldEntity0]);
  });
}
