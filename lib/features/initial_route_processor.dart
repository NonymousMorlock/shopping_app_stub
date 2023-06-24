import 'package:benaiah_okwukwe_anukem/core/common/views/loading_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/login_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/app/providers/products_controller.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/views/home_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/app/providers/on_boarding_controller.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/app/providers/route_notifier.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialRouteProcessor extends StatelessWidget {
  const InitialRouteProcessor({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Consumer<RouteNotifier>(
      builder: (_, notifier, __) {
        if (notifier.login == null) {
          return const LoadingScreen();
        }
        return notifier.isFirstTime
            ? ChangeNotifierProvider(
                create: (_) => OnBoardingController(),
                child: const OnBoardingScreen(),
              )
            : notifier.login!
                ? const LoginScreen()
                : ChangeNotifierProvider(
                    create: (_) => ProductsController(),
                    child: const HomeScreen(),
                  );
      },
    );
  }
}
