import 'package:flutter/material.dart';

import 'constants/theme.dart';
import 'routing/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'African Explorer',
      // Tokens live in lib/constants/theme.dart, mirroring the Figma
      // `African Explorer` variable collection. Colors that Material's
      // ColorScheme has no slot for are read via
      // `Theme.of(context).extension<AppColors>()!`.
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
