import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techrar/core/services/theme/app_theme.dart';
import 'package:techrar/features/parent/parent_screen.dart';

import 'core/global/globals.dart';
import 'core/services/network/vpn/vpn_proxy_checker.dart';
import 'core/services/theme/theme_provider.dart';
import 'features/warnings/presentation/view/screen/main_screen.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vpnBlocked = ref.watch(vpnGuardProvider);

    final themeMode = ref.watch(themeControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home:
          vpnBlocked.value == true
              ? ProxyDetectionScreen()
              : vpnBlocked.isLoading
              ? Scaffold(body: Center(child: CircularProgressIndicator()))
              : ParentScreen(),
    );
  }
}
