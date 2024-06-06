import 'package:formularios_front/app/data/models/information_field_model.dart';
import 'package:formularios_front/app/data/models/justificative_model.dart';
import 'package:formularios_front/app/data/models/section_model.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

class FormModel extends FormEntity {
  FormModel({
    required super.formId,
    required super.creatorUserId,
    required super.userId,
    required super.template,
    required super.area,
    required super.system,
    required super.street,
    required super.city,
    required super.number,
    required super.latitude,
    required super.longitude,
    required super.region,
    required super.priority,
    required super.status,
    required super.expirationDate,
    required super.creationDate,
    required super.sections,
    super.comments,
    super.description,
    super.conclusionDate,
    super.informationFields,
    required super.justificative,
    super.startDate,
    super.vinculationFormId,
    required super.formTitle,
    required super.canVinculate,
  });

  factory FormModel.fromMap(Map<String, dynamic> json) {
    return FormModel(
      formId: json['formId'],
      creatorUserId: json['creatorUserId'],
      userId: json['userId'],
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
      expirationDate: json['expirationDate'],
      creationDate: json['creationDate'],
      sections: SectionModel.fromMaps(json['sections']),
      comments: json['comments'],
      description: json['description'],
      conclusionDate: json['conclusionDate'],
      informationFields: json['informationFields'] != null
          ? InformationFieldModel.fromMaps(json['informationFields'])
          : null,
      justificative: JustificativeModel.fromMap(json['justificative']),
      startDate: json['startDate'],
      vinculationFormId: json['vinculationFormId'],
      formTitle: json['formTitle'],
      canVinculate: json['canVinculate'],
    );
  }

  static List<FormModel> fromMaps(List array) {
    return array.map((e) => FormModel.fromMap(e)).toList();
  }

  factory FormModel.fromEntity(FormEntity entity) {
    return FormModel(
      formId: entity.formId,
      creatorUserId: entity.creatorUserId,
      userId: entity.userId,
      template: entity.template,
      area: entity.area,
      system: entity.system,
      street: entity.street,
      city: entity.city,
      number: entity.number,
      latitude: entity.latitude,
      longitude: entity.longitude,
      region: entity.region,
      priority: entity.priority,
      status: entity.status,
      expirationDate: entity.expirationDate,
      justificative: entity.justificative,
      creationDate: entity.creationDate,
      sections: entity.sections,
      formTitle: entity.formTitle,
      canVinculate: entity.canVinculate,
      comments: entity.comments,
      description: entity.description,
      conclusionDate: entity.conclusionDate,
      informationFields: entity.informationFields,
      startDate: entity.startDate,
      vinculationFormId: entity.vinculationFormId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'formId': formId,
      'creatorUserId': creatorUserId,
      'userId': userId,
      'template': template,
      'area': area,
      'system': system,
      'street': street,
      'city': city,
      'number': number,
      'latitude': latitude,
      'longitude': longitude,
      'region': region,
      'priority': priority.name,
      'status': status.name,
      'expirationDate': expirationDate,
      'creationDate': creationDate,
      'sections':
          sections.map((e) => SectionModel.fromEntity(e).toMap()).toList(),
      'comments': comments,
      'description': description,
      'conclusionDate': conclusionDate,
      'informationFields': informationFields
              ?.map((e) => InformationFieldModel.fromEntity(e).toMap())
              .toList() ??
          [],
      'justificative': JustificativeModel.fromEntity(justificative).toMap(),
      'startDate': startDate,
      'vinculationFormId': vinculationFormId,
      'formTitle': formTitle,
      'canVinculate': canVinculate,
    };
  }

  FormModel copyWith({
    String? formTitle,
    String? formId,
    String? creatorUserId,
    String? userId,
    String? vinculationFormId,
    String? template,
    String? area,
    String? system,
    String? street,
    String? city,
    int? number,
    double? latitude,
    double? longitude,
    String? region,
    String? description,
    PriorityEnum? priority,
    FormStatusEnum? status,
    int? expirationDate,
    int? creationDate,
    int? startDate,
    int? conclusionDate,
    JustificativeEntity? justificative,
    String? comments,
    List<SectionEntity>? sections,
    List<InformationFieldEntity>? informationFields,
    bool? canVinculate,
  }) {
    return FormModel(
      formTitle: formTitle ?? this.formTitle,
      formId: formId ?? this.formId,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      userId: userId ?? this.userId,
      vinculationFormId: vinculationFormId ?? this.vinculationFormId,
      template: template ?? this.template,
      area: area ?? this.area,
      system: system ?? this.system,
      street: street ?? this.street,
      city: city ?? this.city,
      number: number ?? this.number,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      region: region ?? this.region,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      expirationDate: expirationDate ?? this.expirationDate,
      creationDate: creationDate ?? this.creationDate,
      startDate: startDate ?? this.startDate,
      conclusionDate: conclusionDate ?? this.conclusionDate,
      justificative: justificative ?? this.justificative,
      comments: comments ?? this.comments,
      sections: sections ?? this.sections,
      informationFields: informationFields ?? this.informationFields,
      canVinculate: canVinculate ?? this.canVinculate,
    );
  }
}
