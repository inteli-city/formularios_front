// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(placeholders, entityErrorMessage) =>
      "Field ${entityErrorMessage} is not valid";

  static String m1(schema) => "${Intl.select(schema, {
            'NAO_INICIADO': 'Not started',
            'EM_ANDAMENTO': 'In progress',
            'CONCLUIDO': 'Concluded',
            'other': '',
          })}";

  static String m2(placeholders, message) => "No items found for ${message}";

  static String m3(schema) => "${Intl.select(schema, {
            'PRIORIDADE_BAIXO_ALTO': 'Low-High Priority',
            'PRIORIDADE_ALTO_BAIXO': 'High-Low Priority',
            'MAIS_RECENTE': 'Recent',
            'MAIS_ANTIGO': 'Old',
            'other': '',
          })}";

  static String m4(schema) => "${Intl.select(schema, {
            'LOW': 'Low',
            'MEDIUM': 'Medium',
            'HIGH': 'High',
            'EMERCENCY': 'Emergency',
            'other': '',
          })}";

  static String m5(placeholders, message) => "${message}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "entityErrorMessage": m0,
        "formStatusEnumSchema": m1,
        "noItemsFoundErrorMessage": m2,
        "orderEnumSchema": m3,
        "priorityEnumSchema": m4,
        "requestErrorMessage": m5
      };
}
