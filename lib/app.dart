import 'package:flutter/material.dart';
import 'package:khtwat_project/config/theme/app_theme.dart';
import 'package:khtwat_project/presntation/view/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: const LoginScreen(),
    );
  }
}
