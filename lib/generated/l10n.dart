// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No internet connection`
  String get noInternetConnectionErrorMessage {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnectionErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection but we will try to send again every 5 minutes`
  String get inQueueNoInternetConnectionErrorMessage {
    return Intl.message(
      'No internet connection but we will try to send again every 5 minutes',
      name: 'inQueueNoInternetConnectionErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Local storage error: {localStorageErrorMessage}`
  String localStorageErrorMessage(
      Object placeholders, Object localStorageErrorMessage) {
    return Intl.message(
      'Local storage error: $localStorageErrorMessage',
      name: 'localStorageErrorMessage',
      desc: '',
      args: [placeholders, localStorageErrorMessage],
    );
  }

  /// `No data found`
  String get noDataFoundError {
    return Intl.message(
      'No data found',
      name: 'noDataFoundError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error, please try again`
  String get unknownError {
    return Intl.message(
      'Unknown error, please try again',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `External ID`
  String get externId {
    return Intl.message(
      'External ID',
      name: 'externId',
      desc: '',
      args: [],
    );
  }

  /// `Internal ID`
  String get internId {
    return Intl.message(
      'Internal ID',
      name: 'internId',
      desc: '',
      args: [],
    );
  }

  /// `Vinculation ID`
  String get vinculationId {
    return Intl.message(
      'Vinculation ID',
      name: 'vinculationId',
      desc: '',
      args: [],
    );
  }

  /// `Creator User ID`
  String get creatorUserId {
    return Intl.message(
      'Creator User ID',
      name: 'creatorUserId',
      desc: '',
      args: [],
    );
  }

  /// `Coordinator ID`
  String get coordinatorId {
    return Intl.message(
      'Coordinator ID',
      name: 'coordinatorId',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message(
      'Priority',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Creation Date`
  String get creationDate {
    return Intl.message(
      'Creation Date',
      name: 'creationDate',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get expirationDate {
    return Intl.message(
      'Expiration Date',
      name: 'expirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `Conclusion Date`
  String get conclusionDate {
    return Intl.message(
      'Conclusion Date',
      name: 'conclusionDate',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Fill Form`
  String get fillForm {
    return Intl.message(
      'Fill Form',
      name: 'fillForm',
      desc: '',
      args: [],
    );
  }

  /// `Link Form`
  String get linkForm {
    return Intl.message(
      'Link Form',
      name: 'linkForm',
      desc: '',
      args: [],
    );
  }

  /// `View Filled Form`
  String get viewForm {
    return Intl.message(
      'View Filled Form',
      name: 'viewForm',
      desc: '',
      args: [],
    );
  }

  /// `View Filled Form`
  String get viewFilledForm {
    return Intl.message(
      'View Filled Form',
      name: 'viewFilledForm',
      desc: '',
      args: [],
    );
  }

  /// `Step Back`
  String get stepBack {
    return Intl.message(
      'Step Back',
      name: 'stepBack',
      desc: '',
      args: [],
    );
  }

  /// `Create Form`
  String get createForm {
    return Intl.message(
      'Create Form',
      name: 'createForm',
      desc: '',
      args: [],
    );
  }

  /// `Not Found Forms`
  String get notFoundForm {
    return Intl.message(
      'Not Found Forms',
      name: 'notFoundForm',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Select Files`
  String get selectFiles {
    return Intl.message(
      'Select Files',
      name: 'selectFiles',
      desc: '',
      args: [],
    );
  }

  /// `Save Form`
  String get saveForm {
    return Intl.message(
      'Save Form',
      name: 'saveForm',
      desc: '',
      args: [],
    );
  }

  /// `Send Form`
  String get sendForm {
    return Intl.message(
      'Send Form',
      name: 'sendForm',
      desc: '',
      args: [],
    );
  }

  /// `Priority Colors:\nRed (Emergency)\nYellow (In progress)\nGreen (Completed)`
  String get priorityTooltip {
    return Intl.message(
      'Priority Colors:\nRed (Emergency)\nYellow (In progress)\nGreen (Completed)',
      name: 'priorityTooltip',
      desc: '',
      args: [],
    );
  }

  /// `No form found!`
  String get noFormsFound {
    return Intl.message(
      'No form found!',
      name: 'noFormsFound',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Clear Filters`
  String get clearFilters {
    return Intl.message(
      'Clear Filters',
      name: 'clearFilters',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message(
      'Sort',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `{schema, select, PRIORIDADE_BAIXO_ALTO{Low-High Priority} PRIORIDADE_ALTO_BAIXO{High-Low Priority} MAIS_RECENTE{Recent} MAIS_ANTIGO{Old} other{}}`
  String orderEnumSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'PRIORIDADE_BAIXO_ALTO': 'Low-High Priority',
        'PRIORIDADE_ALTO_BAIXO': 'High-Low Priority',
        'MAIS_RECENTE': 'Recent',
        'MAIS_ANTIGO': 'Old',
        'other': '',
      },
      name: 'orderEnumSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, LOW{Low} MEDIUM{Medium} HIGH{High} EMERGENCY{Emergency} other{}}`
  String priorityEnumSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'LOW': 'Low',
        'MEDIUM': 'Medium',
        'HIGH': 'High',
        'EMERGENCY': 'Emergency',
        'other': '',
      },
      name: 'priorityEnumSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, NOT_STARTED{Not started} IN_PROGRESS{In progress} CONCLUDED{Concluded} CANCELED{Canceled} other{}}`
  String formStatusEnumSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'NOT_STARTED': 'Not started',
        'IN_PROGRESS': 'In progress',
        'CONCLUDED': 'Concluded',
        'CANCELED': 'Canceled',
        'other': '',
      },
      name: 'formStatusEnumSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `All fields should be saved`
  String get allFieldsShouldBeSaved {
    return Intl.message(
      'All fields should be saved',
      name: 'allFieldsShouldBeSaved',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `This field should have a minimum length of: `
  String get thisFieldShouldHaveMinimumLength {
    return Intl.message(
      'This field should have a minimum length of: ',
      name: 'thisFieldShouldHaveMinimumLength',
      desc: '',
      args: [],
    );
  }

  /// `This field should have a maximum length of: `
  String get thisFieldShouldHaveMaximumLength {
    return Intl.message(
      'This field should have a maximum length of: ',
      name: 'thisFieldShouldHaveMaximumLength',
      desc: '',
      args: [],
    );
  }

  /// `Invalid format`
  String get invalidFormat {
    return Intl.message(
      'Invalid format',
      name: 'invalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `This field should have less than: `
  String get thisFieldShouldHaveMaximumValue {
    return Intl.message(
      'This field should have less than: ',
      name: 'thisFieldShouldHaveMaximumValue',
      desc: '',
      args: [],
    );
  }

  /// `This field should have more than: `
  String get thisFieldShouldHaveMinimumValue {
    return Intl.message(
      'This field should have more than: ',
      name: 'thisFieldShouldHaveMinimumValue',
      desc: '',
      args: [],
    );
  }

  /// `This date should be before of: `
  String get thisDateShouldBeBefore {
    return Intl.message(
      'This date should be before of: ',
      name: 'thisDateShouldBeBefore',
      desc: '',
      args: [],
    );
  }

  /// `This date should be after of: `
  String get thisDateSouldBeAfter {
    return Intl.message(
      'This date should be after of: ',
      name: 'thisDateSouldBeAfter',
      desc: '',
      args: [],
    );
  }

  /// `Exceeded max check limit of: `
  String get maxCheckLimit {
    return Intl.message(
      'Exceeded max check limit of: ',
      name: 'maxCheckLimit',
      desc: '',
      args: [],
    );
  }

  /// `Max files quantity: `
  String get maxFilesQuantity {
    return Intl.message(
      'Max files quantity: ',
      name: 'maxFilesQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Min files quantity: `
  String get minFilesQuantity {
    return Intl.message(
      'Min files quantity: ',
      name: 'minFilesQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Select Value`
  String get selectValue {
    return Intl.message(
      'Select Value',
      name: 'selectValue',
      desc: '',
      args: [],
    );
  }

  /// `Additional Information`
  String get additionalInformation {
    return Intl.message(
      'Additional Information',
      name: 'additionalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Help Image`
  String get helpImage {
    return Intl.message(
      'Help Image',
      name: 'helpImage',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Help Text`
  String get helpText {
    return Intl.message(
      'Help Text',
      name: 'helpText',
      desc: '',
      args: [],
    );
  }

  /// `Give Justification`
  String get giveJustification {
    return Intl.message(
      'Give Justification',
      name: 'giveJustification',
      desc: '',
      args: [],
    );
  }

  /// `Justification Text`
  String get justificationText {
    return Intl.message(
      'Justification Text',
      name: 'justificationText',
      desc: '',
      args: [],
    );
  }

  /// `Justification Image`
  String get justificationImage {
    return Intl.message(
      'Justification Image',
      name: 'justificationImage',
      desc: '',
      args: [],
    );
  }

  /// `Fill Justification`
  String get fillJustification {
    return Intl.message(
      'Fill Justification',
      name: 'fillJustification',
      desc: '',
      args: [],
    );
  }

  /// `Select Image`
  String get selectImage {
    return Intl.message(
      'Select Image',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
