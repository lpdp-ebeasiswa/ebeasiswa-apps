import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../gen/colors.gen.dart';
import 'login_verification_controller.dart';

class LoginVerificationView extends StatefulWidget {
  const LoginVerificationView({super.key});

  @override
  State<LoginVerificationView> createState() => _LoginVerificationViewState();
}

class _LoginVerificationViewState extends State<LoginVerificationView> {
  final LoginVerificationController loginVerificationController =
      Get.put(LoginVerificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffFFC568),
              Color(0xffFF983D),
              Color(0xffFF6C06),
            ],
          ),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Selamat Datang".toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: ColorName.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => loginVerificationController.validationCount.value == 3 ? const SizedBox.shrink() : Text(
                  loginVerificationController.validationString.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: ColorName.white),
                ),)
              ]),
        ),
      )),
    );
  }
}
