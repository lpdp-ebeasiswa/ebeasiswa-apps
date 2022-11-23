import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/presentation/registration/register_controller.dart';
import 'package:ebeasiswa/presentation/widgets/input_text_form_costum.dart';
import 'package:ebeasiswa/presentation/widgets/select_date_costum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/upload_photo_costum.dart';

class RegistrationView extends StatelessWidget {
  RegistrationView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RegisterController controllerRegister = Get.put(RegisterController());

    return Scaffold(
      body: Container(
        color: const Color(0xFFD45820),
        child: Column(
          children: [
            Assets.image.lpdpRegistration.image(fit: BoxFit.fitWidth),
            Expanded(
              child: Container(
                // margin: const EdgeInsets.only(top: 10),
                height: 20,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80)), //here
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            elevation: 2.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 15, top: 10),
                                    child: Text(
                                      "Informasi Akun",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  InputTextFormCostum(
                                    labletext: "Email",
                                    hintText: "Email",
                                    typeInput: TextInputType.emailAddress,
                                    iconText: const Icon(Icons.email_rounded),
                                    validator: ((value) =>
                                        controllerRegister.checkValidator(
                                            value, TypeValidator.email)),
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        controllerRegister.emailCtrl.value,
                                  ),
                                  InputTextFormCostum(
                                    labletext: "Kata Sandi",
                                    hintText: "Kata Sandi",
                                    typeInput: TextInputType.visiblePassword,
                                    iconText: const Icon(Icons.lock),
                                    validator: ((value) =>
                                        controllerRegister.checkValidator(
                                            value, TypeValidator.password)),
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        controllerRegister.passwordCtrl.value,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 2.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 15, top: 10),
                                    child: Text(
                                      "Informasi Pribadi",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  InputTextFormCostum(
                                    hintText: "Nama Lengkap",
                                    labletext: "Nama Lengkap",
                                    typeInput: TextInputType.text,
                                    iconText: const Icon(Icons.person),
                                    validator: ((value) =>
                                        controllerRegister.checkValidator(
                                            value, TypeValidator.fullname)),
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        controllerRegister.fullnameCtrl.value,
                                  ),
                                  InputTextFormCostum(
                                    hintText: "Nama Panggilan",
                                    labletext: "Nama Panggilan",
                                    typeInput: TextInputType.text,
                                    iconText: const Icon(Icons.person_pin),
                                    validator: ((value) =>
                                        controllerRegister.checkValidator(
                                            value, TypeValidator.nickname)),
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        controllerRegister.nicknameCtrl.value,
                                  ),
                                  InputTextFormCostum(
                                    labletext: "Nomor Induk Kependudukan (NIK)",
                                    hintText: "Nomor Induk Kependudukan (NIK)",
                                    typeInput: TextInputType.number,
                                    iconText: const Icon(Icons.contacts),
                                    validator: ((value) =>
                                        controllerRegister.checkValidator(
                                            value, TypeValidator.nik)),
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        controllerRegister.nikCtrl.value,
                                  ),
                                  InputTextFormCostum(
                                    labletext: "Nomor Kartu Keluarga (KK)",
                                    hintText: "Nomor Kartu Keluarga (KK)",
                                    typeInput: TextInputType.number,
                                    iconText: const Icon(Icons.call_to_action),
                                    validator: ((value) =>
                                        controllerRegister.checkValidator(
                                            value, TypeValidator.kk)),
                                    textInputAction: TextInputAction.next,
                                    controller: controllerRegister.kkCtrl.value,
                                  ),
                                  InputTextFormCostum(
                                    labletext: "Tempat Lahir",
                                    hintText: "Tempat lahir",
                                    typeInput: TextInputType.text,
                                    iconText: const Icon(Icons.pin_drop),
                                    validator: ((value) =>
                                        controllerRegister.checkValidator(
                                            value, TypeValidator.place)),
                                    textInputAction: TextInputAction.next,
                                    controller: controllerRegister
                                        .tempatLahirCtrl.value,
                                  ),
                                  SelectDateCostum(
                                      labletext: "Tanggal Lahir",
                                      hintText: "dd/mm/yyyy",
                                      iconText: const Icon(Icons.date_range),
                                      validator: ((value) =>
                                          controllerRegister.checkValidator(
                                              value,
                                              TypeValidator.dateOfBirth)),
                                      controller: controllerRegister
                                          .dateOfBirthCtrl.value),
                                  InputTextFormCostum(
                                    labletext: "Nomor Handphone",
                                    hintText: "Nomor Handphone",
                                    typeInput: TextInputType.number,
                                    iconText: const Icon(Icons.phone_android),
                                    validator: ((value) =>
                                        controllerRegister.checkValidator(
                                            value, TypeValidator.phone)),
                                    textInputAction: TextInputAction.next,
                                    controller:
                                        controllerRegister.phoneCtrl.value,
                                  ),
                                  UploadPhoto(
                                    labletext: "Upload Photo",
                                    hintText: "Upload Photo (3x4)",
                                    iconText: const Icon(Icons.upload),
                                    validator: ((value) =>
                                        controllerRegister.checkValidator(
                                            value, TypeValidator.photo)),
                                    controller:
                                        controllerRegister.photoCtrl.value,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: Get.width * 0.4,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Kembali"),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD45820),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text(
                        "Registrasi",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
