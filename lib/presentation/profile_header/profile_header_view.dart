import 'package:ebeasiswa/gen/colors.gen.dart';
import 'package:ebeasiswa/presentation/login/login_controller.dart';
import 'package:ebeasiswa/presentation/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/userProfil/user_profile_model.dart';
import '../../gen/assets.gen.dart';
import 'profile_header_controller.dart';

class ProfileHeaderView extends StatefulWidget {
  const ProfileHeaderView({super.key, required this.userprofile});
  final UserProfile userprofile;
  @override
  State<ProfileHeaderView> createState() => _ProfileHeaderViewState();
}

class _ProfileHeaderViewState extends State<ProfileHeaderView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: 60.0,
                      height: 70.0,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: widget.userprofile.linkFoto != null
                            ? CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    NetworkImage(widget.userprofile.linkFoto!),
                                backgroundColor: Colors.transparent,
                              )
                            : Assets.image.cpbMale.image(),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 240,
                    child: Text(
                      'hai, ${widget.userprofile.namaLengkap}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: ColorName.orange),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.notifications)
            ],
          ),
        ],
      ),
    );
  }
}
