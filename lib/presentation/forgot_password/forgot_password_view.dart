import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/presentation/forgot_password/confirmation_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? checkNik(String? text) {
  RegExp regEx = RegExp(
      r'^(1[1-9]|21|[37][1-6]|5[1-3]|6[1-5]|[89][12])\d{2}\d{2}([04][1-9]|[1256][0-9]|[37][01])(0[1-9]|1[0-2])\d{2}\d{4}$');

  if (text == null || text.isEmpty) {
    return 'NIK tidak boleh kosong';
  }
  if (!regEx.hasMatch(text)) {
    return 'NIK tidak Valid';
  }
  return null;
}

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6C06),
        title: const Text("Lupa Password"),
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
                    child: Assets.image.lpdpForgotPassword
                        .image(height: 200.0, width: 200.0)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    width: Get.width,
                    child: Column(
                      children: [
                        const Text(
                          "Lupa Password ?",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Jangan hawatir yaa, kami akan membantumu 🙂",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 1.5,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                            "Masukkan Nomor Induk Kependudukan (NIK) kamu ?"),
                        const SizedBox(height: 15),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: checkNik,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Nomor Induk Kependudukan (NIK)",
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    prefixIcon: const IconTheme(
                                      data: IconThemeData(
                                        color: Color(0xFFFF8226),
                                      ),
                                      child: Icon(Icons.contacts),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFFF8226),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFFF8226),
                                      ),
                                    ),
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
                                      if (_formKey.currentState!.validate()) {
                                        Get.to(
                                            const ConfirmationPasswordView());
                                      }
                                    },
                                    child: const Text(
                                      "Kirim",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
