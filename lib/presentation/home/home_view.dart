import 'package:badges/badges.dart' as badges;
import 'package:ebeasiswa/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/local/box/box_storage.dart';
import '../../gen/assets.gen.dart';
import '../home_content/carousel_content.dart';
import '../list_app_role/menu_view.dart';
import '../notification/notification_controller.dart';
import '../profile_header/profile_header_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final c = Get.put(NotificationController(), permanent: true);
  var c = Get.find<NotificationController>();
  int? countNotif;

  final boxstorage = BoxStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.cekUnreadNotif();
    print('cekk notif ---> ${boxstorage.getCountNotif()}');
  }

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
            boxstorage.getCountNotif() != 0
                ? badges.Badge(
                    position: badges.BadgePosition.topEnd(top: 0, end: 3),
                    badgeAnimation: const badges.BadgeAnimation.slide(
                        // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
                        // curve: Curves.easeInCubic,
                        ),
                    // showBadge: _showCartBadge,
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Colors.red,
                    ),
                    badgeContent: Text(
                      '${boxstorage.getCountNotif()}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          Get.toNamed(RoutesName.notification)!
                              .then((value) => setState(() {}));
                        }),
                  )
                : IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      Get.toNamed(RoutesName.notification)!
                          .then((value) => setState(() {}));
                    }),
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
