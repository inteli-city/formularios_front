import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/text_field_entity.dart';

void main() {
  test('Text Field Entity Test', () {
    final textFieldEntity = TextFieldEntity(
        name: 'Nome Campo',
        placeholder: 'Placeholder Campo',
        isRequired: true,
        regex: 'regex',
        formatting: 'formatting');

    expect(textFieldEntity.name, 'Nome Campo');
    expect(textFieldEntity.placeholder, 'Placeholder Campo');
    expect(textFieldEntity.regex, 'regex');
    expect(textFieldEntity.formatting, 'formatting');
    expect(textFieldEntity.isRequired, true);
  });
}
