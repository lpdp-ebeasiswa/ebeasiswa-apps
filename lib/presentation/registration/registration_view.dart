import 'dart:io';

import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/presentation/registration/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

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
                  vertical: 10,
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
                                    iconText: const Icon(
                                        Icons.location_history_rounded),
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
                                  const UploadPhoto(),
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

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? image;
  TextEditingController controllerFilename = TextEditingController();

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    String? fileName = image!.path.split('/').last;
    String? fileExtension = fileName.split('.').last;

    final bytes = image!.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final ukuranPhoto = kb / 1024;

    if (fileExtension == 'png' ||
        fileExtension == 'PNG' ||
        fileExtension == 'MIME' ||
        fileExtension == 'mime') {
      if (ukuranPhoto <= 1.01) {
        setState(() {
          image = File(imagePicked.path);
          controllerFilename.text = fileName;
        });
      } else {
        setState(() {
          controllerFilename.text = 'Ukuran photo belum sesuai';
          image = null;
          Get.snackbar('Gagal Upload', 'Ukuran photo belum sesuai',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent);
        });
      }
    } else {
      setState(() {
        image = null;
        controllerFilename.text = 'Jenis photo belum sesuai';
        Get.snackbar('Gagal Upload', 'Jenis photo belum sesuai',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent);
      });
    }
  }

  String? chekPhoto(String? text) {
    if (text == null || text.isEmpty) {
      return 'Photo tidak boleh kosong';
    }
    if (text == "Jenis photo belum sesuai") {
      return 'Jenis photo yang di upload bukan jenis png \natau mime';
    }
    if (text == "Ukuran photo belum sesuai") {
      return 'Ukuran photo harus kurang dari 1 MB';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InputTextFormCostum(
                controller: controllerFilename,
                labletext: "Upload Photo ( 3 X 4 )",
                hintText: "File harus diupload",
                typeInput: TextInputType.datetime,
                iconText: const Icon(Icons.upload),
                disabled: true,
                validator: chekPhoto,
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
                setState(() {
                  getImage();
                });
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
        ),
        image != null
            ? SizedBox(
                height: 200,
                width: 150,
                child: Image.file(
                  image!,
                  fit: BoxFit.cover,
                ))
            : SizedBox(
                height: 140,
                width: 140,
                child: Assets.image.lpdpNoImage
                    .image(height: 100.0, width: 100.0)),
      ],
    );
  }
}

class InputTextFormCostum extends StatelessWidget {
  const InputTextFormCostum({
    Key? key,
    this.hintText,
    this.labletext,
    this.iconText,
    this.typeInput,
    this.disabled,
    this.validator,
    this.onsavecus,
    this.onChanged,
    this.controller,
    this.onTap,
    this.textInputAction,
  }) : super(key: key);

  final String? hintText;
  final String? labletext;
  final Icon? iconText;
  final TextInputType? typeInput;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool? disabled;
  final String? Function(String?)? validator;
  final String? Function(String?)? onsavecus;
  final String? Function(String?)? onChanged;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        validator: validator,
        readOnly: disabled ?? false,
        onSaved: onsavecus,
        onChanged: onChanged,
        onTap: onTap,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: typeInput,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labletext,
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: IconTheme(
              data: const IconThemeData(color: Color(0xFFFF8226)),
              child: iconText!),
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

class SelectDateCostum extends StatefulWidget {
  const SelectDateCostum(
      {super.key,
      this.controller,
      this.validator,
      this.hintText,
      this.labletext});

  final String? hintText;
  final String? labletext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<SelectDateCostum> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDateCostum> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return InputTextFormCostum(
      hintText: widget.hintText,
      labletext: widget.labletext,
      typeInput: TextInputType.number,
      iconText: const Icon(Icons.phone_android),
      textInputAction: TextInputAction.next,
      controller: widget.controller!,
      disabled: true,
      // validator: cekTanggalLahir,
      validator: widget.validator,
      onTap: () {
        showModalBottomSheet(
          enableDrag: false,
          context: context,
          builder: (context) {
            return SizedBox(
              height: 300,
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: Get.width,
                    child: ScrollDatePicker(
                      options: const DatePickerOptions(itemExtent: 40),
                      scrollViewOptions: const DatePickerScrollViewOptions(
                        day: ScrollViewDetailOptions(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(right: 30)),
                        month: ScrollViewDetailOptions(
                            alignment: Alignment.center),
                        year: ScrollViewDetailOptions(
                            margin: EdgeInsets.only(left: 30)),
                      ),
                      selectedDate: _selectedDate,
                      locale: const Locale('id'),
                      onDateTimeChanged: (DateTime value) {
                        setState(() {
                          _selectedDate = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF8226),
                      ),
                      onPressed: () {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(_selectedDate);
                        widget.controller?.text = formattedDate;
                        Get.back();
                      },
                      child: const Text("Ok"),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
