import 'package:flutter/material.dart';

import '../../Features/Spalsh/Presentation/View/splash_view.dart';
import '../../Features/auth/presentation/views/signup_view.dart';
import '../../Features/auth/presentation/views/signin_view.dart';
import '../../Features/best_selling/presentation/views/best_selling_view.dart';
import '../../Features/home/presentation/views/main_view.dart';
import '../../Features/onboarding/presentation/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainView.routeName:
      return MaterialPageRoute(
        builder: (_) => const MainView(),
      );
    case SignupView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignupView(),
      );
      case BestSellingView.routeName:
      return MaterialPageRoute(
        builder: (_) => const BestSellingView(),
      );
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
      );
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
      );
    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}
