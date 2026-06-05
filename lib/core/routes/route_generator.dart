import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/search_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/new_password_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/register_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/verify_code_screen.dart';
import 'package:e_commerce/core/main_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:e_commerce/features/onBoarding/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );  
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );
      case Routes.verifyCode:
        return MaterialPageRoute(
          builder: (context) => const VerifyCodeScreen(),
        );
      case Routes.newPassword:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
        );
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen()); 
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());   
      case Routes.verifyEmail:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VerifyEmailScreen(email: email),
        );
      default:
        return null;
    }
  }
}
