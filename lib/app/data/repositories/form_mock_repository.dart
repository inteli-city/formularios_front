import 'package:dartz/dartz.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';
import 'package:formularios_front/app/domain/failures/failures.dart';
import 'package:formularios_front/app/domain/repositories/form_repository.dart';

class FormMockRepository extends IFormRepository {
  List<FormEntity> formList = [
    FormEntity(
      idExternForm: '1',
      idInternForm: '1',
      idCreatorUser: '1',
      userId: '1',
      idCoordinator: ['idCoordinator'],
      idFormVinculation: null,
      templateName: 'Poda de Árvore',
      area: 'area',
      system: 'Gaia',
      street: 'Rua Samuel Morse 74',
      city: 'city',
      number: 1,
      lat: 1.0,
      long: 1.0,
      region: 'region',
      generalDescription: 'generalDescription',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.CONCLUIDO,
      expiration: 1,
      dateCreation: 1,
      dateStart: 1,
      dateEnd: 1,
      justification: 'justification',
      comment: 'comment',
      sections: [],
    ),
    FormEntity(
      idExternForm: '1',
      idInternForm: '1',
      idCreatorUser: '1',
      userId: '1',
      idCoordinator: ['idCoordinator'],
      idFormVinculation: null,
      templateName: 'Poda de Árvore 2',
      area: 'area',
      system: 'Gaia',
      street: 'Rua Samuel Morse 74',
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
      idExternForm: '1',
      idInternForm: '1',
      idCreatorUser: '1',
      userId: '1',
      idCoordinator: ['idCoordinator'],
      idFormVinculation: null,
      templateName: 'Poda de Árvore 3',
      area: 'area',
      system: 'Gaia',
      street: 'Rua Samuel Morse 74',
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
      idExternForm: '1',
      idInternForm: '1',
      idCreatorUser: '1',
      userId: '1',
      idCoordinator: ['idCoordinator'],
      idFormVinculation: null,
      templateName: 'Poda de Árvore 4',
      area: 'area',
      system: 'Gaia',
      street: 'Rua Samuel Morse 74',
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
      idExternForm: '2',
      idInternForm: '2',
      idCreatorUser: '2',
      userId: '1',
      idCoordinator: ['idCoordinator'],
      idFormVinculation: null,
      templateName: 'Poda de Árvore 5',
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
      idExternForm: '3',
      idInternForm: '3',
      idCreatorUser: '2',
      userId: '1',
      idCoordinator: ['idCoordinator'],
      idFormVinculation: null,
      templateName: 'Poda de Árvore 6',
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
      idExternForm: '4',
      idInternForm: '4',
      idCreatorUser: '4',
      userId: '2',
      idCoordinator: ['idCoordinator'],
      idFormVinculation: null,
      templateName: 'Inspeção de PV',
      area: 'area',
      system: 'JUNDIAI',
      street: 'street',
      city: 'city',
      number: 1,
      lat: 1.0,
      long: 1.0,
      region: 'region',
      generalDescription: 'generalDescription',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.NAO_INICIADO,
      expiration: 1,
      dateCreation: 1,
      dateStart: 1,
      dateEnd: 1,
      justification: 'justification',
      comment: 'comment',
      sections: [],
    ),
    FormEntity(
      idExternForm: '5',
      idInternForm: '5',
      idCreatorUser: '5',
      userId: '2',
      idCoordinator: ['idCoordinator'],
      idFormVinculation: null,
      templateName: 'PV',
      area: 'area',
      system: 'GAIA',
      street: 'street',
      city: 'city',
      number: 1,
      lat: 1.0,
      long: 1.0,
      region: 'region',
      generalDescription: 'generalDescription',
      priority: PriorityEnum.HIGH,
      status: FormStatusEnum.CONCLUIDO,
      expiration: 1,
      dateCreation: 1,
      dateStart: 1,
      dateEnd: 1,
      justification: 'justification',
      comment: 'comment',
      sections: [],
    ),
  ];

  @override
  Future<Either<Failure, List<FormEntity>>> getUserForms(
      {required String userId}) async {
    Future.delayed(const Duration(seconds: 1));

    return right(
      formList.where((element) => element.userId == userId).toList(),
    );
  }

  @override
  Future<Either<Failure, List<FormEntity>>> getFinishedUserForms(
      {required String userId}) async {
    Future.delayed(const Duration(seconds: 1));
    final userFormsList = formList.where((element) => element.userId == userId);
    final finishedUserFormsList = userFormsList
        .where((element) => element.status == FormStatusEnum.CONCLUIDO);

    return right(
      finishedUserFormsList.toList(),
    );
  }

  @override
  Future<Either<Failure, List<FormEntity>>> getNotInitalizedUserForms(
      {required String userId}) async {
    Future.delayed(const Duration(seconds: 1));
    final userFormsList = formList.where((element) => element.userId == userId);
    final notInitializedUserFormsList = userFormsList
        .where((element) => element.status == FormStatusEnum.NAO_INICIADO);

    return right(
      notInitializedUserFormsList.toList(),
    );
  }

  @override
  Future<Either<Failure, List<FormEntity>>> getInProgressUserForms(
      {required String userId}) async {
    Future.delayed(const Duration(seconds: 1));
    final userFormsList = formList.where((element) => element.userId == userId);
    final inProgressUserFormsList = userFormsList
        .where((element) => element.status == FormStatusEnum.EM_ANDAMENTO);

    return right(
      inProgressUserFormsList.toList(),
    );
  }
}
