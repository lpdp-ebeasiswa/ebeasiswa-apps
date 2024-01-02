import 'package:ebeasiswa/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/userProfil/user_profile_model.dart';
import '../../gen/assets.gen.dart';

class ProfileHomePKStatusView extends StatefulWidget {
  const ProfileHomePKStatusView({super.key, required this.userprofile});
  final UserProfile userprofile;
  @override
  State<ProfileHomePKStatusView> createState() =>
      _ProfileHomePKStatusViewState();
}

class _ProfileHomePKStatusViewState extends State<ProfileHomePKStatusView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
      child: SizedBox(
        height: 100,
        width: Get.width,
        child: Stack(
          children: [
            
            Container(
               height: 90,
        width: Get.width,
                decoration: BoxDecoration(
                  color: ColorName.orangeGlow,
                  border: Border.all(
                      color: ColorName.orangeGlow,
                      width: 4.0,
                      style: BorderStyle.solid),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                    const  Text('Status Pengajuan', style: TextStyle(color: Colors.white),),
                    const Text('Persiapan Keberangkatan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    if(widget.userprofile.infoBeaMStatus != null)
                    Text(widget.userprofile.infoBeaMStatus?.status ?? '', style: const TextStyle(color: Color.fromARGB(255, 255, 225, 0)),),
                    ],
                  ),
                )),
               Positioned(
                right: 10,
                child: Assets.image.homeMenuPkIcon.image(height: 90, width: 120))
          ],
        ),
      ),
    );
  }
}
