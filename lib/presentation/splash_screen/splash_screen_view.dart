import 'package:ebeasiswa/presentation/splash_screen/get_token_fcm_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../notification/notification_controller.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetTokenFcmController());
    Get.put(NotificationController());
    return Scaffold(
      body: Container(
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
              Assets.image.lpdpLogo
                  .image(fit: BoxFit.cover, height: 70, width: 220),
              const SizedBox(
                height: 50,
              ),
              const CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
