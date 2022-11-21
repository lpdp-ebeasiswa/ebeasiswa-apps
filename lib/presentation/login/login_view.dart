import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/gen/colors.gen.dart';
import 'package:ebeasiswa/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
        child: ListView(
          children: [
            Assets.image.lpdpHeader.image(fit: BoxFit.fitWidth),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Selamat datang",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: const [
                      Text(
                        "di ",
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: TextFormField(
                controller: controller.username.value,
                keyboardType: TextInputType.text,
                onSaved: (String? value) {},
                onChanged: (value) => controller.username.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email cannot be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'cooper@example.com',
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: TextFormField(
                controller: controller.password.value,
                obscureText: controller.isPasswordVisible.value,
                keyboardType: TextInputType.text,
                onChanged: (value) => controller.password.value,
                onSaved: (String? value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password cannot be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
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
                              ? Assets.icon.checkBox.image(height: 20, width: 20)
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
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Text(
                      "Lupa password?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFFFF6C06)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFF6C06)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Color(0xFFFF6C06))))),
                  onPressed: () {
                    controller.getAuth(ischeckedValue);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Masuk".toUpperCase(),
                        style: const TextStyle(fontSize: 14)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Panduan Bagi Pendaftar Beasiswa",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Panduan Bagi CPB dan PB",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum Punya Akun?",
                        style:
                            TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                      ),
                      GestureDetector(
                          onTap: () => {},
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
                        style:
                            TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                      ),
                      GestureDetector(
                          onTap: () => {},
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
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 11),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Terima kasih untuk tidak memberika gratifikasi/",
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 11),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Imbalan dalam bentuk apapun kepada pegawai kami",
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 11),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ))
    );
  }

  bool ischeckedValue = false;
}
