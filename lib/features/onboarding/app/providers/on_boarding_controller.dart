import 'package:benaiah_okwukwe_anukem/core/res/media_res.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/models/on_board.dart';
import 'package:flutter/cupertino.dart';

class OnBoardingController extends ChangeNotifier {
  final pageController = PageController();

  int get currentPage =>
      !pageController.hasClients ? 0 : pageController.page?.round() ?? 0;

  final List<OnBoard> boards = [
    OnBoard(
      image: MediaRes.firstSlide,
      title: 'We provide high quality products just for you',
    ),
    OnBoard(
      image: MediaRes.secondSlide,
      title: 'Your satisfaction is our number one priority',
    ),
    OnBoard(
      image: MediaRes.thirdSlide,
      title: "Let's fulfill your house needs with our products",
    ),
  ];

  void setCurrentPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  void onPageChanged(int page) {
    setCurrentPage(page);
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
