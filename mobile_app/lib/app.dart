import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'features/trash/pages/home_page.dart';
import 'providers/trash_provider.dart';

class SmartTrashApp extends StatelessWidget {
  const SmartTrashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TrashProvider()..connect(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Trash',
        theme: AppTheme.theme,
        home: const HomePage(),
      ),
    );
  }
}