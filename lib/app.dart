import 'package:flutter/material.dart';
import 'package:khtwat_project/config/theme/app_theme.dart';
import 'package:khtwat_project/core/utils/app_colors.dart';
import 'package:khtwat_project/core/utils/style_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: const Tester(),
    );
  }
}

class Tester extends StatelessWidget {
  const Tester({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.abc,
          color: AppColors.background,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "احمد حسام مصطفي المتولي",
                style: getBoldStyle(color: AppColors.primary),
              ),
              Container(
                color: AppColors.background,
                height: 1,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
