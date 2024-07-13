import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/api_client.dart';
import 'data/auth_controller.dart';
import 'data/json_http_client.dart';
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

final apiBaseUrlProvider = Provider((ref) => 'https://appstorage.org/api/');

final httpClientProvider = Provider(
  (ref) {
    final httpClient = JsonHttpClient();

    ref.listen(
      apiBaseUrlProvider,
      (previous, next) {
        final apiBaseUrl = next;
        httpClient.dio.options.baseUrl = apiBaseUrl;
      },
      fireImmediately: true,
    );

    return httpClient;
  },
  dependencies: [apiBaseUrlProvider],
);

final apiClientProvider = Provider(
  (ref) => ApiClient(ref.watch(httpClientProvider)),
  dependencies: [httpClientProvider],
);
