import 'package:bmi_app/core/config/router/app_routes_name.dart';
import 'package:bmi_app/modules/auth/presentation/screens/sign_in_screen.dart';
import 'package:bmi_app/modules/auth/presentation/screens/register_screen.dart';
import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';
import 'package:bmi_app/modules/bmi_calculator/presentaion/screens/bmi_calculator_screen.dart';
import 'package:bmi_app/modules/layout/presentation/screens/layout_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signIn:
        return _createRoute(const SignInScreen());
      case AppRoutes.layoutScreen:
        return _createRoute(const LayoutScreen());
      case AppRoutes.bmiCalculator:
        return _createRoute(const BmiCalculatorScreen());
      default:
        return _createRoute(const SignInScreen());
    }
  }

  PageRoute _createRoute(Widget screen) => PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
