import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techrar/service_locator.dart';

import 'app.dart';
import 'core/services/localization/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inject services
  await initServices();
  await EasyLocalization.ensureInitialized();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: AppLocalization.getSupportedLocales,
        path: AppLocalization.getPath,
        fallbackLocale: AppLocalization.fallbackLocale,
        startLocale: AppLocalization.startLocale,
        saveLocale: true,
        child: const MyApp(),
      ),
    ),
  );
}
