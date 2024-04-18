import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

void main() {
  IFormRepository formRepository = MockFormRepository();

  group('FetchUserFormsUsecase', () {
    test('should return a list of FormEntity', () async {
      var result = await formRepository.getUserForms();

      expect(result.isRight(), true);
      expect(
        result.fold((l) => null, (forms) => forms),
        isA<List<FormEntity>>(),
      );
    });

    test('should return a Failure', () async {
      when(formRepository.getUserForms()).thenAnswer((_) async => Left(Failure()));
      var result = await formRepository.getUserForms();

      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (forms) => null),
        isA<Failure>(),
      );
    });
  });
}
