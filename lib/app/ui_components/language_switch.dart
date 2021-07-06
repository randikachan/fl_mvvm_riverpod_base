import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_mvvm_riverpod/app/main_providers.dart';
import 'package:fl_mvvm_riverpod/utils/languages/app_localizations.dart';

class LanguagesSwitch extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var appLanguage = watch(appLanguagePreferencesChangeNotifierProvider);
    var appLocalizations = watch(appLocalizationsChangeNotifierProvider);

    return SizedBox(
      height: 60,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                appLocalizations.translate(LocalizationKeys.contactLanguage),
                style: TextStyle(
                    color: Theme.of(context).primaryTextTheme.headline2!.color,
                    fontFamily: "Open Sans"),
              )),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CupertinoSegmentedControl<int>(
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).unselectedWidgetColor,
              borderColor: Theme.of(context).dividerColor,
              children: _getSegmentedControlWidgets(context),
              onValueChanged: (int value) {
                if (value == 0) {
                  appLocalizations.load(Locale("en", "US"));
                  appLanguage.changeLanguage(Locale("en"));
                } else if (value == 1) {
                  appLocalizations.load(Locale("si", "LK"));
                  appLanguage.changeLanguage(Locale("si"));
                } else {
                  appLocalizations.load(Locale("ta"));
                  appLanguage.changeLanguage(Locale("ta"));
                }
              },
              groupValue: appLanguage.selectedLanguageIndex,
            ),
          )
        ],
      ),
    );
  }

  static Map<int, Widget> _getSegmentedControlWidgets(BuildContext context) {
    final appLocalizations =
        context.read(appLocalizationsChangeNotifierProvider);
    Map<int, Widget> languageWidgets = {
      0: _segmentedControlTitleWidget(
          0, appLocalizations.translate(LocalizationKeys.switchTitleEnglish)),
      1: _segmentedControlTitleWidget(
          1, appLocalizations.translate(LocalizationKeys.switchTitleSinhala)),
      2: _segmentedControlTitleWidget(
          2, appLocalizations.translate(LocalizationKeys.switchTitleTamil))
    };

    return languageWidgets;
  }

  static Widget _segmentedControlTitleWidget(
      int leftMiddleOrRight, String title) {
    BoxDecoration leftBoxDecoration = BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)));
    BoxDecoration rightBoxDecoration = BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15), topRight: Radius.circular(15)));

    BoxDecoration boxDecoration;

    if (leftMiddleOrRight == 0) {
      boxDecoration = leftBoxDecoration;
    } else if (leftMiddleOrRight == 1) {
      boxDecoration = BoxDecoration();
    } else {
      boxDecoration = rightBoxDecoration;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: boxDecoration,
      child: SizedBox(
        width: 70,
        child: Center(
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
