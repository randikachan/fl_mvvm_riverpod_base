import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_mvvm_riverpod/app/top_level_providers.dart';

class AppLanguagePreferences with ChangeNotifier {
  final Reader reader;

  AppLanguagePreferences(this.reader) {
    fetchLocale();
  }

  Locale _appLocale = Locale('en');
  int _selectedLanguageIndex = 0;

  Locale get appLocale {
    return _appLocale;
  }
  int get selectedLanguageIndex => _selectedLanguageIndex;

  void changeLanguage(Locale type) async {
    if (_appLocale == type) {
      return;
    }

    if (type == Locale("en")) {
      reader(sharedPreferencesServiceProvider).setLocaleLang(code: 'en');
      reader(sharedPreferencesServiceProvider).setLocaleCountry(code: 'US');
    } else if (type == Locale("si")) {
      reader(sharedPreferencesServiceProvider).setLocaleLang(code: 'si');
      reader(sharedPreferencesServiceProvider).setLocaleCountry(code: 'LK');
    } else {
      reader(sharedPreferencesServiceProvider).setLocaleLang(code: 'ta');
      reader(sharedPreferencesServiceProvider).setLocaleCountry(code: '');
    }

    _setSelectedLanguageIndex(type);

    await fetchLocale();
    notifyListeners();
  }

  fetchLocale() async {
    final languageCode = reader(sharedPreferencesServiceProvider).getLocaleLang();
    final countryCode = reader(sharedPreferencesServiceProvider).getLocaleCountry();
    _appLocale = Locale(languageCode, countryCode);
    _setSelectedLanguageIndex(_appLocale);
  }

  _setSelectedLanguageIndex(Locale type) {
    if (type.languageCode == Locale("en").languageCode) {
      _selectedLanguageIndex = 0;
    } else if (type.languageCode == Locale("si").languageCode) {
      _selectedLanguageIndex = 1;
    } else {
      _selectedLanguageIndex = 2;
    }
  }
}
