import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  static const onBoardingCompleteKey = 'onBoardingComplete';

  Future<void> setOnBoardingComplete() async {
    await sharedPreferences.setBool(onBoardingCompleteKey, true);
  }

  bool isOnBoardingComplete() =>
      sharedPreferences.getBool(onBoardingCompleteKey) ?? false;

  static const isDarkModeEnabledKey = 'isDarkModeEnabled';

  Future<void> setDarkMode({bool isEnabled = false}) async {
    await sharedPreferences.setBool(isDarkModeEnabledKey, isEnabled);
  }

  bool isDarkModeEnabled() =>
      sharedPreferences.getBool(isDarkModeEnabledKey) ?? false;

  static const String countryCodeKey = 'country_code';

  Future<void> setLocaleCountry({String code = ''}) async {
    await sharedPreferences.setString(countryCodeKey, code);
  }

  String getLocaleCountry() =>
      sharedPreferences.getString(countryCodeKey) ?? '';

  static const String languageCodeKey = 'language_code';

  Future<void> setLocaleLang({String code = 'en'}) async {
    await sharedPreferences.setString(languageCodeKey, code);
  }

  String getLocaleLang() =>
      sharedPreferences.getString(languageCodeKey) ??  'en';
}
