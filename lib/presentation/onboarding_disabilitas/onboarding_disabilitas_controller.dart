import 'dart:async';

import 'package:ebeasiswa/data/local/box/box_storage.dart';
import 'package:get/get.dart';

import '../login/login_view.dart';

class OnboardingDisabilitasController extends GetxController {
  Timer? timer;
  var remainSeconds = 0.obs;
  final time = ''.obs;

  final BoxStorage boxStorage = BoxStorage();

  @override
  void onInit() {
    super.onInit();
    // startTimer(10);
  }

  @override
  void onClose() {
    super.onClose();
  }

  startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds.value = seconds;
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainSeconds.value == 0) {
        timer.cancel();
        setDisabilitasMode(false);
        Get.offAll(const LoginView());
      } else {
        int minutes = remainSeconds.value ~/ 60;
        int seconds = remainSeconds.value % 60;
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
        print(remainSeconds.value);
      }
    });
  }

  setDisabilitasMode(bool value) {
    boxStorage.setDisabilitasRole(value);
  }
}
