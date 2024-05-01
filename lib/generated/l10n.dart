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

  /// `{schema, select, NAO_INICIADO{Not started} EM_ANDAMENTO{In progress} CONCLUIDO{Concluded} other{}}`
  String formStatusEnumSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'NAO_INICIADO': 'Not started',
        'EM_ANDAMENTO': 'In progress',
        'CONCLUIDO': 'Concluded',
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
