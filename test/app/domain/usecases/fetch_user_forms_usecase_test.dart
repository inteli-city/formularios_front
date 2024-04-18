import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';
import 'package:formularios_front/app/domain/usecases/fetch_user_forms_usecase.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_user_forms_usecase_test.mocks.dart';

@GenerateMocks([IFormRepository])
void main() {
  IFormRepository formRepository = MockIFormRepository();
  late IFetchUserFormsUsecase usecase;

  setUp(() {
    registerInstances();
    usecase = FetchUserFormsUsecase(repository: formRepository);
  });

  group('FetchUserFormsUsecase', () {
    test('should return a list of FormEntity', () async {
      when(formRepository.getUserForms(userId: '1'))
          .thenAnswer((_) async => Right([
                FormEntity(
                  idExternForm: 'idExternForm',
                  idInternForm: 'idInternForm',
                  idCreatorUser: 'idCreatorUser',
                  userId: 'userId',
                  idCoordinator: ['idCoordinator'],
                  idFormVinculation: 'idFormVinculation',
                  templateName: 'templateName',
                  area: 'area',
                  system: 'system',
                  street: 'street',
                  city: 'city',
                  number: 1,
                  lat: 1.0,
                  long: 1.0,
                  region: 'region',
                  generalDescription: 'generalDescription',
                  priority: PriorityEnum.HIGH,
                  status: FormStatusEnum.EM_ANDAMENTO,
                  expiration: 1,
                  dateCreation: 1,
                  dateStart: 1,
                  dateEnd: 1,
                  justification: 'justification',
                  comment: 'comment',
                  sections: [],
                ),
                FormEntity(
                  idExternForm: 'idExternForm',
                  idInternForm: 'idInternForm',
                  idCreatorUser: 'idCreatorUser',
                  userId: 'userId',
                  idCoordinator: ['idCoordinator'],
                  idFormVinculation: 'idFormVinculation',
                  templateName: 'templateName',
                  area: 'area',
                  system: 'system',
                  street: 'street',
                  city: 'city',
                  number: 1,
                  lat: 1.0,
                  long: 1.0,
                  region: 'region',
                  generalDescription: 'generalDescription',
                  priority: PriorityEnum.HIGH,
                  status: FormStatusEnum.EM_ANDAMENTO,
                  expiration: 1,
                  dateCreation: 1,
                  dateStart: 1,
                  dateEnd: 1,
                  justification: 'justification',
                  comment: 'comment',
                  sections: [],
                ),
              ]));
      var result = await usecase(userId: '1');
      expect(result.isRight(), true);
      expect(
        result.fold((l) => null, (forms) => forms),
        isA<List<FormEntity>>(),
      );
      expect(
        result.fold((l) => null, (forms) => forms.length),
        2,
      );
    });

    test('should return a Failure', () async {
      when(formRepository.getUserForms(userId: '1'))
          .thenAnswer((_) async => Left(Failure(message: '')));

      var result = await usecase(userId: '1');

      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (forms) => null),
        isA<Failure>(),
      );
    });
  });
}
