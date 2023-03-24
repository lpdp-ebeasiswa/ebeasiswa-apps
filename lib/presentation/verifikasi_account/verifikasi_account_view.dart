import 'dart:async';

import 'package:ebeasiswa/presentation/login/login_view.dart';
import 'package:ebeasiswa/presentation/verifikasi_account/verifikasi_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../gen/assets.gen.dart';

class VerifikasiAcountView extends StatefulWidget {
  const VerifikasiAcountView({Key? key}) : super(key: key);

  @override
  State<VerifikasiAcountView> createState() => _VerifikasiAcountViewState();
}

class _VerifikasiAcountViewState extends State<VerifikasiAcountView> {
  final controller = Get.find<VerifikasiAccountController>();

  reSend() {
    controller.otpCtrl.value.clear();
    controller.sendSms(
        controller.codeAppSignature, controller.phoneCtrl.value.text);
    controller.counter.value = 30;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          controller.counter.value--;
          if (controller.counter.value == 0) {
            timer.cancel();
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6C06),
        title: const Text("Verifikasi Akun"),
        centerTitle: true,
      ),
      body: ListView(children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Assets.image.lpdpKonfirmasiPassword
                          .image(height: 200.0, width: 200.0)),
                ),
              ),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 2.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      width: Get.width,
                      child: Column(
                        children: [
                          const Text(
                            "Verifikasi Akun",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Silahkan cek kode pada sms",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 1.5,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 20),
                          const Text("Masukkan Kode Unik"),
                          const SizedBox(height: 15),
                          PinFieldAutoFill(
                            codeLength: 4,
                            textInputAction: TextInputAction.done,
                            controller: controller.otpCtrl.value,
                            // focusNode: FocusNode(),
                            decoration: const BoxLooseDecoration(
                              textStyle: TextStyle(color: Colors.black),
                              radius: Radius.circular(10),
                              strokeColorBuilder:
                                  FixedColorBuilder(Colors.orange),
                            ),
                            currentCode: controller.messageOtpCode.value,
                            onCodeSubmitted: (code) {},
                            onCodeChanged: (code) {
                              controller.messageOtpCode.value = code!;
                              if (code.length == 4) {
                                if (code == controller.otpCode) {
                                  setState(() {
                                    Get.snackbar(
                                        'Berhasil', 'Akun berhasil registrasi',
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.white,
                                        margin: const EdgeInsets.all(10),
                                        backgroundColor: Colors.green);
                                    Get.offAll(const LoginView());
                                  });
                                }
                              }
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Tidak menerima kode unik? "),
                                InkWell(
                                  onTap: () {
                                    controller.counter.value == 0
                                        ? reSend()
                                        // ? getCode()
                                        : "";
                                  },
                                  child: Text(
                                    controller.counter.value == 0
                                        ? "Kirim Ulang"
                                        : "Tunggu ${controller.counter.value.toString()}",
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: Get.width * 0.5,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD45820),
                              ),
                              onPressed: () {
                                // getCode();
                                debugPrint(
                                    "code reciveKodeOtp ------> ${controller.otpCode}");
                                if (controller.messageOtpCode.value.length ==
                                    4) {
                                  if (controller.otpCode ==
                                      controller.messageOtpCode.value) {
                                       
                                    Get.snackbar('Berhasil',
                                        'Akun berhasil di verifikasi',
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.white,
                                        margin: const EdgeInsets.all(10),
                                        backgroundColor: Colors.green);
                                    Get.offAll(const LoginView());
                                  } else {
                                    Get.snackbar(
                                        'Warning', 'Kode OTP Tidak sama',
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.white,
                                        margin: const EdgeInsets.all(10),
                                        backgroundColor: Colors.orange);
                                  }
                                } else {
                                  Get.snackbar(
                                      'Error', 'Kode tidak boleh kosong',
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      margin: const EdgeInsets.all(10),
                                      backgroundColor: Colors.red);
                                }
                              },
                              child: const Text(
                                "Konfirmasi",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ]),
    );
  }
}
