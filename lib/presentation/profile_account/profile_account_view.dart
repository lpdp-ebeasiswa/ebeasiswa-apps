import 'package:ebeasiswa/data/local/box/box_storage.dart';
import 'package:ebeasiswa/presentation/login/login_controller.dart';
import 'package:ebeasiswa/presentation/profile/profile_view.dart';
import 'package:ebeasiswa/presentation/update_profile/update_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/model/userProfil/user_profile_model.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class ProfileAccountView extends StatefulWidget {
  const ProfileAccountView({super.key, required this.userprofile});
  final UserProfile userprofile;
  @override
  State<ProfileAccountView> createState() => _ProfileAccountViewState();
}

class _ProfileAccountViewState extends State<ProfileAccountView> {
  
  UserProfile? userdata;
  @override
  void initState() {
    // TODO: implement initState
    userdata = widget.userprofile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            InkWell(
              onTap: () => Get.to(const ProfileView()),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            Assets.image.avatarProfileBackground.keyName))),
                child: SizedBox(
                  height: 130,
                  width: Get.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 80.0,
                                  height: 100.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child:  widget.userprofile.linkFoto != null ? CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    NetworkImage(widget.userprofile.linkFoto!),
                                backgroundColor: Colors.transparent,
                              )
                            : Assets.image.cpbMale.image(),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 2.0),
                                child: SizedBox(
                                  // width: 80.0,
                                  height: 100.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      // widget.userprofile == null ? const SizedBox.shrink():
                                      Text(
                                     userdata!.namaLengkap!,
                                        style:const TextStyle(
                                      
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    
                                       Text(
                                       userdata!.kodeRegistrasi!,
                                      
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    const  SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        );
  }
}
