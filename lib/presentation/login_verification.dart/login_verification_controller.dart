import 'package:get/get.dart';

import '../bottom_navbar/bottom_navbar_view.dart';

class LoginVerificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loaddummyverification();
  }

  @override
  void onClose() {
    validationString.close();
    super.onClose();
  }

  var validationString = ''.obs;
  var validationCount = 0.obs;

  loaddummyverification() async {
   await Future.delayed(const Duration(seconds: 3), ()  {
      validationString.value = 'mencoba masuk ..';
      validationCount.value = 1;
    });
   await Future.delayed(const Duration(seconds: 2), () {
      validationString.value = 'validasi user ..';
       validationCount.value = 2;
    });
   await Future.delayed(const Duration(seconds: 3), () {
      validationString.value = 'sukses masuk ke aplikasi ..';
       validationCount.value = 3;
    });
     Get.off(() => const EbeasiswaBottomNavbar());
  }
}
