import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

void main() {
  test('Form Entity Test', () {
    final form = FormEntity(
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
    );

    expect(form.idExternForm, 'idExternForm');
    expect(form.idInternForm, 'idInternForm');
    expect(form.idCreatorUser, 'idCreatorUser');
    expect(form.userId, 'userId');
    expect(form.idCoordinator, ['idCoordinator']);
    expect(form.idFormVinculation, 'idFormVinculation');
    expect(form.templateName, 'templateName');
    expect(form.area, 'area');
    expect(form.system, 'system');
    expect(form.street, 'street');
    expect(form.city, 'city');
    expect(form.number, 1);
    expect(form.lat, 1.0);
    expect(form.long, 1.0);
    expect(form.region, 'region');
    expect(form.generalDescription, 'generalDescription');
    expect(form.priority, PriorityEnum.HIGH);
    expect(form.status, FormStatusEnum.EM_ANDAMENTO);
    expect(form.expiration, 1);
    expect(form.dateCreation, 1);
    expect(form.dateStart, 1);
    expect(form.dateEnd, 1);
    expect(form.justification, 'justification');
    expect(form.comment, 'comment');
  });
}
