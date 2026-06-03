import 'dart:async';
import 'package:e_commerce/core/app_preferences.dart';
import 'package:e_commerce/core/app_theme.dart';
import 'package:e_commerce/core/routes/route_generator.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();

  runApp(
    ECommerceApp (),
  );
}

class ECommerceApp  extends StatelessWidget {
  const ECommerceApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: AppPreferences.onboardingViewed ? Routes.login : Routes.onBoarding,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}