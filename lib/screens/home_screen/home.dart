import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../provider.dart';

final configProvider = FutureProvider((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return apiClient.config();
});

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final webViewController = WebViewController();
  @override
  Widget build(BuildContext context) {
    final config = ref.watch(configProvider);

    return Scaffold(
      body: config.when(
        data: (data) {
          return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.codeTech),
            Text(data.lastDate),
            Text(data.server1_0),
            Text(data.url_link),
            Text(data.isAllChangeURL),
            Text(data.isDead),
            Text(data.token.toString()),
          ],
        );
        },
        error: (error, stack) {
          log(stack.toString());
          return Center(child: Text(error.toString()));
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
