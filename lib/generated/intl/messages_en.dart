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
            'NOT_STARTED': 'Not started',
            'IN_PROGRESS': 'In progress',
            'CONCLUDED': 'Concluded',
            'CANCELED': 'Canceled',
            'other': '',
          })}";

  static String m2(placeholders, localStorageErrorMessage) =>
      "Local storage error: ${localStorageErrorMessage}";

  static String m3(placeholders, message) => "No items found for ${message}";

  static String m4(schema) => "${Intl.select(schema, {
            'PRIORIDADE_BAIXO_ALTO': 'Low-High Priority',
            'PRIORIDADE_ALTO_BAIXO': 'High-Low Priority',
            'MAIS_RECENTE': 'Recent',
            'MAIS_ANTIGO': 'Old',
            'other': '',
          })}";

  static String m5(schema) => "${Intl.select(schema, {
            'LOW': 'Low',
            'MEDIUM': 'Medium',
            'HIGH': 'High',
            'EMERGENCY': 'Emergency',
            'other': '',
          })}";

  static String m6(placeholders, message) => "${message}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "allFieldsShouldBeSaved":
            MessageLookupByLibrary.simpleMessage("All fields should be saved"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "clearFilters": MessageLookupByLibrary.simpleMessage("Clear Filters"),
        "conclusionDate":
            MessageLookupByLibrary.simpleMessage("Conclusion Date"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "coordinatorId": MessageLookupByLibrary.simpleMessage("Coordinator ID"),
        "creationDate": MessageLookupByLibrary.simpleMessage("Creation Date"),
        "creatorUserId":
            MessageLookupByLibrary.simpleMessage("Creator User ID"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "entityErrorMessage": m0,
        "expirationDate":
            MessageLookupByLibrary.simpleMessage("Expiration Date"),
        "externId": MessageLookupByLibrary.simpleMessage("External ID"),
        "fillForm": MessageLookupByLibrary.simpleMessage("Fill Form"),
        "filters": MessageLookupByLibrary.simpleMessage("Filters"),
        "formStatusEnumSchema": m1,
        "internId": MessageLookupByLibrary.simpleMessage("Internal ID"),
        "invalidFormat": MessageLookupByLibrary.simpleMessage("Invalid format"),
        "latitude": MessageLookupByLibrary.simpleMessage("Latitude"),
        "linkForm": MessageLookupByLibrary.simpleMessage("Link Form"),
        "localStorageErrorMessage": m2,
        "longitude": MessageLookupByLibrary.simpleMessage("Longitude"),
        "maxCheckLimit": MessageLookupByLibrary.simpleMessage(
            "Exceeded max check limit of: "),
        "maxFilesQuantity":
            MessageLookupByLibrary.simpleMessage("Max files quantity: "),
        "minFilesQuantity":
            MessageLookupByLibrary.simpleMessage("Min files quantity: "),
        "noFormsFound": MessageLookupByLibrary.simpleMessage("No form found!"),
        "noInternetConnectionErrorMessage":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "noItemsFoundErrorMessage": m3,
        "number": MessageLookupByLibrary.simpleMessage("Number"),
        "orderEnumSchema": m4,
        "priority": MessageLookupByLibrary.simpleMessage("Priority"),
        "priorityEnumSchema": m5,
        "priorityTooltip": MessageLookupByLibrary.simpleMessage(
            "Priority Colors:\nRed (Emergency)\nYellow (In progress)\nGreen (Completed)"),
        "requestErrorMessage": m6,
        "sort": MessageLookupByLibrary.simpleMessage("Sort"),
        "start": MessageLookupByLibrary.simpleMessage("Start"),
        "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
        "stepBack": MessageLookupByLibrary.simpleMessage("Step Back"),
        "street": MessageLookupByLibrary.simpleMessage("Street"),
        "thisDateShouldBeBefore": MessageLookupByLibrary.simpleMessage(
            "This date should be before of: "),
        "thisDateSouldBeAfter": MessageLookupByLibrary.simpleMessage(
            "This date should be after of: "),
        "thisFieldIsRequired":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "thisFieldShouldHaveMaximumLength":
            MessageLookupByLibrary.simpleMessage(
                "This field should have a maximum length of: "),
        "thisFieldShouldHaveMaximumValue": MessageLookupByLibrary.simpleMessage(
            "This field should have less than: "),
        "thisFieldShouldHaveMinimumLength":
            MessageLookupByLibrary.simpleMessage(
                "This field should have a minimum length of: "),
        "thisFieldShouldHaveMinimumValue": MessageLookupByLibrary.simpleMessage(
            "This field should have more than: "),
        "vinculationId": MessageLookupByLibrary.simpleMessage("Vinculation ID")
      };
}
