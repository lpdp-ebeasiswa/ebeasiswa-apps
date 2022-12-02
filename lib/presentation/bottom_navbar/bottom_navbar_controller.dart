import 'package:ebeasiswa/presentation/expenditure/expenditure_view.dart';
import 'package:ebeasiswa/presentation/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../account/account_view.dart';
import '../login/login_view.dart';
import '../logout/logout_view.dart';
import '../message_notification/message_notification_view.dart';

class EbeasiswaBottomNavbarController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedPage = <Widget>[].obs;
  final box = GetStorage();

  var selectedPages = <Widget>[
    const HomeView(),
    const ExpenditureView(),
    const MessageNotificationView(),
    const AccountView(),
    const LogoutView(),
  ].obs;

  int get index => selectedIndex.value;
  List<Widget> get pages => selectedPages;

  onTapBottomMenu(int currentIndex, BuildContext context) => {
        selectedIndex.value = currentIndex,
        selectedPage.value = selectedPages,
        if (currentIndex == 4) {onBasicAlertPressed(context)},
      };

  onBasicAlertPressed(context) {
    Alert(
        context: context,
        title: "Logout",
        desc: "Apakah anda yakin ingin keluar dari aplikasi Ebeasiswa?",
        alertAnimation: fadeAlertAnimation,
        closeFunction: onCloseLogoutMsg(context),
        buttons: [
          DialogButton(
            color: Colors.red,
            onPressed: () => onLogoutApps(),
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          DialogButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            child: const Text(
              "Tidak",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ]).show();
  }

  onLogoutApps() {
    box.erase();
    Get.off(() => const LoginView());
  }

  onCloseLogoutMsg(context){onTapBottomMenu(3, context);}


  Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
