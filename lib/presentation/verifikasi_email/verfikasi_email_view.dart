import 'package:ebeasiswa/app/widgets/input_text_form_costum.dart';
import 'package:ebeasiswa/presentation/verifikasi_email/verifikasi_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/widgets/input_text_aktivasi.dart';
import '../../gen/assets.gen.dart';

class VerifikasiEmailView extends StatelessWidget {
  VerifikasiEmailView({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final VerifikasiEmailController controller =
        Get.put(VerifikasiEmailController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6C06),
        title: const Text("Verifikasi Email"),
      ),
      body: ListView(children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Assets.image.lpdpSendEmail
                        .image(height: 200.0, width: 200.0)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 2.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Form(
                    key: formKey,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      width: Get.width,
                      child: Column(
                        children: [
                          const Text(
                            "Verifikasi Email",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Silahkan cek email yang terdaftar pada e-Beasiswa periksa semua email termasuk spam",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: SingleChildScrollView(
                                      child: Container(
                                        height: 250,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Form(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Text(
                                                "Udpate Email",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              const SizedBox(height: 10),
                                              InputTextFormCostum(
                                                controller:
                                                    controller.emailCtrl.value,
                                                hintText: "Email",
                                                labletext: "email",
                                                iconText:
                                                    const Icon(Icons.email),
                                              ),
                                              const SizedBox(height: 20),
                                              SizedBox(
                                                height: 40,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFFFF8226),
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text("Update"),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              'update email ${controller.argumentData[0]['email']}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.blue),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 1.5,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 20),
                          const Text("Masukkan Kode Unik"),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InputTextAktivasi(
                                textInputAction: TextInputAction.next,
                                controller: controller.kodeUnikCtrl_1.value,
                                validator: ((value) =>
                                    controller.checkValidator(
                                        value, TypeValidator.kodeUnik)),
                                onChanged: (value) {
                                  FocusScope.of(context).nextFocus();
                                  return null;
                                },
                              ),
                              InputTextAktivasi(
                                textInputAction: TextInputAction.next,
                                controller: controller.kodeUnikCtrl_2.value,
                                validator: ((value) =>
                                    controller.checkValidator(
                                        value, TypeValidator.kodeUnik)),
                                onChanged: (value) {
                                  FocusScope.of(context).nextFocus();
                                  return null;
                                },
                              ),
                              InputTextAktivasi(
                                textInputAction: TextInputAction.next,
                                controller: controller.kodeUnikCtrl_3.value,
                                validator: ((value) =>
                                    controller.checkValidator(
                                        value, TypeValidator.kodeUnik)),
                                onChanged: (value) {
                                  FocusScope.of(context).nextFocus();
                                  return null;
                                },
                              ),
                              InputTextAktivasi(
                                textInputAction: TextInputAction.done,
                                controller: controller.kodeUnikCtrl_4.value,
                                validator: ((value) =>
                                    controller.checkValidator(
                                        value, TypeValidator.kodeUnik)),
                                onChanged: (value) {
                                  FocusScope.of(context).unfocus();
                                  return null;
                                },
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Tidak menerima kode unik? "),
                                InkWell(
                                  onTap: () {
                                    controller.resendingCode();
                                  },
                                  child: const Text(
                                    "Kirim ulang",
                                    style: TextStyle(color: Colors.blue),
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
                                if (formKey.currentState!.validate()) {
                                  controller.verifyOTP();
                                  if (controller.kodeOTP ==
                                      controller.argumentData[1]
                                          ['verifikasi']) {
                                    Get.back(result: [
                                      {"backValue": "berhasil"}
                                    ]);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Gagal verifikasi, Kode Unik anda tidak sama'),
                                      ),
                                    );
                                  }
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
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
