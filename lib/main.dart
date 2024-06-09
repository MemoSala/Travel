// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'core/constant/app_colors.dart';
import 'core/constant/app_routes.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ar', 'AE'),
      title: 'Travel',
      theme: ThemeData(
        fontFamily: "ElMessiri",
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: const TextStyle(
                color: AppColors.primary,
                fontSize: 24,
                fontFamily: "ElMessiri",
                fontWeight: FontWeight.bold,
              ),
              headlineLarge: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: "ElMessiri",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: AppRoutes.home,
      getPages: routes,
    );
  }
}
