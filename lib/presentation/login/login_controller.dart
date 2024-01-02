import 'dart:convert';
import 'dart:io';

import 'package:ebeasiswa/data/model/userProfil/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:ebeasiswa/presentation/login/login_view.dart';

import '../../app/constant/baseurl.dart';
import '../../data/local/box/box_storage.dart';
import '../../data/remote/ebeasiswa/authentication/authentication_datasource.dart';
import '../account/account_view.dart';
import '../bottom_navbar/bottom_navbar_view.dart';
import '../login_verification/login_verification_view.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  final boxStorage = BoxStorage();

  String baseurl = MasterUri.baseurl.baseAuth;
  String pathLogin = MasterUri.pathAuth.authLogin;
  var isLoggedin = false.obs;
  var isLoading = false.obs;
  var isRemember = false.obs;
  var isPasswordVisible = true.obs;
  String token = '';
  var username = TextEditingController().obs;
  var password = TextEditingController().obs;
  var isTime = ''.obs;
  var isLocalTime = ''.obs;
  var isLocalDate = ''.obs;

    AuthenticationDataSource authenticationDataSource =
      AuthenticationDataSource();

  @override
  void onInit() {
    super.onInit();
    greetingLocalTimes();
    //onLoad();
  }

  void greetingLocalTimes() {
    var now = DateTime.now().hour;
    isLocalDate.value = DateFormat('EEE, d/M/y').format(DateTime.now()).toString();
    isLocalTime.value = DateFormat('HH:mm:ss').format(DateTime.now()).toString();

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

  Future<bool> getAuth({required bool isremember, required String email, required String password}) async {
      //Get.off(() =>const AccountView());
     Map<String,String> requestBody = {
      //'email': 'paula.aprijanto@gmail.com',
      //'password': 'P@ssw0rd',
       'email': email,
       'password': password,
      //  'email': 'dewianggreni06@yahoo.co.id',
       // 'password': 'P@ssw0rd',
    };

    isLoading.value = true;
   

    final response = await authenticationDataSource.loginUser(requestBody);
    debugPrint('clog = response : $response');
     if (response != null &&
        response['status'] != 'error') {
      await Future.delayed(const Duration(seconds: 2));
        String token = response['data']['access_token'];
        boxStorage.setUserToken(token);
        UserProfile userBeasiswaModel = await getProfile(token: token);
        if(email == 'dewianggreni06@yahoo.co.id'){
          boxStorage.setUserName(userBeasiswaModel.email!);
        }
        print('get profile sukses');
        print('go to nav bar');
        Get.off(() =>  EbeasiswaBottomNavbar(userprofile: userBeasiswaModel,));
       return true;
      } else{
        Get.snackbar('${response['status']}', '${response['message']}');
        return false;
      }
  }

 Future<UserProfile> getProfile({required String token})async{
    print('get token : $token');
    final response = await authenticationDataSource.profileUser(token: token);
    print('get response : $response');
     if (response != null) {
      await Future.delayed(const Duration(seconds: 2));
        //Map result = response['data'];
        //Map userData = result['infoUmum'];
        //Map userInfoBeasiswaData = result['infoBeasiswa'];
       // String jsonUserData = jsonEncode(userData);
        //String jsonUserInfoBeasiswaData = jsonEncode(userInfoBeasiswaData);
        //UserInfoBeasiswaModel userInfoBeasiswaModel = UserInfoBeasiswaModel.fromJson(jsonDecode(jsonUserInfoBeasiswaData));
        UserProfile userBeasiswaModel = UserProfile.fromJson(response['data']);
       print('saving ${userBeasiswaModel.namaLengkap}');
        boxStorage.setUserData(userBeasiswaModel);
       // boxStorage.setUserDataInfoBeasiswa(userInfoBeasiswaModel);
      return userBeasiswaModel;
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
       return UserProfile.fromJson(jsonDecode('source'));

      }
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
    isRemember.value = box.read('rememberMeCheck') ?? isRemember.value;
    if (isRemember.value == true) {
      username.value.text = box.read('username');
      password.value.text = box.read('password');
    }
  }

  onSavedRememberMe(bool uncheck) {
    //isRemember.value = uncheck;
    box.write('rememberMeCheck', uncheck);
    if (uncheck == false) {
      box.remove('username');
      box.remove('password');
      box.remove('rememberMeCheck');
      debugPrint('on saved');
    } else {
      box.write('username', username.value.text);
      box.write('password', password.value.text);
      debugPrint('on removed');
    }
    debugPrint(
        'saving username : ${username.value.text} - password : ${password.value.text}');
  }

  onLoginUser() {
    if (isLoggedin.value == true) {
      //Get.snackbar('Login Success', 'Your Token : $token');
      //Get.off(() => const LoginVerificationView());
    } else {
      Get.off(() => const LoginView());
    }
  }

  onLogoutUser() {
    box.remove('token');
    debugPrint('token has been deleted');
    Get.off(() => const LoginView());
  }
}
