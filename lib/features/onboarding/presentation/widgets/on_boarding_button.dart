import 'package:benaiah_okwukwe_anukem/core/services/cache_service.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/login_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/app/providers/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingButton extends StatefulWidget {
  const OnBoardingButton({super.key});

  @override
  State<OnBoardingButton> createState() => _OnBoardingButtonState();
}

class _OnBoardingButtonState extends State<OnBoardingButton> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OnBoardingController>().pageController.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingController>(
      builder: (_, controller, __) {
        return Center(
          child: ElevatedButton(
            onPressed: () {
              if (controller.currentPage == 2) {
                CacheService.setFirstTime();
                Navigator.of(context).pushReplacementNamed(
                  LoginScreen.routeName,
                );
              } else {
                controller.nextPage();
              }
            },
            child: Text(
              controller.currentPage == 2
                  ? 'Get Started'
                  : 'Next',
            ),
          ),
        );
      },
    );
  }
}
