import 'package:benaiah_okwukwe_anukem/features/onboarding/app/providers/on_boarding_controller.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/presentation/widgets/on_boarding_body.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/presentation/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  static const routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<OnBoardingController>(
      builder: (_, controller, __) {
        return Scaffold(
          body: Stack(
            children: [
              PageView(
                controller: controller.pageController,
                children: [
                  OnBoardingBody(board: controller.boards[0]),
                  OnBoardingBody(board: controller.boards[1]),
                  OnBoardingBody(board: controller.boards[2]),
                ],
              ),
              Positioned(
                bottom: height * 0.17,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    onDotClicked: controller.setCurrentPage,
                    effect: WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 20,
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: height * 0.08,
                left: 0,
                right: 0,
                child: const OnBoardingButton(),
              ),
            ],
          ),
        );
      },
    );
  }
}
