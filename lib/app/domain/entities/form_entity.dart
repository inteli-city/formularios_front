class FormEntity {
  final String idExternForm;
  final String idInternForm;
  final String idCreatorUser;
  final String userId;
  final List<String> idCoordinator;
  final String? idFormVinculation;
  final String templateName;
  final String area;
  final String system;
  final String street;
  final String city;
  final int number;
  final double lat;
  final double long;
  final String region;
  final String? generalDescription;
  final String priority;
  final String status;
  final int expiration;
  final int dateCreation;
  final int? dateStart;
  final int? dateEnd;
  final String? justification;
  final String? comment;

  FormEntity({
    required this.idExternForm,
    required this.idInternForm,
    required this.idCreatorUser,
    required this.userId,
    required this.idCoordinator,
    this.idFormVinculation,
    required this.templateName,
    required this.area,
    required this.system,
    required this.street,
    required this.city,
    required this.number,
    required this.lat,
    required this.long,
    required this.region,
    this.generalDescription,
    required this.priority,
    required this.status,
    required this.expiration,
    required this.dateCreation,
    this.dateStart,
    this.dateEnd,
    this.justification,
    this.comment,
  });
}
