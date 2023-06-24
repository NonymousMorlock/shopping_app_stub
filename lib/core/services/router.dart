import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/create_new_password_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/forgot_password_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/login_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/otp_verification_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/sign_up_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/home/models/product.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/app/providers/products_controller.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/views/home_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/views/product_details_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/initial_route_processor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case InitialRouteProcessor.routeName:
      return _pageBuilder(
        (context) => const InitialRouteProcessor(),
        settings: settings,
      );
    case LoginScreen.routeName:
      return _pageBuilder(
        (context) => const LoginScreen(),
        settings: settings,
      );
    case SignUpScreen.routeName:
      return _pageBuilder(
        (context) => const SignUpScreen(),
        settings: settings,
      );
    case ForgotPasswordScreen.routeName:
      return _pageBuilder(
        (context) => const ForgotPasswordScreen(),
        settings: settings,
      );
    case OTPVerificationScreen.routeName:
      return _pageBuilder(
        (context) => OTPVerificationScreen(
          email: settings.arguments! as String,
        ),
        settings: settings,
      );
    case CreateNewPasswordScreen.routeName:
      return _pageBuilder(
        (context) => CreateNewPasswordScreen(
          email: settings.arguments! as String,
        ),
        settings: settings,
      );
    case HomeScreen.routeName:
      return _pageBuilder(
        (context) => ChangeNotifierProvider(
          create: (_) => ProductsController(),
          child: const HomeScreen(),
        ),
        settings: settings,
      );
      case ProductDetailsScreen.routeName:
      return _pageBuilder(
        (context) => ProductDetailsScreen(settings.arguments! as Product),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
        settings: settings,
      );
  }
}

MaterialPageRoute<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return MaterialPageRoute<dynamic>(
    settings: settings,
    builder: page,
  );
}

PageRouteBuilder<dynamic> _pageBuilder2(
    Widget Function(BuildContext) page, {
      required RouteSettings settings,
    }) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, _, __) {
      return page(context);
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
