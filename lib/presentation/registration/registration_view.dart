import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFFFF8226),
      //   title: const Text("Registration"),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: Container(
        color: const Color(0xFFD45820),
        child: Column(
          children: [
            Assets.image.lpdpRegistration.image(fit: BoxFit.fitWidth),
            Expanded(
              child: Container(
                height: 20,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80)), //here
                  color: Colors.white,
                ),
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: const [
                    InputTextForm(
                      labletext: "Email",
                      hintText: "Email",
                      typeInput: TextInputType.emailAddress,
                      iconText: Icon(Icons.email_rounded),
                      disabled: false,
                    ),
                    InputTextForm(
                      labletext: "Kata Sandi",
                      hintText: "Kata Sandi",
                      typeInput: TextInputType.visiblePassword,
                      iconText: Icon(Icons.lock),
                      disabled: false,
                    ),
                    InputTextForm(
                      hintText: "Nama Lengkap",
                      labletext: "Nama Lengkap",
                      typeInput: TextInputType.text,
                      iconText: Icon(Icons.person),
                      disabled: false,
                    ),
                    InputTextForm(
                      hintText: "Nama Panggilan",
                      labletext: "Nama Panggilan",
                      typeInput: TextInputType.text,
                      iconText: Icon(Icons.person_pin),
                      disabled: false,
                    ),
                    InputTextForm(
                      labletext: "Nomor Induk Kependudukan (NIK)",
                      hintText: "Nomor Induk Kependudukan (NIK)",
                      typeInput: TextInputType.number,
                      iconText: Icon(Icons.contacts),
                      disabled: false,
                    ),
                    InputTextForm(
                      labletext: "Nomor Kartu Keluarga (KK)",
                      hintText: "Nomor Kartu Keluarga (KK)",
                      typeInput: TextInputType.number,
                      iconText: Icon(Icons.call_to_action),
                      disabled: false,
                    ),
                    InputTextForm(
                      labletext: "Tempat Lahir",
                      hintText: "Tempat lahir",
                      typeInput: TextInputType.text,
                      iconText: Icon(Icons.location_history_rounded),
                      disabled: false,
                    ),
                    InputTextForm(
                      labletext: "Tanggal Lahir",
                      hintText: "Tanggal Lahir",
                      typeInput: TextInputType.datetime,
                      iconText: Icon(Icons.date_range),
                      disabled: false,
                    ),
                    InputTextForm(
                      labletext: "Nomor Handphone",
                      hintText: "Nomor Handphone",
                      typeInput: TextInputType.number,
                      iconText: Icon(Icons.date_range),
                      disabled: false,
                    ),
                    UploadPhoto(),
                  ],
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
                      onPressed: () {},
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

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: InputTextForm(
            labletext: "Upload Photo ( 3 X 4 )",
            hintText: "File harus diupload",
            typeInput: TextInputType.datetime,
            iconText: Icon(Icons.upload),
            disabled: true,
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.upload_rounded,
            color: Colors.white,
            size: 24.0,
          ),
          label: const Text('Pilih File', style: TextStyle(fontSize: 16.0)),
          onPressed: () {
            // selectFile();
            // https://sobatcoding.com/articles/flutter-upload-file-menggunakan-file-picker
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF8226),
            minimumSize: const Size(122, 48),
            maximumSize: const Size(122, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}

class InputTextForm extends StatelessWidget {
  const InputTextForm({
    Key? key,
    required this.hintText,
    required this.labletext,
    required this.iconText,
    required this.typeInput,
    required this.disabled,
  }) : super(key: key);

  final String hintText;
  final String labletext;
  final Icon iconText;
  final TextInputType typeInput;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        readOnly: disabled,
        keyboardType: typeInput,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labletext,
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: IconTheme(
              data: const IconThemeData(color: Color(0xFFFF8226)),
              child: iconText),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: const BorderSide(
              color: Color(0xFFFF8226),
            ),
          ),
        ),
      ),
    );
  }
}
