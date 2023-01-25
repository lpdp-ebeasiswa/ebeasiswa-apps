import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class GetTokenFcmController extends GetxController {
  String? token;

  @override
  void onInit() {
    // TODO: implement onInit
    getToken();
    super.onInit();
  }

  Future getToken() async {
    // final boxstorage = BoxStorage();
    OneSignal.shared.getDeviceState().then((deviceState) {
      print("oneSignal DeviceState ----->: ${deviceState?.pushToken}");
      token = deviceState?.pushToken;
      OneSignal.shared.setExternalUserId(token ?? '').then((results) {
        print('oneSignal setExternalId Succes ------> ${results.toString()}');
      }).catchError((error) {
        print('oneSignal setExternalId error ------> ${error.toString()}');
      });
      print('token get aaaa---> $token');
    });
    return token;
  }
}
