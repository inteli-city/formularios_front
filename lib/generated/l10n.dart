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

  /// `Field {entityErrorMessage} is not valid`
  String entityErrorMessage(Object placeholders, Object entityErrorMessage) {
    return Intl.message(
      'Field $entityErrorMessage is not valid',
      name: 'entityErrorMessage',
      desc: '',
      args: [placeholders, entityErrorMessage],
    );
  }

  /// `{message}`
  String requestErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      '$message',
      name: 'requestErrorMessage',
      desc: '',
      args: [placeholders, message],
    );
  }

  /// `No items found for {message}`
  String noItemsFoundErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      'No items found for $message',
      name: 'noItemsFoundErrorMessage',
      desc: '',
      args: [placeholders, message],
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

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
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

  /// `Step Back`
  String get stepBack {
    return Intl.message(
      'Step Back',
      name: 'stepBack',
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

  /// `{schema, select, LOW{Low} MEDIUM{Medium} HIGH{High} EMERCENCY{Emergency} other{}}`
  String priorityEnumSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'LOW': 'Low',
        'MEDIUM': 'Medium',
        'HIGH': 'High',
        'EMERCENCY': 'Emergency',
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
