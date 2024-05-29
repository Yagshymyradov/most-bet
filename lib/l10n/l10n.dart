// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_l10n.dart';
import 'package:flutter_gen/gen_l10n/app_l10n_en.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_l10n.dart';

const String LocaleCodeEnglish = 'en';

const Locale LocaleEnglish = Locale(LocaleCodeEnglish);

const Locale FallbackLocale = LocaleEnglish;

Locale _forcedAppLocale = FallbackLocale;

Locale get forcedAppLocale => _forcedAppLocale;

set forcedAppLocale(Locale locale) {
  assert(AppLocalizations.supportedLocales.contains(locale));

  _forcedAppLocale = locale;
}

Locale toSupportedLocaleByCode(String? localeCode) {
  if (localeCode == null) {
    return FallbackLocale;
  }

  const locales = AppLocalizations.supportedLocales;
  final index = locales.indexWhere((locale) => locale.languageCode == localeCode);
  if (index == -1) return FallbackLocale;
  return locales[index];
}

extension AppLocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension AppLocalizationsX on AppLocalizations {
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  String monthShortName(int index) {
    switch (index) {
      case 1:
        return januaryShort;
      case 2:
        return februaryShort;
      case 3:
        return marchShort;
      case 4:
        return aprilShort;
      case 5:
        return mayShort;
      case 6:
        return juneShort;
      case 7:
        return julyShort;
      case 8:
        return augustShort;
      case 9:
        return septemberShort;
      case 10:
        return octoberShort;
      case 11:
        return novemberShort;
      case 12:
        return decemberShort;
      default:
        throw ArgumentError();
    }
  }

  static String getLocaleName(Locale locale) {
    switch (locale.languageCode) {
      case LocaleCodeEnglish:
        return AppLocalizationsEn().nativeLocaleName;
    }

    assert(false, 'unsupported locale "$locale"');
    return locale.toString();
  }
}
