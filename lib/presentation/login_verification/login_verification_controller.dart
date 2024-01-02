import 'dart:convert';

import 'package:ebeasiswa/data/model/userBeasiswa/userBeasiswa_model.dart';
import 'package:ebeasiswa/presentation/login/login_view.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../data/local/box/box_storage.dart';
import '../../data/model/userInfoBeasiswa/userInfoBeasiswa_model.dart';
import '../../data/model/userProfil/user_profile_model.dart';
import '../../data/remote/ebeasiswa/authentication/authentication_datasource.dart';
import '../bottom_navbar/bottom_navbar_view.dart';

class LoginVerificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    validationString.close();
    super.onClose();
  }

  final boxStorage = BoxStorage();
  var validationString = ''.obs;
  var validationCount = 0.0.obs;

  AuthenticationDataSource authenticationDataSource =
      AuthenticationDataSource();
  var isLoadSliper = false.obs;

  loaddummyverification() async {
    await Future.delayed(const Duration(seconds: 3), () {
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
    // Get.off(() => const EbeasiswaBottomNavbar());
  }

  String? token;

  Future<bool> getAuth(
      {required bool isremember,
      required String email,
      required String password}) async {
    await Future.delayed(const Duration(seconds: 1), () {
      validationString.value = 'mencoba masuk ..';
      validationCount.value = 0.1;
    });
    Map<String, String> requestBody = {
      //'email': 'paula.aprijanto@gmail.com',
      //'password': 'P@ssw0rd',
      'email': email,
      'password': password,
      //  'email': 'dewianggreni06@yahoo.co.id',
      // 'password': 'P@ssw0rd',
    };
    await Future.delayed(const Duration(seconds: 1), () {
      validationString.value = 'menghubungkan ke server';
      validationCount.value = 0.2;
    });

    final response = await authenticationDataSource.loginUser(requestBody);
    await Future.delayed(const Duration(seconds: 1), () {
      validationString.value = 'berhasil menghubungkan ke server';
      validationCount.value = 0.3;
    });
    debugPrint('clog = response : $response');
    if (response != null && response['status'] != false) {
      isLoadSliper.value = true;
      String token = response['data']['access_token'];
      await Future.delayed(const Duration(seconds: 1), () {
        validationString.value = 'mendapatkan kredensial';
        validationCount.value = 0.5;
      });
      boxStorage.setUserToken(token);
      UserProfile userBeasiswaModel = await getProfile(token: token);
      await Future.delayed(const Duration(seconds: 1), () {
        validationString.value = 'mendapatkan profil ebeasiswa';
        validationCount.value = 0.6;
      });
      await Future.delayed(const Duration(seconds: 1), () {
        validationString.value =
            'selamat datang kembali ${userBeasiswaModel.email}';
        validationCount.value = 0.7;
      });
      if (email == 'dewianggreni06@yahoo.co.id') {
        boxStorage.setUserName(userBeasiswaModel.email!);
      }
      await Future.delayed(const Duration(seconds: 2), () {
        Get.off(() => EbeasiswaBottomNavbar(
              userprofile: userBeasiswaModel,
            ));
      });

      validationCount.value = 1;
      return true;
    } else {
      Get.snackbar('${response['status']}', '${response['message']}');
      await Future.delayed(const Duration(seconds: 3));
      validationCount.value = 1;
      Get.off(() => const LoginView());
      return false;
    }
  }

  Future<UserProfile> getProfile({required String token}) async {
    print('get token : $token');
    final response = await authenticationDataSource.profileUser(token: token);
    print('get response : $response');
    if (response != null) {
      await Future.delayed(const Duration(seconds: 2));

      UserProfile userBeasiswaModel = UserProfile.fromJson(response['data']);
      print('saving ${userBeasiswaModel.namaLengkap}');
      boxStorage.setUserData(userBeasiswaModel);

      return userBeasiswaModel;
    } else {
      Get.snackbar('Error', 'mohon coba kembali');
      return UserProfile.fromJson(jsonDecode('source'));
    }
  }
}
