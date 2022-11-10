import 'package:ebeasiswa/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

class ProfileHeaderView extends GetView<LoginController> {
 ProfileHeaderView({super.key});

  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 20),
        child: Card(
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SizedBox(
            height: 400,
            width: 320,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 140,
                    width: 140,
                    child: CircleAvatar(
                        child: Assets.image.lpdpLogo
                            .image(height: 100.0, width: 100.0)),
                  ),
                  const Text(
                    "Amy Dutomo",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, right: 20, left: 20),
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFFFF6C06)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          // borderRadius: BorderRadius.zero,
                                          borderRadius: BorderRadius.circular(8),
                                          side: const BorderSide(
                                              color: Color(0xFFFF6C06))))),
                              //onPressed: () {},
                              onPressed: () {
                                _loginController.onLogoutUser();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text("Keluar".toUpperCase(),
                                    style: const TextStyle(fontSize: 14)),
                              )),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
