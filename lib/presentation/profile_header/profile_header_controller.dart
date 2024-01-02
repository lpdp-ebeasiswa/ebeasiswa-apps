import 'package:get/get.dart';

import '../../data/local/box/box_storage.dart';
import '../../data/model/userBeasiswa/userBeasiswa_model.dart';
import '../../data/model/userProfil/user_profile_model.dart';

class ProfileHeaderController extends GetxController {

   @override
  void onInit() {
    super.onInit();
    //onLoadUserInfo();
  }

  final boxStorage = BoxStorage();

  var username = ''.obs;

  onLoadUserInfo(){
   UserProfile userBeasiswaModel  = boxStorage.getUserData();
   print(userBeasiswaModel);
    username.value = userBeasiswaModel.namaLengkap ?? '';
  }


}