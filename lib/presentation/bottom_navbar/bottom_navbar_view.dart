import 'package:ebeasiswa/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/model/userProfil/user_profile_model.dart';
import '../account/account_view.dart';
import '../home/home_view.dart';
import '../message_notification/message_notification_view.dart';

class EbeasiswaBottomNavbar extends StatefulWidget {
  const EbeasiswaBottomNavbar({super.key, required this.userprofile});
  final UserProfile userprofile;
  @override
  State<EbeasiswaBottomNavbar> createState() => _EbeasiswaBottomNavbarState();
}

class _EbeasiswaBottomNavbarState extends State<EbeasiswaBottomNavbar> {
  var selectedIndex = 0;
  var selectedPage = <Widget>[];

  int get index => selectedIndex;
  //List<Widget> get pages => selectedPages;

  UserProfile? userdata;

  @override
  void initState() {
    super.initState();
    onLoadUser();
  }

  onLoadUser() {
    userdata = widget.userprofile;
  }

  onTapBottomMenu(int currentIndex, BuildContext context) => {
        selectedIndex = currentIndex,
        //selectedPage = selectedPages,
        debugPrint('page hal : $currentIndex'),
        // if (currentIndex == 4) {onBasicAlertPressed(context)},
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: ColorName.whiteprimary,
            primaryColor: ColorName.whiteprimary.withOpacity(0.2),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: ColorName.orange),
            selectedItemColor: ColorName.orange,
            unselectedItemColor: ColorName.raven,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: index,
            iconSize: 20.0,
            unselectedFontSize: 11.0,
            selectedFontSize: 12.0,
            onTap: (_) {
              onTapBottomMenu(_, context);
              setState(() {});
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.incomplete_circle),
                label: 'Riwayat',
              ),
              // BottomNavigationBarItem(
              //   icon: FaIcon(FontAwesomeIcons.envelope),
              //   label: 'Pesan',
              // ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.userGraduate),
                label: 'Akun',
              ),
              // BottomNavigationBarItem(
              //    icon: FaIcon(FontAwesomeIcons.arrowRightFromBracket),
              //   label: 'Keluar',
              // ),
            ],
          ),
        ),
        body: IndexedStack(
          index: index, 
          children:  <Widget>[
          HomeView(userdata: userdata!,),
        const MessageNotificationView(),
          AccountView(userprofile: userdata!,),
        ]));
  }
}
