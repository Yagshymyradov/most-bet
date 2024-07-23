import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/notes_model.dart';
import 'data/service/preferences.dart';
import 'data/statistic_model.dart';
import 'data/workout_history_model.dart';
import 'l10n/l10n.dart' as l10n;
import 'provider.dart';
import 'screens/home_screen/home.dart';
import 'utils/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(WorkoutHistoryModelAdapter());
  Hive.registerAdapter(EmotionsAdapter());

  Hive.registerAdapter(StatisticModelAdapter());
  Hive.registerAdapter(MonthAdapter());

  Hive.registerAdapter(NotesModelAdapter());

  await Hive.openBox<WorkoutHistoryModel>('workout_history');
  await Hive.openBox<StatisticModel>('statistic');
  await Hive.openBox<NotesModel>('notes');
  await Hive.openBox<NotesModel>('favorite_notes');

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
      home: const Home(),
    );
  }
}
