import 'package:flutter/material.dart';

import '../list_app_role/list_app_role_view.dart';
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
      body: SafeArea(
          child: ListView(
            shrinkWrap: true,
        children:  [
         ProfileHeaderView(),
          Column(
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                const  Padding(
                    padding:  EdgeInsets.only(left: 20.0, bottom: 30.0),
                    child:  Text("List App Role", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Container(),
               ],
             ),
              const ListAppRoleView(),
            ],
          ),
          //SizedBox(height: 100, child: ListAppRoleView()),
        ],
      )),
    );
  }
}
