import 'package:formularios_front/app/domain/entities/information_field_entity.dart';
import 'package:formularios_front/app/domain/entities/justificative_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/domain/enum/form_status_enum.dart';
import 'package:formularios_front/app/domain/enum/priority_enum.dart';

class FormEntity {
  final String formTitle;
  final String formId;
  final String creatorUserId;
  final String userId;
  final String? vinculationFormId;
  final bool canVinculate;
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
  FormStatusEnum status;
  final int expirationDate;
  final int creationDate;
  final int? startDate;
  final int? conclusionDate;
  final JustificativeEntity justification;
  final String? comments;
  List<SectionEntity> sections;
  final List<InformationFieldEntity>? informationFields;

  FormEntity({
    required this.formTitle,
    required this.formId,
    required this.creatorUserId,
    required this.userId,
    this.vinculationFormId,
    required this.canVinculate,
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
    this.conclusionDate,
    required this.justification,
    this.comments,
    required this.sections,
    this.informationFields,
  }) {
    if (sections.isEmpty) {
      throw Exception('Form must have at least one section');
    }
  }
}
