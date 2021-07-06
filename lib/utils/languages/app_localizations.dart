import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations with ChangeNotifier {
  Locale locale;

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings = Map<String, String>();

  AppLocalizations(this.locale) {
    load(locale);
  }

  Future<void> load(Locale locale) async {
    this.locale = locale;
    // Load the language JSON file from the "lang" folder
    String jsonString = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    notifyListeners();
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key] ?? "";
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'ta', 'si'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load(locale);
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => !(old != this);
}

class LocalizationKeys {
  static final String welcome = "welcome";
  static final String continueToHome = "continue_to_home";
  static final String contactLanguage = "contact_language";
  static final String switchTitleSinhala = "sinhala_switch_title";
  static final String switchTitleTamil = "tamil_switch_title";
  static final String switchTitleEnglish = "english_switch_title";
}
