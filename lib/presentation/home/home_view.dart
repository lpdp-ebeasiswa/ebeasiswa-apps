import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../home_content/carousel_content.dart';
import '../list_app_role/menu_view.dart';
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
          flexibleSpace: Assets.image.lpdpAppbar.image(fit: BoxFit.fitWidth),
          backgroundColor: Colors.transparent,
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
