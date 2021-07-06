import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_mvvm_riverpod/app/route_generator.dart';
import 'package:fl_mvvm_riverpod/app/theme/app_theme.dart';
import 'package:fl_mvvm_riverpod/app/top_level_providers.dart';
import 'package:fl_mvvm_riverpod/services/shared_preferences_service.dart';
import 'package:fl_mvvm_riverpod/utils/languages/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangTrainerApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isDarkThemeOn = watch(appThemeChangeNotifierProvider).isDarkTheme;

    return MaterialApp(
      title: 'LangTrain',
      supportedLocales: [
        Locale('en', 'US'),
        Locale('si', 'LK'),
        Locale('ta', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkThemeOn ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesServiceProvider.overrideWithValue(
        SharedPreferencesService(sharedPreferences),
      ),
    ],
    child: LangTrainerApp(),
  ));
}
