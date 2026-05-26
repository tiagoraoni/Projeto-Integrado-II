import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/trash/pages/home_page.dart';

class SmartTrashApp extends StatelessWidget {
  const SmartTrashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Trash',
      theme: AppTheme.theme,
      home: const HomePage(),
    );
  }
}