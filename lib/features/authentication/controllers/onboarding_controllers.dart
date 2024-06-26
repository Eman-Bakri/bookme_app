import 'package:bookme_app/features/authentication/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {

  static  OnBoardingController get instance => Get.find();

  /// --- Vars
  final pageController = PageController();
  final currentPageIndex = 0.obs;

  /// --- Update index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// --- Move to the specified dot page
  void dotMoveClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// --- skip the page, to the last
  void skipPage() {
    currentPageIndex.value = 2; /// since we have 3 screens
    pageController.jumpToPage(2); /// jump to last screen no.2
  }
  /// --- next page
  void nextPage() {
  if (currentPageIndex.value == 2){
    Get.offAll(const LoginScreen());
  } else {
    int page = currentPageIndex.value +1;
    pageController.jumpToPage(page);
  }
  }
}