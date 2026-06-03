
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/register_screen.dart';
import 'package:e_commerce/features/onBoarding/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) { 
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      default:
        return null;
    }
  }
}
