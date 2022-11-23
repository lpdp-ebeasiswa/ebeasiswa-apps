import 'dart:io';

import 'package:ebeasiswa/gen/assets.gen.dart';
import 'package:ebeasiswa/presentation/update_profile/update_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

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
      body: Container(
        // width: Get.width,
        padding: const EdgeInsets.all(10),
        child: const FormUpdateProfile(),
      ),
    );
  }
}

class FormUpdateProfile extends StatefulWidget {
  const FormUpdateProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<FormUpdateProfile> createState() => _FormUpdateProfileState();
}

class _FormUpdateProfileState extends State<FormUpdateProfile> {
  final _formKey = GlobalKey<FormState>();

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.red,
                                child: image != null
                                    ? SizedBox(
                                        height: 200,
                                        width: 150,
                                        child: Image.file(
                                          image!,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      )
                                    : SizedBox(
                                        height: 140,
                                        width: 140,
                                        child: Assets.image.lpdpNoImage.image(
                                            height: 100.0,
                                            width: 100.0,
                                            fit: BoxFit.fitWidth),
                                      ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      getImage();
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                    child: Icon(
                                      Icons.photo_camera,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Photo",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
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
                              iconText:
                                  const Icon(Icons.location_history_rounded),
                              validator: ((value) => controllerUpdateProfile
                                  .checkValidator(value, TypeValidator.place)),
                              textInputAction: TextInputAction.next,
                              controller:
                                  controllerUpdateProfile.tempatLahirCtrl.value,
                            ),
                            SelectDateCostum(
                                labletext: "Tanggal Lahir",
                                hintText: "dd/mm/yyyy",
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
      this.hintText,
      this.labletext,
      this.controller,
      this.validator});

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
      iconText: const Icon(Icons.date_range),
      textInputAction: TextInputAction.next,
      controller: widget.controller!,
      disabled: true,
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
                      onDateTimeChanged: (value) {
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
                        setState(() {
                          widget.controller?.text = formattedDate;
                          Get.back();
                        });
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
