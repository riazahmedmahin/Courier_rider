import 'package:app/presentation/ui/screens/splash_screen.dart';
import 'package:app/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:get/get.dart';

class Prathinidhi_rider extends StatelessWidget {
  const Prathinidhi_rider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      home: SplashScreen(),
    );
  }
}
