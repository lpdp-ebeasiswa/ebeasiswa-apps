import 'package:ebeasiswa/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'bottom_navbar_controller.dart';

class EbeasiswaBottomNavbar extends StatefulWidget {
  const EbeasiswaBottomNavbar({super.key});

  @override
  State<EbeasiswaBottomNavbar> createState() => _EbeasiswaBottomNavbarState();
}

class _EbeasiswaBottomNavbarState extends State<EbeasiswaBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final EbeasiswaBottomNavbarController ebeasiswaBottomNavbarController =
        Get.put(EbeasiswaBottomNavbarController());
    return Scaffold(
      
        bottomNavigationBar: Obx(() => (Theme(
              data: Theme.of(context).copyWith(
                canvasColor: ColorName.white,
                primaryColor: ColorName.white.withOpacity(0.2),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: const IconThemeData(
                    color: ColorName.orange),
                selectedItemColor: ColorName.orange,
                unselectedItemColor: ColorName.raven,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.bold),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: ebeasiswaBottomNavbarController.index,
                iconSize: 20.0,
                unselectedFontSize: 11.0,
                selectedFontSize: 12.0,
                onTap: (_) {
                  ebeasiswaBottomNavbarController.onTapBottomMenu(_);
                  setState(() {});
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.house),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.incomplete_circle),
                    label: 'Coming soon',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.envelope),
                    label: 'Pesan',
                  ),
                  BottomNavigationBarItem(
                     icon: FaIcon(FontAwesomeIcons.userGraduate),
                    label: 'Akun',
                  ),
                  BottomNavigationBarItem(
                     icon: FaIcon(FontAwesomeIcons.arrowRightFromBracket),
                    label: 'Keluar',
                  ),
                ],
              ),
            ))),
        body: IndexedStack(
            index: ebeasiswaBottomNavbarController.index,
            children: ebeasiswaBottomNavbarController.pages));
  }
}
