import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_mvvm_riverpod/app/route_generator.dart';
import 'package:fl_mvvm_riverpod/app/main_providers.dart';
import 'package:fl_mvvm_riverpod/app/ui_components/language_switch.dart';
import 'package:fl_mvvm_riverpod/utils/languages/app_localizations.dart';

class WelcomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var appLocalizations = watch(appLocalizationsChangeNotifierProvider);
    final appTheme = watch(appThemeChangeNotifierProvider);

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 82,
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  appLocalizations.translate(LocalizationKeys.welcome),
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: LanguagesSwitch(),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 80,
              child: Center(
                child: TextButton(
                  key: WelcomeViewKeys.continueRaisedButtonKey,
                  child: Text(
                    appLocalizations.translate(LocalizationKeys.continueToHome),
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutePaths.homeView, (route) => false);
                  },
                ),
              ),
            ),
            TextButton(
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

class WelcomeViewKeys {
  static final continueRaisedButtonKey = Key("continue_raised_btn_key");
}
