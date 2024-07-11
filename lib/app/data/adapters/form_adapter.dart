import 'package:formularios_front/app/data/adapters/information_field_adapter.dart';
import 'package:formularios_front/app/data/adapters/justificative_adapter.dart';
import 'package:formularios_front/app/data/adapters/section_adapter.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

class FormAdapter {
  static List<FormEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static FormEntity fromJson(Map<String, dynamic> json) {
    return FormEntity(
      formId: json['form_id'],
      creatorUserId: json['creator_user_id'],
      userId: json['user_id'],
      template: json['template'],
      area: json['area'],
      system: json['system'],
      street: json['street'],
      city: json['city'],
      number: json['number'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      region: json['region'],
      priority:
          PriorityEnum.values.firstWhere((e) => e.name == json['priority']),
      status: FormStatusEnum.values.firstWhere((e) => e.name == json['status']),
      expirationDate: json['expiration_date'],
      creationDate: json['creation_date'],
      sections: SectionAdapter.fromJsonList(json['sections']),
      comments: json['comments'],
      description: json['description'],
      conclusionDate: json['conclusion_date'],
      informationFields: json['information_fields'] != null
          ? InformationFieldAdapter.fromJsonList(json['information_fields'])
          : null,
      justificative: JustificativeAdapter.fromJson(json['justification']),
      startDate: json['start_date'],
      vinculationFormId: json['vinculation_form_id'],
      formTitle: json['form_title'],
      canVinculate: json['can_vinculate'],
    );
  }

  static Map<String, dynamic> toJson(FormEntity form) {
    return {
      'form_title': form.formTitle,
      'form_id': form.formId,
      'creator_user_id': form.creatorUserId,
      'user_id': form.userId,
      'template': form.template,
      'area': form.area,
      'system': form.system,
      'street': form.street,
      'city': form.city,
      'number': form.number,
      'latitude': form.latitude,
      'longitude': form.longitude,
      'region': form.region,
      'priority': form.priority.name,
      'status': form.status.name,
      'expiration_date': form.expirationDate,
      'creation_date': form.creationDate,
      'sections': form.sections.map((e) => SectionAdapter.toJson(e)).toList(),
      'comments': form.comments,
      'description': form.description,
      'conclusion_date': form.conclusionDate,
      'information_fields': form.informationFields == null
          ? null
          : form.informationFields!.isEmpty
              ? null
              : form.informationFields!
                  .map((e) => InformationFieldAdapter.toJson(e))
                  .toList(),
      'justification': JustificativeAdapter.toJson(form.justificative),
      'start_date': form.startDate,
      'vinculation_form_id': form.vinculationFormId,
      'can_vinculate': form.canVinculate,
    };
  }
}
