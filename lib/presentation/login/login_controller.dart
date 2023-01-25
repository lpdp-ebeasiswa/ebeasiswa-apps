import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:ebeasiswa/presentation/login/login_view.dart';

import '../../app/constant/baseurl.dart';
import '../../data/local/box/box_storage.dart';
import '../bottom_navbar/bottom_navbar_view.dart';
import '../splash_screen/get_token_fcm_controller.dart';

class LoginController extends GetxController {
  String baseurl = MasterUri.baseurl.baseAuth;
  String pathLogin = MasterUri.pathAuth.authLogin;
  var isLoggedin = false.obs;
  var isRemember = false.obs;
  var isPasswordVisible = true.obs;
  String token = '';
  var username = TextEditingController().obs;
  var password = TextEditingController().obs;
  var isTime = ''.obs;
  var isLocalTime = ''.obs;
  var isLocalDate = ''.obs;
  var getToken = Get.find<GetTokenFcmController>();
  final boxstorage = BoxStorage();
  String? fcmToken;

  @override
  void onInit() {
    super.onInit();
    greetingLocalTimes();
    onLoad();
  }

  void greetingLocalTimes() {
    var now = DateTime.now().hour;
    isLocalDate.value =
        DateFormat('EEE, d/M/y').format(DateTime.now()).toString();
    isLocalTime.value =
        DateFormat('HH:mm:ss').format(DateTime.now()).toString();

    if (now >= 11 && now <= 14) {
      isTime.value = 'Selamat Siang';
    }
    if (now >= 15 && now <= 16) {
      isTime.value = 'Selamat Sore';
    }
    if (now >= 17 && now <= 18) {
      isTime.value = 'Selamat Petang';
    }
    if (now >= 19 && now <= 1) {
      isTime.value = 'Selamat Malam';
    }
    if (now >= 2 && now <= 10) {
      isTime.value = 'Selamat Pagi';
    }
  }

  Future<void> getAuth(bool checked) async {
    try {
      final fullUrl = baseurl + pathLogin;
      Map data = {
        'username': username.value.text,
        'password': password.value.text,
      };
      var bodyRequestParam = jsonEncode(data);
      final response = await http.Client().post(Uri.parse(fullUrl),
          headers: {
            "Content-Type": "application/json",
          },
          body: bodyRequestParam);
      final result = jsonDecode(response.body)['token'];
      debugPrint(response.statusCode.toString());
      switch (response.statusCode) {
        case 200:
          boxstorage.setToken(result);
          isLoggedin.value = true;
          token = result;
          onLoadTokenFcm();
          onLoginUser();
          break;
        case 500:
          Get.snackbar('Login Failed', 'Data not found');
          break;
      }
    } on SocketException {
      isLoggedin.value = false;
      Get.snackbar('Login Failed', 'Data not found');
    }
    http.Client().close();
  }

  hidepassword() {
    isPasswordVisible.value
        ? isPasswordVisible.value = false
        : isPasswordVisible.value = true;
  }

  rememberMe() {
    if (isRemember.value == false) {
      isRemember.value = true;
    } else {
      isRemember.value = false;
    }
    onSavedRememberMe(isRemember.value);
  }

  onLoad() {
    isRemember.value = boxstorage.getUserRememberMe();
    if (isRemember.value == true) {
      username.value.text = boxstorage.getUserName();
      password.value.text = boxstorage.getUserPassword();
    }
  }

  onSavedRememberMe(bool uncheck) {
    boxstorage.setUserRememberMe(uncheck);
    if (uncheck == false) {
      boxstorage.deleteUserName();
      boxstorage.deleteUserPassword();
      boxstorage.deleteUserRememberMe();
      debugPrint('on saved');
    } else {
      boxstorage.setUserName(username.value.text);
      boxstorage.setUserPassword(password.value.text);
      debugPrint('on removed');
    }
    debugPrint(
        'saving username : ${username.value.text} - password : ${password.value.text}');
  }

  onLoginUser() {
    if (isLoggedin.value == true) {
      Get.snackbar('Login Success', 'Your Token : $token');
      Get.off(() => const EbeasiswaBottomNavbar());
    } else {
      Get.off(() => const LoginView());
    }
  }

  onLogoutUser() {
    boxstorage.deleteToken();
    debugPrint('token has been deleted');
    Get.off(() => const LoginView());
  }

  onLoadTokenFcm() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user = firestore.collection("user");
    String getStorageToken = boxstorage.getStorageToken();
    String fcmToken = getToken.token!;
    print('token oneSignal---> $fcmToken');
    print('token getStorageToken---> $getStorageToken');
    if (getStorageToken == '') {
      try {
        await user.doc(fcmToken).set({
          'fcmtoken': fcmToken,
          'username': username.value.text,
          'password': password.value.text
        });
        boxstorage.setStoageToken(fcmToken);
        print("token Fcm Berhasil simpan");
      } catch (e) {
        print("Token Fcm Gagal simpan token----> ${e.toString()}");
      }
    } else {
      print("Token Fcm Sudah ada");
    }
  }
}
