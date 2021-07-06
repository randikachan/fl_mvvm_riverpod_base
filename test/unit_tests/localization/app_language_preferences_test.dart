import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fl_mvvm_riverpod/app/main_providers.dart';
import 'package:fl_mvvm_riverpod/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Localization - App Language Preferences', () {

    test('override SharedPreferencesServiceProvider', () async {
      /// Initialize sharedPreferences with initial data
      SharedPreferences.setMockInitialValues(
          {SharedPreferencesService.languageCodeKey: "en"});

      final sharedPreferences = await SharedPreferences.getInstance();

      final container = ProviderContainer(
        overrides: [
          // Override the behavior of sharedPreferencesServiceProvider to have SharedPreferencesService
          // instantiated with given mock SharedPreferences instance.
          sharedPreferencesServiceProvider.overrideWithValue(
            SharedPreferencesService(sharedPreferences),
          ),
        ],
      );

      /// Check if the app language preferences has selectedLanguageIndex == 0 for English Language
      expect(
        container.read(appLanguagePreferencesChangeNotifierProvider).selectedLanguageIndex,
        0,
      );

      /// Change Language selection to Sinhala - si
      container.read(appLanguagePreferencesChangeNotifierProvider).changeLanguage(Locale("si"));

      /// Check if the app language preferences has selectedLanguageIndex == 1 for Sinhala Language
      expect(
        container.read(appLanguagePreferencesChangeNotifierProvider).selectedLanguageIndex,
        1,
      );

      /// Change Language selection back to English - en
      container.read(appLanguagePreferencesChangeNotifierProvider).changeLanguage(Locale("en"));

      /// Check if the app language preferences has selectedLanguageIndex == 0 for English Language
      expect(
        container.read(appLanguagePreferencesChangeNotifierProvider).selectedLanguageIndex,
        0,
      );

      /// Change Language selection back to Tamil - ta
      container.read(appLanguagePreferencesChangeNotifierProvider).changeLanguage(Locale("ta"));

      /// Check if the app language preferences has selectedLanguageIndex == 2 for Tamil Language
      expect(
        container.read(appLanguagePreferencesChangeNotifierProvider).selectedLanguageIndex,
        2,
      );
    });
  });
}