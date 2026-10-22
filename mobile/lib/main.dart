import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';
import 'screens/home_shell.dart';
import 'screens/onboarding.dart';
import 'state/app_state.dart';

void main() {
  // On the web build, `?screen=...&lang=...` opens a given screen directly.
  // Used for the demo link and for the screenshots in docs/prototype/.
  runApp(WeightAssistantApp(
      state: AppState()..applyDemoLink(Uri.base.queryParameters)));
}

class WeightAssistantApp extends StatelessWidget {
  const WeightAssistantApp({super.key, required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return AppScope(
      state: state,
      child: ListenableBuilder(
        listenable: state,
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          locale: state.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D6B)),
            useMaterial3: true,
          ),
          home: switch (state.stage) {
            Stage.language => const LanguageScreen(),
            Stage.consent => const ConsentScreen(),
            Stage.screening => const ScreeningScreen(),
            Stage.result => const ScreeningResultScreen(),
            Stage.app => const HomeShell(),
          },
        ),
      ),
    );
  }
}
