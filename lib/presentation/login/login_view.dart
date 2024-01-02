import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/presentation/account/account_view.dart';
import 'package:ebeasiswa/presentation/forgot_password/forgot_password_view.dart';
import 'package:ebeasiswa/gen/colors.gen.dart';
import 'package:ebeasiswa/presentation/login/login_controller.dart';
import 'package:ebeasiswa/presentation/registration/registration_view.dart';
import 'package:ebeasiswa/presentation/verifikasi_account/send_code_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottom_navbar/bottom_navbar_view.dart';
import '../login_verification/login_verification_view.dart';
import '../master_screen/master_screen_blank_view.dart';
import '../onboarding_disabilitas/onboarding_disabilitas_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: ColorName.orangeGlow,
            )),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Assets.image.lpdpHeaderAlternative.image(fit: BoxFit.fitWidth),

                /*
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: SizedBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Selamat datang",
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: const [
                          Text(
                            "di ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          Text(
                            "e - Beasiswa",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: ColorName.orange),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "jadilah awerdee dan sekolah di luar negri",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 11),
                        ),
                      ),
                    ],
                  )),
                ),
          
                */
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.text,
                    onSaved: (String? value) {},
                    onChanged: (value) => controller.username.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "email cannot be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded),
                      border: OutlineInputBorder(),
                      hintText: 'masukan email kamu',
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: TextFormField(
                    controller: password,
                    obscureText: controller.isPasswordVisible.value,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => password,
                    onSaved: (String? value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password cannot be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_rounded),
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_off_sharp
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.hidepassword();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                controller.rememberMe();
                              },
                              child: controller.isRemember.value == true
                                  ? Assets.icon.checkBox
                                      .image(height: 20, width: 20)
                                  : Assets.icon.uncheckBox
                                      .image(width: 20, height: 20)),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Ingat saya ",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 20.0),
                      //   child: GestureDetector(
                      //     onTap: () => {Get.to(ForgotPasswordView())},
                      //     child: const Text(
                      //       "Lupa password?",
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 14,
                      //           color: Color(0xFFFF6C06)),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFFF6C06)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                          color: Color(0xFFFF6C06))))),
                      onPressed: () async {
                        setState(() {
                            isloading = true;
                        });
                        
                         //Get.off(() => const LoginVerificationView(email: "colley.windya@gmail.com", password: "pass123",));
                        if (_formKey.currentState!.validate()) {
                        String emails = email.text;
                        String passwords = password.text;
                       
                        Get.off(() =>  LoginVerificationView(email: emails, password: passwords,));
                       
                        }
                        setState(() {
                           isloading = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          if(isloading)
                       const Padding(padding:  EdgeInsets.only(right: 10), child:  SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: ColorName.whiteprimary,),),),
                          Text(isloading ? "Mencoba masuk.." : "Masuk".toUpperCase(),
                            style: const TextStyle(fontSize: 14))
                        ]),
                      )),
                ),
                /*
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Panduan Bagi Pendaftar Beasiswa",
                        style:
                            TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Panduan Bagi CPB dan PB",
                        style:
                            TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Belum Punya Akun?",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 11),
                          ),
                          GestureDetector(
                              onTap: () => {Get.to(const RegistrationView())},
                              child: const Text(
                                "Buat Akun Disini",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 11),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Tidak Menerima Link Verifikasi",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 11),
                          ),
                          GestureDetector(
                              // onTap: () => {Get.to(const VerifikasiAcountView())},
                              onTap: () => {Get.to(const SendCodeView())},
                              child: const Text(
                                "Verifikasi Akun Anda",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 11),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Layanan yang diberikan LPDP bebas biaya",
                        style:
                            TextStyle(fontWeight: FontWeight.w200, fontSize: 11),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Terima kasih untuk tidak memberika gratifikasi/",
                        style:
                            TextStyle(fontWeight: FontWeight.w200, fontSize: 11),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Imbalan dalam bentuk apapun kepada pegawai kami",
                        style:
                            TextStyle(fontWeight: FontWeight.w200, fontSize: 11),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
          
                */
              ],
            ),
          ),
        )));
  }

  bool ischeckedValue = false;
}
