import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../account_menu/callcenter_menu_view.dart';
import '../account_menu/umum_menu_view.dart';
import '../profile_account/profile_account_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: AppBar(
            backgroundColor: ColorName.orange,
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            ProfileAccountView(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  UmumMenuView(),
                  CallcenterMenuView(),
                ])
          ],
        ));
  }
}
