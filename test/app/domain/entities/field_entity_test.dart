import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/field_entity.dart';

void main() {
  test('Field Entity Test', () {
    final FieldEntity fieldEntity0 = FieldEntity(
        name: 'field', placeholder: 'placeholder', isRequired: true);

    expect(fieldEntity0.name, 'field');
    expect(fieldEntity0.placeholder, 'placeholder');
    expect(fieldEntity0.isRequired, true);
   
  });
}
