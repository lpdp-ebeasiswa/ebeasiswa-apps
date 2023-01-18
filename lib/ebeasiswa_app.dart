import 'package:ebeasiswa/presentation/notification/notification_view.dart';
import 'package:ebeasiswa/presentation/onboarding/onboarding_view.dart';
import 'package:ebeasiswa/presentation/splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EbeasiswaApp extends StatelessWidget {
  const EbeasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    // return const GetMaterialApp(
    //   home: LoginView(),
    // );
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const GetMaterialApp(
            home: SplashScreenView(),
          );
        } else {
          return GetMaterialApp(
            home: OnBoardingView(),
            routes: {
              '/notification-view': (_) => const NotificationView(),
            },
          );
        }
      },
    );
  }
}
