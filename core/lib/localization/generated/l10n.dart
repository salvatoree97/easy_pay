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

  /// `Continua`
  String get continue_button_text {
    return Intl.message(
      'Continua',
      name: 'continue_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Annulla`
  String get cancel_button_text {
    return Intl.message(
      'Annulla',
      name: 'cancel_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Imposta la biometria`
  String get set_biometry_title {
    return Intl.message(
      'Imposta la biometria',
      name: 'set_biometry_title',
      desc: '',
      args: [],
    );
  }

  /// `Vuoi abilitare la biometria per accedere all'app più velocemente?`
  String get set_biometry_description {
    return Intl.message(
      'Vuoi abilitare la biometria per accedere all\'app più velocemente?',
      name: 'set_biometry_description',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Attività commerciale`
  String get retail_detail_name {
    return Intl.message(
      'Attività commerciale',
      name: 'retail_detail_name',
      desc: '',
      args: [],
    );
  }

  /// `Descrizione`
  String get retail_detail_description {
    return Intl.message(
      'Descrizione',
      name: 'retail_detail_description',
      desc: '',
      args: [],
    );
  }

  /// `Indirizzo`
  String get retail_detail_address {
    return Intl.message(
      'Indirizzo',
      name: 'retail_detail_address',
      desc: '',
      args: [],
    );
  }

  /// `Sconto`
  String get retail_detail_discount {
    return Intl.message(
      'Sconto',
      name: 'retail_detail_discount',
      desc: '',
      args: [],
    );
  }

  /// `Paga`
  String get retail_detail_pay_button {
    return Intl.message(
      'Paga',
      name: 'retail_detail_pay_button',
      desc: '',
      args: [],
    );
  }

  /// `Cerca`
  String get search_placeholder {
    return Intl.message(
      'Cerca',
      name: 'search_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get initial_login_button_title {
    return Intl.message(
      'Login',
      name: 'initial_login_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Registrati`
  String get initial_registration_button_title {
    return Intl.message(
      'Registrati',
      name: 'initial_registration_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_title {
    return Intl.message(
      'Login',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Inserisci le tue credenziali`
  String get credentials_description {
    return Intl.message(
      'Inserisci le tue credenziali',
      name: 'credentials_description',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_title {
    return Intl.message(
      'Email',
      name: 'email_title',
      desc: '',
      args: [],
    );
  }

  /// `Inserisci la tua email`
  String get email_placeholder {
    return Intl.message(
      'Inserisci la tua email',
      name: 'email_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Il valore è obbligarorio`
  String get required_error_message {
    return Intl.message(
      'Il valore è obbligarorio',
      name: 'required_error_message',
      desc: '',
      args: [],
    );
  }

  /// `L'email non è valida`
  String get email_format_error_message {
    return Intl.message(
      'L\'email non è valida',
      name: 'email_format_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_title {
    return Intl.message(
      'Password',
      name: 'password_title',
      desc: '',
      args: [],
    );
  }

  /// `Inserisci la tua password`
  String get password_placeholder {
    return Intl.message(
      'Inserisci la tua password',
      name: 'password_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Crea password`
  String get create_password_title {
    return Intl.message(
      'Crea password',
      name: 'create_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Conferma password`
  String get confirm_password_title {
    return Intl.message(
      'Conferma password',
      name: 'confirm_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Le due password devono essere uguali`
  String get same_password_error_message {
    return Intl.message(
      'Le due password devono essere uguali',
      name: 'same_password_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Registrazione`
  String get registration_title {
    return Intl.message(
      'Registrazione',
      name: 'registration_title',
      desc: '',
      args: [],
    );
  }

  /// `Inserisci i tuoi dati personali`
  String get personal_data_description {
    return Intl.message(
      'Inserisci i tuoi dati personali',
      name: 'personal_data_description',
      desc: '',
      args: [],
    );
  }

  /// `Crea le tue credenziali!`
  String get create_your_credentials_description {
    return Intl.message(
      'Crea le tue credenziali!',
      name: 'create_your_credentials_description',
      desc: '',
      args: [],
    );
  }

  /// `Nome`
  String get name_title {
    return Intl.message(
      'Nome',
      name: 'name_title',
      desc: '',
      args: [],
    );
  }

  /// `Inserisci il tuo nome`
  String get name_placeholder {
    return Intl.message(
      'Inserisci il tuo nome',
      name: 'name_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Cognome`
  String get lastname_title {
    return Intl.message(
      'Cognome',
      name: 'lastname_title',
      desc: '',
      args: [],
    );
  }

  /// `Inserisci il tuo cognome`
  String get lastname_placeholder {
    return Intl.message(
      'Inserisci il tuo cognome',
      name: 'lastname_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Codice Fiscale`
  String get fiscalcode_title {
    return Intl.message(
      'Codice Fiscale',
      name: 'fiscalcode_title',
      desc: '',
      args: [],
    );
  }

  /// `Inserisci il tuo codice fiscale`
  String get fiscalcode_placeholder {
    return Intl.message(
      'Inserisci il tuo codice fiscale',
      name: 'fiscalcode_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Ciao {name}, ci siamo quasi!`
  String almost_done_message(Object name) {
    return Intl.message(
      'Ciao $name, ci siamo quasi!',
      name: 'almost_done_message',
      desc: '',
      args: [name],
    );
  }

  /// `La password deve contenere almeno una lettera maiuscola e un numero`
  String get password_format_error_message {
    return Intl.message(
      'La password deve contenere almeno una lettera maiuscola e un numero',
      name: 'password_format_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Profilo`
  String get profile {
    return Intl.message(
      'Profilo',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Inserisci la password`
  String get set_password_title {
    return Intl.message(
      'Inserisci la password',
      name: 'set_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Configura la password da salvare utilizzando la biometria`
  String get set_password_description {
    return Intl.message(
      'Configura la password da salvare utilizzando la biometria',
      name: 'set_password_description',
      desc: '',
      args: [],
    );
  }

  /// `Notifiche`
  String get notifications_title {
    return Intl.message(
      'Notifiche',
      name: 'notifications_title',
      desc: '',
      args: [],
    );
  }

  /// `Dati personali`
  String get personal_data_title {
    return Intl.message(
      'Dati personali',
      name: 'personal_data_title',
      desc: '',
      args: [],
    );
  }

  /// `Tema`
  String get theme_title {
    return Intl.message(
      'Tema',
      name: 'theme_title',
      desc: '',
      args: [],
    );
  }

  /// `Puoi cambiare il tema dell'app`
  String get theme_description {
    return Intl.message(
      'Puoi cambiare il tema dell\'app',
      name: 'theme_description',
      desc: '',
      args: [],
    );
  }

  /// `Per una migliore esperienza utente, qui puoi decidere come impostare l'aspetto dell'applicazione.`
  String get theme_cortesy_message {
    return Intl.message(
      'Per una migliore esperienza utente, qui puoi decidere come impostare l\'aspetto dell\'applicazione.',
      name: 'theme_cortesy_message',
      desc: '',
      args: [],
    );
  }

  /// `Impostazioni`
  String get settings_title {
    return Intl.message(
      'Impostazioni',
      name: 'settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Versione`
  String get version_title {
    return Intl.message(
      'Versione',
      name: 'version_title',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout_title {
    return Intl.message(
      'Logout',
      name: 'logout_title',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout_button_title {
    return Intl.message(
      'Logout',
      name: 'logout_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Premendo conferma uscirai dall'app e dovrai rieffettuare l'accesso. Sei sicuro di voler continuare?`
  String get confirm_logout_message {
    return Intl.message(
      'Premendo conferma uscirai dall\'app e dovrai rieffettuare l\'accesso. Sei sicuro di voler continuare?',
      name: 'confirm_logout_message',
      desc: '',
      args: [],
    );
  }

  /// `Login con FaceID`
  String get face_id_login_title {
    return Intl.message(
      'Login con FaceID',
      name: 'face_id_login_title',
      desc: '',
      args: [],
    );
  }

  /// `Login con impronta digitale`
  String get fingerprint_login_title {
    return Intl.message(
      'Login con impronta digitale',
      name: 'fingerprint_login_title',
      desc: '',
      args: [],
    );
  }

  /// `Tema Chiaro`
  String get ligh_theme_title {
    return Intl.message(
      'Tema Chiaro',
      name: 'ligh_theme_title',
      desc: '',
      args: [],
    );
  }

  /// `Tema Scuro`
  String get dark_theme_title {
    return Intl.message(
      'Tema Scuro',
      name: 'dark_theme_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'en'),
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
