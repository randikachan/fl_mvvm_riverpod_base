# Flutter MvVM Base Architecture based on Riverpod

This Flutter project is an implementation of **MvVM Architecture** based on **[RiverPod](https://riverpod.dev/)**.

Purpose of this project is to demonstrate how we can implement Flutter apps with **MvVM app architecture** using RiverPod package (if you are familiar with **Provider** package, RiverPod is 2.0 of Provider package).

## Sample App Overview
Here in this Flutter mobile app, within 4-5 screens, it will demonstrate following concepts:

#### Features:
- Sample implementation of `onRouteGenerator` mechanism
- Splash screen
	- Vanilla Flutter implementation
- Welcome Screen
	- Mimics App on-boarding
	- Language Switch [English, Sinhala and Tamil]
	- App localization and Language Switcher
	- Light/Dark Theme Switch
- Home Screen
	- Sample screen with REST API Integration
- Sample screen with Firebase FireStore Integration
- Sample implementation of Google Firebase Analytics
- How to write Tests for an app with RiverPod
	- Unit Tests,
	- Widget Tests
	- UI Automation Tests

By checking out this sample app you can learn from the source code itself (**or else** discuss on how to do some of it better via Pull Requests).

## App Structure
This app was made to demonstrate an approach of State management through implementing MvVM along with the capabilities of RiverPod package.

##### Project File Structure:
```
/fl_mvvm_riverpod
  /assets
      /fonts					----> Font files
      /languages				----> JSON files for each localized languages
  /lib
      /app
          /theme
             /app_theme.dart			----> Implemented with ChangeNotifier Mixin
          /ui					----> All screen widget implementation goes here
          /ui_components			----> All the Common UI Widgets go here
          -main_providers.dart			----> Main Provider declarations go here
          -route_generator.dart			----> Routes table that is consumed by Flutter App
      /services
	 -shared_preferences_service.dart	----> Shared Preference Key-Value pairs
      /utils
         /languages
	       -app_language_preferences.dart	--> Implemented with ChangeNotifier Mixin
	       -app_localizations.dart		--> Implemented with ChangeNotifier Mixin and LocalizationsDelegate
         -console_logger.dart
      -main.dart				--> main function where the App widget is wrapped in ProviderScope widget
  /test
      /unit_tests
      /widget_tests
```
##### Packages used for the above implementation:
```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

  flutter_riverpod: ^0.14.0+3
  shared_preferences: 2.0.6
  logger: ^1.0.0
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.0.10
  build_runner: ^2.0.5
```
