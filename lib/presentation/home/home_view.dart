import 'package:flutter/material.dart';

import '../../data/model/userProfil/user_profile_model.dart';
import '../../gen/assets.gen.dart';
import '../home_content/carousel_content.dart';
import '../list_app_role/menu_view.dart';
import '../profile_header/profile_header_view.dart';
import '../profile_home_pk_status/profile_home_pk_status_view.dart';
import '../profile_home_user_slider_menu/profile_home_user_slider_menu_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.userdata});
final UserProfile userdata;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80.0),
      //   child: AppBar(
      //     automaticallyImplyLeading: false,
      //     flexibleSpace: Assets.image.lpdpAppbar.image(fit: BoxFit.fitWidth),
      //     backgroundColor: Colors.transparent,
      //   ),
      // ),
      body: ListView(
        shrinkWrap: false,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ProfileHeaderView(userprofile: widget.userdata),
                   ProfileHomePKStatusView(userprofile: widget.userdata),
                  const ProfileHomeUserSliderMenuView(),
                  // const FirstMenuView(),
                  // const SecondMenuView(),
                ],
              ),
            ),
          ),
         // CarouselContent(),
        ],
      ),
    );
  }
}
