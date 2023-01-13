import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../data/local/box/box_storage.dart';

class GetTokenFcmController extends GetxController {
  String? token;

  @override
  void onInit() {
    // TODO: implement onInit
    getToken();
    super.onInit();
  }

  Future getToken() async {
    final boxstorage = BoxStorage();
    String getToken = (await FirebaseMessaging.instance.getToken())!;
    token = getToken;
    String getStorageToken = boxstorage.getStorageToken();
    // boxstorage.deleteStorageToken();
    print('token get ---> $token');
    print('token getStorageToken---> $getStorageToken');
    return token;
  }
}
