import 'package:ebeasiswa/presentation/expenditure/expenditure_view.dart';
import 'package:ebeasiswa/presentation/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account/account_view.dart';
import '../message_notification/message_notification_view.dart';
import '../profile/profile_view.dart';

class EbeasiswaBottomNavbarController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedPage = <Widget>[].obs;

  var selectedPages = <Widget>[
    const HomeView(),
    const ExpenditureView(),
    const MessageNotificationView(),
    const AccountView(),
    // temporary
    const ProfileView(),
  ].obs;

  int get index => selectedIndex.value;
  List<Widget> get pages => selectedPages;

  onTapBottomMenu(int currentIndex) => {
        selectedIndex.value = currentIndex,
        selectedPage.value = selectedPages,
      };

}
