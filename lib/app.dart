import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/providers/notification_provider.dart';
import 'core/theme/app_theme.dart';

class CardFanApp extends ConsumerWidget {
  const CardFanApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationService = ref.watch(notificationServiceProvider);
    if (notificationService.supportsNotifications &&
        !notificationService.supportsOfflineScheduling) {
      ref.watch(runtimeReminderServiceProvider);
    }
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Card Fan',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      locale: const Locale('zh'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('zh'), Locale('en')],
      routerConfig: router,
    );
  }
}
