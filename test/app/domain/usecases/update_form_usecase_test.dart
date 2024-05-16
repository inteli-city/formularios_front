import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/app_module.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/usecases/update_form_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_user_forms_usecase_test.mocks.dart';

@GenerateMocks([IFormRepository])
void main() {
  Modular.bindModule(AppModule());
  IFormRepository formRepository = MockIFormRepository();
  late UpdateFormStatusUseCase usecase;
  usecase = InitiliazeUserFormStatusUseCase(repository: formRepository);

  group('InitializedUserFormStatus', () {
    late FormEntity form;
    setUp(() {
      form = FormEntity(
          externFormId: 'externFormId',
          internFormId: 'internFormId',
          creatorUserId: 'creatorUserId',
          userId: 'userId',
          coordinatorsId: ['coordinatorsId'],
          vinculationFormId: 'vinculationFormId',
          template: 'template',
          area: 'area',
          system: 'system',
          street: 'street',
          city: 'city',
          number: 1,
          latitude: 1.0,
          longitude: 1.0,
          region: 'region',
          description: 'description',
          priority: PriorityEnum.HIGH,
          status: FormStatusEnum.EM_ANDAMENTO,
          expirationDate: 1,
          creationDate: 1,
          startDate: 1,
          endDate: 1,
          justificative: 'justificative',
          comments: 'comments',
          sections: []);
    });

    test('should return a list of FormEntity', () async {
      when(formRepository.updateFormStatus(
              status: FormStatusEnum.EM_ANDAMENTO,
              externFormId: form.externFormId))
          .thenAnswer(
        (_) async => Right(form),
      );

      var result = await usecase(
          externFormId: form.externFormId, status: FormStatusEnum.EM_ANDAMENTO);

      expect(result.isRight(), true);

      expect(
        result.fold((l) => null, (form) => form),
        isA<FormEntity>(),
      );

      expect(
        result.fold((l) => null, (form) => form.status),
        FormStatusEnum.EM_ANDAMENTO,
      );
    });

    test('should return a Failure', () async {
      when(formRepository.updateFormStatus(
              externFormId: form.externFormId,
              status: FormStatusEnum.EM_ANDAMENTO))
          .thenAnswer((_) async => Left(Failure(message: '')));

      var result = await usecase(
          externFormId: form.externFormId, status: FormStatusEnum.EM_ANDAMENTO);

      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (form) => null),
        isA<Failure>(),
      );
    });
  });
}
