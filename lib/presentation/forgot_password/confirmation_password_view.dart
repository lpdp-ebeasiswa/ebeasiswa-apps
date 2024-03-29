import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationPasswordView extends StatelessWidget {
  const ConfirmationPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6C06),
        title: const Text("Konfirmasi Password"),
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
                    child: Assets.image.lpdpKonfirmasiPassword
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
                          "Masukkan Kode OTP",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Periksa Email atau SMS di HP kamu, terus masukkan kode OTP nya di bawah ya!",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 1.5,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 20),
                        const Text("Masukkan Kode OTP"),
                        const SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Kode OTP",
                            labelStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const IconTheme(
                              data: IconThemeData(
                                color: Color(0xFFFF8226),
                              ),
                              child: Icon(Icons.code),
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
                            onPressed: () {},
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
            ],
          ),
        ),
      ]),
    );
  }
}
