import 'package:ebeasiswa/presentation/login/login_controller.dart';
import 'package:ebeasiswa/presentation/profile/profile_view.dart';
import 'package:ebeasiswa/presentation/update_profile/update_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class ProfileAccountView extends GetView<LoginController> {
  ProfileAccountView({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Column(
          children: [
            InkWell(
              onTap: () => Get.to(const ProfileView()),
              child: Card(
                color: Colors.white,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
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
                                  width: 70.0,
                                  height: 90.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Assets.image.lpdpLogo.image(),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          "Calon Penerima Beasiswa",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.orange),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0),
                                           child: GestureDetector(
                                            onTap: () {
                                              Get.to(const UpdateProfileView());
                                            },
                                          child: Row(
                                            children: const [
                                              Text(
                                                "Edit Profile",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              FaIcon(
                                                // ignore: deprecated_member_use
                                                FontAwesomeIcons.edit,
                                                color: ColorName.orange,
                                                size: 14,
                                              ),
                                            ],
                                          ),
                                        ),)
                                      ],
                                    ),
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
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      "Login Terakhir Pada,",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          loginController.isLocalDate.value,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ' - ${loginController.isLocalTime.value} WIB',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
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
        )));
  }
}
