import 'package:ebeasiswa/presentation/update_profile/update_profile_controller.dart';
import 'package:ebeasiswa/presentation/widgets/input_text_form_costum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/select_date_costum.dart';
import '../widgets/upload_photo_costum.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[700],
        title: const Text("Update Profile"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FormUpdateProfile(),
    );
  }
}

class FormUpdateProfile extends StatelessWidget {
  FormUpdateProfile({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final UpdateProfileController controllerUpdateProfile =
        Get.put(UpdateProfileController());

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
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
                              validator: ((value) => controllerUpdateProfile
                                  .checkValidator(value, TypeValidator.email)),
                              textInputAction: TextInputAction.next,
                              controller:
                                  controllerUpdateProfile.emailCtrl.value,
                            ),
                            InputTextFormCostum(
                              labletext: "Kata Sandi",
                              hintText: "Kata Sandi",
                              typeInput: TextInputType.visiblePassword,
                              iconText: const Icon(Icons.lock),
                              validator: ((value) =>
                                  controllerUpdateProfile.checkValidator(
                                      value, TypeValidator.password)),
                              textInputAction: TextInputAction.next,
                              controller:
                                  controllerUpdateProfile.passwordCtrl.value,
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
                                  controllerUpdateProfile.checkValidator(
                                      value, TypeValidator.fullname)),
                              textInputAction: TextInputAction.next,
                              controller:
                                  controllerUpdateProfile.fullnameCtrl.value,
                            ),
                            InputTextFormCostum(
                              hintText: "Nama Panggilan",
                              labletext: "Nama Panggilan",
                              typeInput: TextInputType.text,
                              iconText: const Icon(Icons.person_pin),
                              validator: ((value) =>
                                  controllerUpdateProfile.checkValidator(
                                      value, TypeValidator.nickname)),
                              textInputAction: TextInputAction.next,
                              controller:
                                  controllerUpdateProfile.nicknameCtrl.value,
                            ),
                            InputTextFormCostum(
                              labletext: "Nomor Induk Kependudukan (NIK)",
                              hintText: "Nomor Induk Kependudukan (NIK)",
                              typeInput: TextInputType.number,
                              iconText: const Icon(Icons.contacts),
                              validator: ((value) => controllerUpdateProfile
                                  .checkValidator(value, TypeValidator.nik)),
                              textInputAction: TextInputAction.next,
                              controller: controllerUpdateProfile.nikCtrl.value,
                            ),
                            InputTextFormCostum(
                              labletext: "Nomor Kartu Keluarga (KK)",
                              hintText: "Nomor Kartu Keluarga (KK)",
                              typeInput: TextInputType.number,
                              iconText: const Icon(Icons.call_to_action),
                              validator: ((value) => controllerUpdateProfile
                                  .checkValidator(value, TypeValidator.kk)),
                              textInputAction: TextInputAction.next,
                              controller: controllerUpdateProfile.kkCtrl.value,
                            ),
                            InputTextFormCostum(
                              labletext: "Tempat Lahir",
                              hintText: "Tempat lahir",
                              typeInput: TextInputType.text,
                              iconText: const Icon(Icons.pin_drop),
                              validator: ((value) => controllerUpdateProfile
                                  .checkValidator(value, TypeValidator.place)),
                              textInputAction: TextInputAction.next,
                              controller:
                                  controllerUpdateProfile.tempatLahirCtrl.value,
                            ),
                            SelectDateCostum(
                                labletext: "Tanggal Lahir",
                                hintText: "dd/mm/yyyy",
                                iconText: const Icon(Icons.date_range),
                                validator: ((value) =>
                                    controllerUpdateProfile.checkValidator(
                                        value, TypeValidator.dateOfBirth)),
                                controller: controllerUpdateProfile
                                    .dateOfBirthCtrl.value),
                            InputTextFormCostum(
                              labletext: "Nomor Handphone",
                              hintText: "Nomor Handphone",
                              typeInput: TextInputType.number,
                              iconText: const Icon(Icons.phone_android),
                              validator: ((value) => controllerUpdateProfile
                                  .checkValidator(value, TypeValidator.phone)),
                              textInputAction: TextInputAction.next,
                              controller:
                                  controllerUpdateProfile.phoneCtrl.value,
                            ),
                            UploadPhoto(
                              labletext: "Upload Photo",
                              hintText: "Upload Photo (3x4)",
                              iconText: const Icon(Icons.upload),
                              validator: ((value) => controllerUpdateProfile
                                  .checkValidator(value, TypeValidator.photo)),
                              controller:
                                  controllerUpdateProfile.photoCtrl.value,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            width: Get.width * 0.9,
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
    );
  }
}
