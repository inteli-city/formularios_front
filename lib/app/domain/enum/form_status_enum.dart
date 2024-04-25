// ignore_for_file: constant_identifier_names

enum FormStatusEnum {
  NAO_INICIADO,
  EM_ANDAMENTO,
  CONCLUIDO;

  String get enumString {
    switch (this) {
      case FormStatusEnum.NAO_INICIADO:
        return 'Não iniciado';
      case FormStatusEnum.EM_ANDAMENTO:
        return 'Em andamento';
      case FormStatusEnum.CONCLUIDO:
        return 'Concluído';
    }
  }
}
