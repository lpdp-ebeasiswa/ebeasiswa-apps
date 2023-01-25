import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../home_content/carousel_content.dart';
import '../list_app_role/menu_view.dart';
import '../notification/notification_view.dart';
import '../profile_header/profile_header_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          leading: const Icon(
            Icons.home,
            color: Colors.transparent,
          ),
          flexibleSpace: Assets.image.lpdpAppbar.image(fit: BoxFit.fitWidth),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(const NotificationView(), arguments: false);
                },
                icon: const Icon(Icons.notifications))
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ProfileHeaderView(),
                  const FirstMenuView(),
                  const SecondMenuView(),
                ],
              ),
            ),
          ),
          CarouselContent(),
        ],
      ),
    );
  }
}
