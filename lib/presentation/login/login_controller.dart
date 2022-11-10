import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'package:ebeasiswa/presentation/login/login_view.dart';

import '../../app/constant/baseurl.dart';
import '../home/home_view.dart';

class LoginController extends GetxController {

  final box = GetStorage();

  String baseurl = MasterUri.baseurl.baseAuth;
  String pathLogin = MasterUri.pathAuth.authLogin;
  var isLoggedin = false.obs;
  String token = '';

  Future<void> getAuth(String username, String password) async {
    try {
      final fullUrl = baseurl+pathLogin;
      Map data = {
        'username': username,
        'password': password,
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
          box.write('token', result);
          isLoggedin.value = true;
          token = result;
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
  

   onLoginUser() {
    if (isLoggedin.value == true) {
      Get.snackbar('Login Success', 'Your Token : $token');
      Get.off(() => const HomeView());
    } else {
      Get.off(() => const LoginView());
    }
    // getAuth( 'smeb', 'pass123');
  }

  onLogoutUser(){
    box.remove('token');
    debugPrint('token has been deleted');
    Get.off(() => const LoginView());
  }
}
