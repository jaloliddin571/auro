import 'package:flutter/material.dart';

import 'app_theme.dart';
import '../features/home/presentation/home_screen.dart';

class AuroApp extends StatelessWidget {
  const AuroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const HomeScreen(),
    );
  }
}
