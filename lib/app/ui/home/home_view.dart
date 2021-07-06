import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_mvvm_riverpod/app/top_level_providers.dart';
import 'package:fl_mvvm_riverpod/utils/languages/app_localizations.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final appTheme = watch(appThemeChangeNotifierProvider);
    final appLocalizations = watch(appLocalizationsChangeNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                appLocalizations.translate(LocalizationKeys.welcome),
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
            TextButton(
              key: HomeViewKeys.toggleThemeTextButtonKey,
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    primary:
                        Theme.of(context).primaryTextTheme.headline1?.color),
                onPressed: () {
                  appTheme.toggleTheme();
                },
                child: Text("Toggle Theme"))
          ],
        ),
      ),
    );
  }
}

class HomeViewKeys {
  static final toggleThemeTextButtonKey = Key("toggle_theme_text_btn_key");
}