import 'package:flutter/material.dart';

import '../../data/local/box/box_storage.dart';
import '../../data/model/userProfil/user_profile_model.dart';
import '../../gen/colors.gen.dart';
import '../account_menu/callcenter_menu_view.dart';
import '../account_menu/logout_menu_view.dart';
import '../account_menu/pengaturan_menu_view.dart';
import '../account_menu/umum_menu_view.dart';
import '../profile_account/profile_account_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key, required this.userprofile});
final UserProfile userprofile;
  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {

  //UserProfile? userBeasiswaModel;
  BoxStorage boxStorage = BoxStorage();

  @override
  void initState() {
   // loaduser();
    super.initState();
  }

  // loaduser() async {
  //   print('get profile..');
  //   userBeasiswaModel = await boxStorage.getUserData();
  //   setState(() {
  //     userBeasiswaModel = userBeasiswaModel;
  //   print('take profile.. ${userBeasiswaModel!.data!.kodeRegistrasi}');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          child: AppBar(
             automaticallyImplyLeading: false,
            backgroundColor: ColorName.orange,
            shadowColor: Colors.transparent
          ),
        ),
        body:
        //userBeasiswaModel == null ? const SizedBox.shrink() :
         ListView(
          shrinkWrap: true,
          children: [
            ProfileAccountView(userprofile: widget.userprofile,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  UmumMenuView(userprofile: widget.userprofile),
                const  CallcenterMenuView(),
                 const SettingMenuView(),
                 const LogoutMenuView(),
                ])
          ],
        ));
  }
}
