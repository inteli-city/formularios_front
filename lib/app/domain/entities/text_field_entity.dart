import 'package:formularios_front/app/domain/entities/field_entity.dart';

class TextFieldEntity extends FieldEntity {
  final String? value;

  TextFieldEntity({
    required super.name,
    required super.placeholder,
    super.regex,
    super.formatting,
    required super.isRequired,
    this.value,
  });
}
