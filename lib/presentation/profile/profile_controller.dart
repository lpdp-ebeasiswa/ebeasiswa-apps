import 'package:ebeasiswa/presentation/profile/profile_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  ServicesProfile servicesProfile = ServicesProfile();

  @override
  void onInit() {
    getDataDetail();
    print("Kepanggil Otomatis di Dana");
    super.onInit();
  }

  Future getDataDetail() async {
    var result = await servicesProfile.getDetailProfile();

    debugPrint('ini isinya apa =====> $result');
  }
}
