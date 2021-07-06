import 'package:fl_mvvm_riverpod/services/shared_preferences_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_mvvm_riverpod/app/theme/app_theme.dart';
import 'package:fl_mvvm_riverpod/utils/languages/app_language_preferences.dart';
import 'package:fl_mvvm_riverpod/utils/languages/app_localizations.dart';

final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) => throw UnimplementedError());

final appThemeChangeNotifierProvider = ChangeNotifierProvider<AppTheme>(
  (ref) {
    return AppTheme(ref.read);
  },
);

final appLanguagePreferencesChangeNotifierProvider =
    ChangeNotifierProvider<AppLanguagePreferences>(
  (ref) {
    return AppLanguagePreferences(ref.read);
  },
);

final appLocalizationsChangeNotifierProvider =
    ChangeNotifierProvider<AppLocalizations>(
  (ref) {
    final appLocale =
        ref.read(appLanguagePreferencesChangeNotifierProvider).appLocale;
    return AppLocalizations(appLocale);
  },
);
