import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';
import 'package:formularios_front/app/domain/enum/field_type_enum.dart';

void main() {
  test('should return text field entity', () {
    final textFieldEntity = TextFieldEntity(
      fieldType: FieldTypeEnum.TEXT_FIELD,
      placeholder: 'Placeholder Campo',
      isRequired: true,
      regex: 'regex',
      formatting: 'formatting',
      key: 'key',
    );

    expect(textFieldEntity.fieldType, FieldTypeEnum.TEXT_FIELD);
    expect(textFieldEntity.placeholder, 'Placeholder Campo');
    expect(textFieldEntity.regex, 'regex');
    expect(textFieldEntity.formatting, 'formatting');
    expect(textFieldEntity.isRequired, true);
    expect(textFieldEntity.key, 'key');
  });
}
