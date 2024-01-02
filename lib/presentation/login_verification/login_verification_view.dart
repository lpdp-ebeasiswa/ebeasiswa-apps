import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../gen/colors.gen.dart';
import 'login_verification_controller.dart';

class LoginVerificationView extends StatefulWidget {
  const LoginVerificationView(
      {super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  State<LoginVerificationView> createState() => _LoginVerificationViewState();
}

class _LoginVerificationViewState extends State<LoginVerificationView> {
  final LoginVerificationController loginVerificationController =
      Get.put(LoginVerificationController());

  @override
  void initState() {
    super.initState();
    loginVerificationController.getAuth(
        isremember: false, email: widget.email, password: widget.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(color: ColorName.orangeGlow
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Color(0xffFFC568),
            //     Color(0xffFF983D),
            //     Color(0xffFF6C06),
            //   ],
            // ),
            ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 150.0,
                      child: TextLiquidFill(
                        text: 'LPDP',
                        waveColor: Colors.white,
                        boxBackgroundColor: ColorName.orangeGlow,
                        textStyle: const TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                        ),
                        waveDuration: const Duration(seconds: 8),
                        loadDuration: const Duration(seconds: 10),
                        boxHeight: 100.0,
                        boxWidth: 150.0,
                        // loadUntil: loginVerificationController.validationCount.value == 0.0 ? 0.0 : loginVerificationController.validationCount.value,
                      ),
                    ),
                    Obx(
                      ()=> loginVerificationController.isLoadSliper.value == false ? const SizedBox(width: 200,) : SizedBox(
                        //color: Colors.green,
                        width: 200.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: DefaultTextStyle(
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Horizon',
                            ),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              //pause : const Duration(milliseconds: 3000),
                              animatedTexts: [
                                RotateAnimatedText('integrity'),
                                RotateAnimatedText('collaborative'),
                                RotateAnimatedText('innovative'),
                                RotateAnimatedText('anti-corruption'),
                              ],
                              onTap: () {
                                // print("Tap Event");
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                Obx(
                  () => loginVerificationController.validationCount.value == 1
                      ? const SizedBox.shrink()
                      : SizedBox(
                        width: Get.width,
                        child: Text(
                            loginVerificationController.validationString.value,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: ColorName.whiteprimary),
                          ),
                      ),
                )
              ]),
        ),
      )),
    );
  }
}
