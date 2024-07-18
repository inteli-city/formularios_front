import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/data/repositories/template_repository_mock.dart';
import 'package:formularios_front/app/domain/entities/template_entity.dart';

void main() {
  group('TemplateRepositoryMock Tests', () {
    late TemplateRepositoryMock templateRepository;

    setUp(() {
      templateRepository = TemplateRepositoryMock();
    });

    test('getTemplates returns list of templates', () async {
      final result = await templateRepository.getTemplates();

      expect(result.isRight(), true);
      result.fold(
        (failure) =>
            fail('Expected a list of templates, got a failure instead'),
        (templates) {
          expect(templates, isA<List<TemplateEntity>>());
          expect(templates.length, 2);
          expect(templates[0].formTitle, 'Template Poda de Árvore');
          expect(templates[1].formTitle, 'Template Recape SP');
        },
      );
    });
  });
}
