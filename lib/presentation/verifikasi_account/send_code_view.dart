import 'package:get/get.dart';
import 'package:ebeasiswa/app/widgets/input_text_form_costum.dart';
import 'package:ebeasiswa/presentation/verifikasi_account/verifikasi_account_controller.dart';
import 'package:ebeasiswa/presentation/verifikasi_account/verifikasi_account_view.dart';
import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class SendCodeView extends StatefulWidget {
  const SendCodeView({super.key});

  @override
  State<SendCodeView> createState() => _SendCodeViewState();
}

class _SendCodeViewState extends State<SendCodeView> {
  final VerifikasiAccountController controller =
      Get.put(VerifikasiAccountController());
  late TwilioFlutter twilioFlutter;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6C06),
        title: const Text("Aktivasi Akun"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Yuk Aktivasi akun anda",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        const Text(
          "Jangan hawatir, Akun anda akan segera aktif",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(30),
              width: Get.width,
              child: Column(
                children: [
                  const Text("Masukkan nomor telepon kamu ?"),
                  const Divider(
                    height: 50,
                    thickness: 1,
                  ),
                  Obx(() {
                    return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            InputTextFormCostum(
                              labletext: "Nomor Handphone",
                              hintText: "+62XXXXXXX",
                              typeInput: TextInputType.phone,
                              border: true,
                              iconText: const Icon(Icons.phone_android),
                              validator: ((value) =>
                                  controller.validasiNomorTelepon(
                                    value,
                                  )),
                              textInputAction: TextInputAction.done,
                              controller: controller.phoneCtrl.value,
                            ),
                            const Divider(
                              height: 50,
                              thickness: 1,
                            ),
                            SizedBox(
                              width: Get.width * 0.5,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD45820),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.sendSms(
                                        controller.codeAppSignature,
                                        controller.phoneCtrl.value.text);
                                    Get.to(const VerifikasiAcountView());
                                  }
                                },
                                child: const Text(
                                  "Kirim",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ));
                  })
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
