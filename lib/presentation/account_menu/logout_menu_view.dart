import 'dart:async';
import 'dart:ui';

import 'package:ebeasiswa/presentation/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/local/box/box_storage.dart';
import '../../gen/colors.gen.dart';

class LogoutMenuView extends StatelessWidget {
  const LogoutMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12.0, bottom: 20),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            foregroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          onPressed: () => {
            showGeneralDialog(
              barrierDismissible: true,
              barrierLabel: '',
              barrierColor: Colors.black38,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (ctx, anim1, anim2) => Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 180,
                  //  margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: SizedBox.expand(
                    child: AlertDialog(
                      titlePadding: const EdgeInsets.only(top: 5, bottom: 5),
                      contentPadding: const EdgeInsets.only(top: 5, bottom: 15),
                      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
                      title: const Text('Yakin mau keluar dari akun kamu?'),
                      content: const Text(
                          'Nanti kamu harus masuk lagi saat mau melakukan proses pengajuan ya'),
                      elevation: 0,
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorName.orangeGlow,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: const Center(
                                    child: Text(
                                  'Kembali',
                                  style: TextStyle(
                                      color: ColorName.orangeGlow,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            GestureDetector(
                               onTap: () {
                                BoxStorage boxStorage = BoxStorage();
                                boxStorage.clearCache();
                                Get.offAll( const LoginView());
                              },
                              child: Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: ColorName.orangeGlow,
                                    border: Border.all(
                                      color: ColorName.orangeGlow,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: const Center(
                                    child: Text(
                                  'Ya, Keluar',
                                  style: TextStyle(
                                      color: ColorName.whiteprimary,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     primary:
                            //         ColorName.orangeGlow, // Background color
                            //   ),
                            //   child: const Text('Iya Keluar'),
                            //   onPressed: () {
                            //     Navigator.of(context).pop();
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                child: FadeTransition(
                  opacity: anim1,
                  child: child,
                ),
              ),
              context: context,
            )
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                        ),
                        onPressed: () => {},
                        child: const Icon(
                          Icons.exit_to_app,
                          color: ColorName.orangeGlow,
                          size: 26,
                        )),
                  ),
                  const Text("Keluar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ColorName.orangeGlow)),
                ],
              ),
              const FaIcon(
                FontAwesomeIcons.angleRight,
                color: ColorName.orangeGlow,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}
