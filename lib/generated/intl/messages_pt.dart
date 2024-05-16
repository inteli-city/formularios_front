// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static String m0(placeholders, entityErrorMessage) =>
      "Campo ${entityErrorMessage} não é válido";

  static String m1(schema) => "${Intl.select(schema, {
            'NAO_INICIADO': 'Não iniciado',
            'EM_ANDAMENTO': 'Em andamento',
            'CONCLUIDO': 'Concluído',
            'other': '',
          })}";

  static String m2(placeholders, message) =>
      "Itens não encontrados para: ${message}";

  static String m3(schema) => "${Intl.select(schema, {
            'PRIORIDADE_BAIXO_ALTO': 'Prioridade Baixo-Alto',
            'PRIORIDADE_ALTO_BAIXO': 'Prioridade Alto-Baixo',
            'MAIS_RECENTE': 'Mais Recente',
            'MAIS_ANTIGO': 'Mais Antigo',
            'other': '',
          })}";

  static String m4(schema) => "${Intl.select(schema, {
            'LOW': 'Baixa',
            'MEDIUM': 'Média',
            'HIGH': 'Alta',
            'EMERCENCY': 'Emergencial',
            'other': '',
          })}";

  static String m5(placeholders, message) => "${message}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "clearFilters": MessageLookupByLibrary.simpleMessage("Limpar Filtros"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
        "coordinatorId":
            MessageLookupByLibrary.simpleMessage("ID do Coordenador"),
        "creationDate": MessageLookupByLibrary.simpleMessage("Data de Criação"),
        "creatorUserId":
            MessageLookupByLibrary.simpleMessage("ID do Usuário Criador"),
        "description": MessageLookupByLibrary.simpleMessage("Descrição"),
        "endDate": MessageLookupByLibrary.simpleMessage("Data de Término"),
        "entityErrorMessage": m0,
        "expirationDate":
            MessageLookupByLibrary.simpleMessage("Data de Expiração"),
        "externId": MessageLookupByLibrary.simpleMessage("ID Externo"),
        "fillForm": MessageLookupByLibrary.simpleMessage("Preencher"),
        "filters": MessageLookupByLibrary.simpleMessage("Filtros"),
        "formStatusEnumSchema": m1,
        "internId": MessageLookupByLibrary.simpleMessage("ID Interno"),
        "latitude": MessageLookupByLibrary.simpleMessage("Latitude"),
        "linkForm": MessageLookupByLibrary.simpleMessage("Vincular Formulário"),
        "longitude": MessageLookupByLibrary.simpleMessage("Longitude"),
        "noFormsFound": MessageLookupByLibrary.simpleMessage(
            "Nenhum Formulário Encontrado!"),
        "noItemsFoundErrorMessage": m2,
        "number": MessageLookupByLibrary.simpleMessage("Número"),
        "orderEnumSchema": m3,
        "priority": MessageLookupByLibrary.simpleMessage("Prioridade"),
        "priorityEnumSchema": m4,
        "priorityTooltip": MessageLookupByLibrary.simpleMessage(
            "Cores de Prioridade: \nVermelho (Emergencial)\nAmarelo (Em andamento)\nVerde (Concluído)"),
        "requestErrorMessage": m5,
        "sort": MessageLookupByLibrary.simpleMessage("Ordenar"),
        "start": MessageLookupByLibrary.simpleMessage("Iniciar"),
        "startDate": MessageLookupByLibrary.simpleMessage("Data de Início"),
        "stepBack": MessageLookupByLibrary.simpleMessage("Retroceder"),
        "street": MessageLookupByLibrary.simpleMessage("Rua"),
        "vinculationId":
            MessageLookupByLibrary.simpleMessage("ID de Vinculação")
      };
}
