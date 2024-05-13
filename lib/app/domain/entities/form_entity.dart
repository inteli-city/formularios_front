import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

class FormEntity {
  final String externFormId;
  final String internFormId;
  final String creatorUserId;
  final String userId;
  final List<String> coordinatorsId;
  final String? vinculationFormId;
  final String template;
  final String area;
  final String system;
  final String street;
  final String city;
  final int number;
  final double latitude;
  final double longitude;
  final String region;
  final String? description;
  final PriorityEnum priority;
  final FormStatusEnum status;
  final int expirationDate;
  final int creationDate;
  final int? startDate;
  final int? endDate;
  final String? justificative;
  final String? comments;
  final List<SectionEntity> sections;
  final List<InformationFieldEntity>? informationFields;

  FormEntity({
    required this.externFormId,
    required this.internFormId,
    required this.creatorUserId,
    required this.userId,
    required this.coordinatorsId,
    this.vinculationFormId,
    required this.template,
    required this.area,
    required this.system,
    required this.street,
    required this.city,
    required this.number,
    required this.latitude,
    required this.longitude,
    required this.region,
    this.description,
    required this.priority,
    required this.status,
    required this.expirationDate,
    required this.creationDate,
    this.startDate,
    this.endDate,
    this.justificative,
    this.comments,
    required this.sections,
    this.informationFields,
  });

  
}
