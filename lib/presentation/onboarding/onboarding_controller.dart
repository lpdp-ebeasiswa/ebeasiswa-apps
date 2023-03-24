import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../login/login_view.dart';
import '../login_verification.dart/login_verification_view.dart';

class OnboaringController extends GetxController {
  late PageController pageController;
  var pageIndex = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);

    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  nextPage() {
    pageIndex.value != 2
        ? pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease)
        : Get.to(const LoginView());
  }

  previousPage(){
    pageController.previousPage( duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
   
  closePage(){
    Get.off(const LoginView());
  }
}
