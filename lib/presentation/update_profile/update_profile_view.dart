import 'dart:io';

import 'package:ebeasiswa/gen/assets.gen.dart';
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
        title: const Text("Profile Detail"),
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

String? checkEmail(String? text) {
  RegExp regEx = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (text == null || text.isEmpty) {
    return 'Email tidak boleh kosong';
  }
  if (!regEx.hasMatch(text)) {
    return 'Harus Berbenruk Email yaa';
  }
  return null;
}

String? checkKataSandi(String? text) {
  RegExp regEx =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  if (text == null || text.isEmpty) {
    return 'Kata sandi tidak boleh kosong';
  }
  if (!regEx.hasMatch(text)) {
    return 'Kata sandi harus mempunyai 1 huruf besar dan kecil \nminimal 8 huruf dan 1 spesial karakter! ';
  }
  return null;
}

String? checkFullName(String? text) {
  RegExp regEx = RegExp(r'^\s*[A-Za-z]{3}[^\n\d?=.*?[!@#\"%^()-_+{}|/<$&*~]*$');

  if (text == null || text.isEmpty) {
    return 'Nama lengkap tidak boleh kosong';
  }
  if (!regEx.hasMatch(text)) {
    return 'Nama lengkap minimal 3 huruf dan tidak boleh ada karakter';
  }
  return null;
}

String? checkName(String? text) {
  RegExp regEx = RegExp(r'^\s*[A-Za-z]{3}[^\n\d?=.*?[!@#\"%^()-_+{}|/<$&*~]*$');

  if (text == null || text.isEmpty) {
    return 'Nama panggilan tidak boleh kosong';
  }
  if (!regEx.hasMatch(text)) {
    return 'Nama panggilan minimal 3 huruf dan tidak boleh ada karakter';
  }
  return null;
}

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

String? checkKk(String? text) {
  RegExp regEx = RegExp(
      r'^(1[1-9]|21|[37][1-6]|5[1-3]|6[1-5]|[89][12])\d{2}\d{2}([04][1-9]|[1256][0-9]|[37][01])(0[1-9]|1[0-2])\d{2}\d{4}$');

  if (text == null || text.isEmpty) {
    return 'KK tidak boleh kosong';
  }
  if (!regEx.hasMatch(text)) {
    return 'KK tidak Valid';
  }
  return null;
}

String? checkTempat(String? text) {
  RegExp regEx = RegExp(r'^\s*[A-Za-z]{3}[^\n\d?=.*?[!@#\"%^()-_+{}|/<$&*~]*$');

  if (text == null || text.isEmpty) {
    return 'Alamat tidak boleh kosong';
  }
  if (!regEx.hasMatch(text)) {
    return 'Alamat minimal 3 huruf dan tidak boleh ada karakter';
  }
  return null;
}

String? checkNoHandphone(String? text) {
  RegExp regEx =
      RegExp(r'^(\+62|62)?[\s-]?0?8[1-9]{1}\d{1}[\s-]?\d{4}[\s-]?\d{2,5}$');

  if (text == null || text.isEmpty) {
    return 'Nomor HP tidak boleh kosong';
  }
  if (!regEx.hasMatch(text)) {
    return 'Nomor hp tidak valid';
  }
  return null;
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
                    const InputTextFormCostum(
                      labletext: "Email",
                      hintText: "Email",
                      typeInput: TextInputType.emailAddress,
                      iconText: Icon(Icons.email_rounded),
                      validator: checkEmail,
                      textInputAction: TextInputAction.next,
                    ),
                    const InputTextFormCostum(
                      labletext: "Kata Sandi",
                      hintText: "Kata Sandi",
                      typeInput: TextInputType.visiblePassword,
                      iconText: Icon(Icons.lock),
                      validator: checkKataSandi,
                      textInputAction: TextInputAction.next,
                    ),
                    const InputTextFormCostum(
                      hintText: "Nama Lengkap",
                      labletext: "Nama Lengkap",
                      typeInput: TextInputType.text,
                      iconText: Icon(Icons.person),
                      validator: checkFullName,
                      textInputAction: TextInputAction.next,
                    ),
                    const InputTextFormCostum(
                      hintText: "Nama Panggilan",
                      labletext: "Nama Panggilan",
                      typeInput: TextInputType.text,
                      iconText: Icon(Icons.person_pin),
                      validator: checkName,
                      textInputAction: TextInputAction.next,
                    ),
                    const InputTextFormCostum(
                      labletext: "Nomor Induk Kependudukan (NIK)",
                      hintText: "Nomor Induk Kependudukan (NIK)",
                      typeInput: TextInputType.number,
                      iconText: Icon(Icons.contacts),
                      validator: checkNik,
                      textInputAction: TextInputAction.next,
                    ),
                    const InputTextFormCostum(
                      labletext: "Nomor Kartu Keluarga (KK)",
                      hintText: "Nomor Kartu Keluarga (KK)",
                      typeInput: TextInputType.number,
                      iconText: Icon(Icons.call_to_action),
                      validator: checkKk,
                      textInputAction: TextInputAction.next,
                    ),
                    const InputTextFormCostum(
                      labletext: "Tempat Lahir",
                      hintText: "Tempat lahir",
                      typeInput: TextInputType.text,
                      iconText: Icon(Icons.location_history_rounded),
                      validator: checkTempat,
                      textInputAction: TextInputAction.next,
                    ),
                    const SelectDateCostum(),
                    const InputTextFormCostum(
                      labletext: "Nomor Handphone",
                      hintText: "Nomor Handphone",
                      typeInput: TextInputType.number,
                      iconText: Icon(Icons.phone_android),
                      validator: checkNoHandphone,
                      textInputAction: TextInputAction.next,
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
  const SelectDateCostum({super.key});

  @override
  State<SelectDateCostum> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDateCostum> {
  DateTime _selectedDate = DateTime.now();

  final TextEditingController _controller = TextEditingController();

  String? cekTanggalLahir(String? text) {
    if (text == null || text.isEmpty) {
      return 'Tanggal Lahir tidak boleh kosong';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InputTextFormCostum(
      labletext: "Tanggal Lahir",
      hintText: "Tanggal Lahir",
      typeInput: TextInputType.number,
      iconText: const Icon(Icons.date_range),
      textInputAction: TextInputAction.next,
      controller: _controller,
      disabled: true,
      validator: cekTanggalLahir,
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
                          _controller.text = formattedDate;
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
