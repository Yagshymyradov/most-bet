import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/service/preferences.dart';
import 'l10n/l10n.dart' as l10n;
import 'provider.dart';
import 'screens/splash_screen.dart';
import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPrefs = await SharedPreferences.getInstance();

  final riverpodRootContainer = ProviderContainer(
    overrides: [
      appPrefsServiceProvider.overrideWithValue(AppPrefsService(sharedPrefs)),
    ],
  );

  final assembledContainer = riverpodRootContainer;

  runApp(
    ProviderScope(
      parent: assembledContainer,
      child: const MostBetApp(),
    ),
  );
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
