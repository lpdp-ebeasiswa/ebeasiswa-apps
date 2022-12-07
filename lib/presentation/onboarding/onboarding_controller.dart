import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
}
