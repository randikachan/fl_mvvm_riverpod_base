import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_mvvm_riverpod/app/top_level_providers.dart';

import 'app_colors.dart';

class AppTheme with ChangeNotifier {
  final Reader reader;

  AppTheme(this.reader) {
    isDarkThemeOn();
  }

  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void isDarkThemeOn() async {
    _isDarkTheme = reader(sharedPreferencesServiceProvider).isDarkModeEnabled();
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;
    reader(sharedPreferencesServiceProvider)
        .setDarkMode(isEnabled: _isDarkTheme);
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: AppColors.primarySwatchLTC,
      primaryColor: AppColors.primaryColorLTC,
      secondaryHeaderColor: AppColors.secondaryHeaderColorLTC,
      unselectedWidgetColor: AppColors.unselectedWidgetColor,
      scaffoldBackgroundColor: AppColors.backgroundColorLTC,
      fontFamily: 'Montserrat',
      dividerColor: AppColors.dividerColorLTC,
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: AppColors.textButtonLTC,
      ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: AppColors.primaryTextLTC),
        headline2: TextStyle(color: AppColors.primaryTextLTC),
        headline3: TextStyle(color: AppColors.primaryTextLTC),
        headline4: TextStyle(color: AppColors.primaryTextLTC),
        headline5: TextStyle(color: AppColors.primaryTextLTC),
        headline6: TextStyle(color: AppColors.primaryTextLTC),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: AppColors.primarySwatchDTC,
      primaryColor: AppColors.primaryColorDTC,
      secondaryHeaderColor: AppColors.secondaryHeaderColorDTC,
      unselectedWidgetColor: AppColors.unselectedWidgetColor,
      scaffoldBackgroundColor: AppColors.backgroundColorDTC,
      fontFamily: 'Montserrat',
      dividerColor: AppColors.dividerColorDTC,
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: AppColors.textButtonDTC,
      ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: AppColors.primaryTextDTC),
        headline2: TextStyle(color: AppColors.primaryTextDTC),
        headline3: TextStyle(color: AppColors.primaryTextDTC),
        headline4: TextStyle(color: AppColors.primaryTextDTC),
        headline5: TextStyle(color: AppColors.primaryTextDTC),
        headline6: TextStyle(color: AppColors.primaryTextDTC),
      ),
    );
  }
}
