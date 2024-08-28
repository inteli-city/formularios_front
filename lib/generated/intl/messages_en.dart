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

  static String m0(schema) => "${Intl.select(schema, {
            'NOT_STARTED': 'Not started',
            'IN_PROGRESS': 'In progress',
            'CONCLUDED': 'Concluded',
            'CANCELED': 'Canceled',
            'other': '',
          })}";

  static String m1(placeholders, localStorageErrorMessage) =>
      "Local storage error: ${localStorageErrorMessage}";

  static String m2(schema) => "${Intl.select(schema, {
            'PRIORIDADE_BAIXO_ALTO': 'Low-High Priority',
            'PRIORIDADE_ALTO_BAIXO': 'High-Low Priority',
            'MAIS_RECENTE': 'Recent',
            'MAIS_ANTIGO': 'Old',
            'other': '',
          })}";

  static String m3(schema) => "${Intl.select(schema, {
            'LOW': 'Low',
            'MEDIUM': 'Medium',
            'HIGH': 'High',
            'EMERGENCY': 'Emergency',
            'other': '',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "additionalInformation":
            MessageLookupByLibrary.simpleMessage("Additional Information"),
        "allFieldsShouldBeSaved":
            MessageLookupByLibrary.simpleMessage("All fields should be saved"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "clearFilters": MessageLookupByLibrary.simpleMessage("Clear Filters"),
        "conclusionDate":
            MessageLookupByLibrary.simpleMessage("Conclusion Date"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "coordinatorId": MessageLookupByLibrary.simpleMessage("Coordinator ID"),
        "createForm": MessageLookupByLibrary.simpleMessage("Create Form"),
        "creationDate": MessageLookupByLibrary.simpleMessage("Creation Date"),
        "creatorUserId":
            MessageLookupByLibrary.simpleMessage("Creator User ID"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "details": MessageLookupByLibrary.simpleMessage("Details"),
        "expirationDate":
            MessageLookupByLibrary.simpleMessage("Expiration Date"),
        "externId": MessageLookupByLibrary.simpleMessage("External ID"),
        "fillForm": MessageLookupByLibrary.simpleMessage("Fill Form"),
        "fillJustification":
            MessageLookupByLibrary.simpleMessage("Fill Justification"),
        "filters": MessageLookupByLibrary.simpleMessage("Filters"),
        "formStatusEnumSchema": m0,
        "giveJustification":
            MessageLookupByLibrary.simpleMessage("Give Justification"),
        "helpImage": MessageLookupByLibrary.simpleMessage("Help Image"),
        "helpText": MessageLookupByLibrary.simpleMessage("Help Text"),
        "inQueueNoInternetConnectionErrorMessage":
            MessageLookupByLibrary.simpleMessage(
                "No internet connection but we will try to send again every 5 minutes"),
        "internId": MessageLookupByLibrary.simpleMessage("Internal ID"),
        "invalidFormat": MessageLookupByLibrary.simpleMessage("Invalid format"),
        "justificationImage":
            MessageLookupByLibrary.simpleMessage("Justification Image"),
        "justificationText":
            MessageLookupByLibrary.simpleMessage("Justification Text"),
        "latitude": MessageLookupByLibrary.simpleMessage("Latitude"),
        "linkForm": MessageLookupByLibrary.simpleMessage("Link Form"),
        "localStorageErrorMessage": m1,
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "longitude": MessageLookupByLibrary.simpleMessage("Longitude"),
        "maxCheckLimit": MessageLookupByLibrary.simpleMessage(
            "Exceeded max check limit of: "),
        "maxFilesQuantity":
            MessageLookupByLibrary.simpleMessage("Max files quantity: "),
        "minFilesQuantity":
            MessageLookupByLibrary.simpleMessage("Min files quantity: "),
        "noDataFoundError":
            MessageLookupByLibrary.simpleMessage("No data found"),
        "noFormsFound": MessageLookupByLibrary.simpleMessage("No form found!"),
        "noInternetConnectionErrorMessage":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "notFoundForm": MessageLookupByLibrary.simpleMessage("Not Found Forms"),
        "number": MessageLookupByLibrary.simpleMessage("Number"),
        "orderEnumSchema": m2,
        "priority": MessageLookupByLibrary.simpleMessage("Priority"),
        "priorityEnumSchema": m3,
        "priorityTooltip": MessageLookupByLibrary.simpleMessage(
            "Priority Colors:\nRed (Emergency)\nYellow (In progress)\nGreen (Completed)"),
        "saveForm": MessageLookupByLibrary.simpleMessage("Save Form"),
        "selectFiles": MessageLookupByLibrary.simpleMessage("Select Files"),
        "selectImage": MessageLookupByLibrary.simpleMessage("Select Image"),
        "selectValue": MessageLookupByLibrary.simpleMessage("Select Value"),
        "sendForm": MessageLookupByLibrary.simpleMessage("Send Form"),
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
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Unknown error, please try again"),
        "viewFilledForm":
            MessageLookupByLibrary.simpleMessage("View Filled Form"),
        "viewForm": MessageLookupByLibrary.simpleMessage("View Filled Form"),
        "vinculationId": MessageLookupByLibrary.simpleMessage("Vinculation ID")
      };
}
