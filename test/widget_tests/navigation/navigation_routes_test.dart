import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fl_mvvm_riverpod/app/route_generator.dart';
import 'package:fl_mvvm_riverpod/app/main_providers.dart';
import 'package:fl_mvvm_riverpod/services/shared_preferences_service.dart';
import 'package:fl_mvvm_riverpod/app/ui/home/home_view.dart';
import 'package:fl_mvvm_riverpod/app/ui/welcome_view.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation_routes_test.mocks.dart';

@GenerateMocks([],
    customMocks: [MockSpec<NavigatorObserver>(returnNullOnMissingStub: true)])
void main() {
  group('Route Generator Test - Splash View to Home View navigation tests', () {
    testWidgets('generateRoute test', (tester) async {
      final mockObserver = MockNavigatorObserver();

      /// Initialize sharedPreferences with initial data
      SharedPreferences.setMockInitialValues(
          {SharedPreferencesService.languageCodeKey: "en"});

      final sharedPreferences = await SharedPreferences.getInstance();

      final app = ProviderScope(
        overrides: [
          sharedPreferencesServiceProvider.overrideWithValue(
            SharedPreferencesService(sharedPreferences),
          ),
        ],
        child: MaterialApp(
          initialRoute: '/',
          navigatorObservers: [mockObserver],
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      );

      /// by doing this, app will kick start show the Splash screen for 5 seconds
      await tester.pumpWidget(app);

      /// Await for 6 seconds to make the transition into Welcome View
      await tester.pump(new Duration(seconds: 6));
      await tester.pumpAndSettle();

      /// Verify that a push event happened
      verify(mockObserver.didPush(any, any));

      /// Verify that if Continue button is there in the Welcome screen
      expect(
          find.byKey(WelcomeViewKeys.continueRaisedButtonKey), findsOneWidget);

      final changeLangToSinhalaFinder = find.text("සිංහල");
      expect(changeLangToSinhalaFinder, findsOneWidget);

      /// Tap on the Change Language to Sinhala button
      await tester.tap(changeLangToSinhalaFinder);
      await tester.pumpAndSettle();

      expect(
          find.text("ඉදිරියට යමු"), findsOneWidget);

      final continueButtonFinder = find.byKey(WelcomeViewKeys.continueRaisedButtonKey);
      expect(continueButtonFinder, findsOneWidget);

      /// Tap on the continue button
      await tester.tap(continueButtonFinder);
      await tester.pumpAndSettle();

      /// Verify that a push event happened
      verify(mockObserver.didPush(any, any));

      /// You'd also want to be sure that your page is now
      /// present in the screen.
      expect(find.byType(HomeView), findsOneWidget);

      final toggleButtonFinder = find.byKey(HomeViewKeys.toggleThemeTextButtonKey);
      expect(toggleButtonFinder, findsOneWidget);

      /// Tap on the continue button
      await tester.tap(toggleButtonFinder);
      await tester.pumpAndSettle();
    });
  });
}
