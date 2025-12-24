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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Clini`
  String get appTitle {
    return Intl.message('Clini', name: 'appTitle', desc: '', args: []);
  }

  /// `Guest Settings`
  String get guestSettings {
    return Intl.message(
      'Guest Settings',
      name: 'guestSettings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `English`
  String get language_english {
    return Intl.message(
      'English',
      name: 'language_english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get language_arabic {
    return Intl.message('Arabic', name: 'language_arabic', desc: '', args: []);
  }

  /// `Update `
  String get Update_language {
    return Intl.message('Update ', name: 'Update_language', desc: '', args: []);
  }

  /// `My Settings`
  String get My_settings {
    return Intl.message('My Settings', name: 'My_settings', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get Policies {
    return Intl.message('Privacy Policy', name: 'Policies', desc: '', args: []);
  }

  /// `Terms & Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `By using the Diagnosis application, you agree to these Terms and Conditions. Diagnosis is a digital medical platform that facilitates communication between users and healthcare providers, manages medical records, and allows appointment booking. The app also offers intelligent AI-powered consultations to help users gain an initial understanding of their health and support medical decision-making. Users should use the provided information responsibly and consult qualified professionals when needed to ensure optimal healthcare. We are committed to protecting user privacy and handling all personal and medical data in accordance with our Privacy Policy. Diagnosis reserves the right to modify or update these Terms and Conditions at any time, and continued use of the application constitutes acceptance of any changes.`
  String get terms_and_conditions_content {
    return Intl.message(
      'By using the Diagnosis application, you agree to these Terms and Conditions. Diagnosis is a digital medical platform that facilitates communication between users and healthcare providers, manages medical records, and allows appointment booking. The app also offers intelligent AI-powered consultations to help users gain an initial understanding of their health and support medical decision-making. Users should use the provided information responsibly and consult qualified professionals when needed to ensure optimal healthcare. We are committed to protecting user privacy and handling all personal and medical data in accordance with our Privacy Policy. Diagnosis reserves the right to modify or update these Terms and Conditions at any time, and continued use of the application constitutes acceptance of any changes.',
      name: 'terms_and_conditions_content',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis is a smart medical application created to simplify and enhance the healthcare experience for both patients and doctors. The app provides a secure and user-friendly platform that allows users to connect with qualified healthcare professionals, manage medical records, book appointments, and receive timely medical updates. Diagnosis also offers AI-powered medical consultation, helping users understand their symptoms at an initial level and guiding them toward the appropriate medical steps. By combining advanced technology with a user-centered design, Diagnosis aims to improve communication, support accurate diagnosis, and make healthcare services more accessible and efficient. Our mission is to deliver a reliable digital healthcare solution that contributes to better medical outcomes and a healthier community.`
  String get aboutUs_content {
    return Intl.message(
      'Diagnosis is a smart medical application created to simplify and enhance the healthcare experience for both patients and doctors. The app provides a secure and user-friendly platform that allows users to connect with qualified healthcare professionals, manage medical records, book appointments, and receive timely medical updates. Diagnosis also offers AI-powered medical consultation, helping users understand their symptoms at an initial level and guiding them toward the appropriate medical steps. By combining advanced technology with a user-centered design, Diagnosis aims to improve communication, support accurate diagnosis, and make healthcare services more accessible and efficient. Our mission is to deliver a reliable digital healthcare solution that contributes to better medical outcomes and a healthier community.',
      name: 'aboutUs_content',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
