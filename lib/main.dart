import 'package:flutter/material.dart';
import 'l10n/l10n.dart' as l10n;

import 'screens/splash_screen.dart';
import 'utils/theme/theme.dart';

void main() {
  runApp(const MostBetApp());
}

class MostBetApp extends StatelessWidget {
  const MostBetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: l10n.AppLocalizations.supportedLocales,
      localizationsDelegates: l10n.AppLocalizationsX.localizationsDelegates,
      locale: l10n.LocaleEnglish,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
