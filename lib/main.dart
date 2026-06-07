import 'dart:async';
import 'package:e_commerce/core/app_bloc_observer.dart';
import 'package:e_commerce/core/app_preferences.dart';
import 'package:e_commerce/core/app_theme.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/routes/route_generator.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
<<<<<<< Updated upstream
  WidgetsFlutterBinding.ensureInitialized(); 
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
=======
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await configureDependancies();
>>>>>>> Stashed changes
  await AppPreferences.init();
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator.get<AuthCubit>()),
      ],
      child: ScreenUtilInit(
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
=======
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes
            .main, // AppPreferences.onboardingViewed ? Routes.login : Routes.onBoarding,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
>>>>>>> Stashed changes
      ),
    );
  }
}
