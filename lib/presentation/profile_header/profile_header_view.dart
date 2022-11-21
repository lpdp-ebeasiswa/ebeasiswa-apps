import 'package:ebeasiswa/gen/colors.gen.dart';
import 'package:ebeasiswa/presentation/login/login_controller.dart';
import 'package:ebeasiswa/presentation/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

class ProfileHeaderView extends GetView<LoginController> {
  ProfileHeaderView({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Padding(
          padding:
              const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 20),
          child: Column(
            children: [
              Text(
                '${loginController.isTime.value}, insan LPDP',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ColorName.orange),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Get.to(const ProfileView()),
                child: Card(
                  color: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SizedBox(
                    height: 100,
                    width: Get.width * 0.9,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    loginController.username.value.text,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                  const Text(
                                    "amy.dutomo@gmail.com",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: CircleAvatar(
                                    child: Assets.image.lpdpLogo
                                        .image(height: 40.0, width: 40.0)),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
