import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/auth_controller.dart';
import 'data/service/preferences.dart';

final appPrefsServiceProvider = Provider<AppPrefsService>(
  (ref) => throw UnimplementedError("Can't use this provider without overriding it's value."),
);

final authControllerProvider = StateNotifierProvider<UserStateController, UserState?>(
  (ref) {
    final appPrefs = ref.watch(appPrefsServiceProvider);
    final initialState = UserStateController.initialState(appPrefs);
    return UserStateController(appPrefs, initialState);
  },
  dependencies: [appPrefsServiceProvider],
);
