import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../login/login_view.dart';

class OnboaringController extends GetxController {
  late PageController pageController;
  int pageIndex = 0;

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
    pageIndex != 2
        ? pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease)
        : Get.to(const LoginView());
  }
}
