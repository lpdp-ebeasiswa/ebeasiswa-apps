import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../gen/assets.gen.dart';
import 'input_text_form_costum.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto(
      {super.key,
      this.hintText,
      this.labletext,
      this.iconText,
      this.disabled,
      this.controller,
      this.validator,
      this.onTap});

  final String? hintText;
  final String? labletext;
  final Icon? iconText;
  final bool? disabled;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? image;

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
          widget.controller?.text = fileName;
        });
      } else {
        setState(() {
          widget.controller?.text = 'Ukuran photo belum sesuai';
          image = null;
          Get.snackbar('Gagal Upload', 'Ukuran photo belum sesuai',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent);
        });
      }
    } else {
      setState(() {
        image = null;
        widget.controller?.text = 'Jenis photo belum sesuai';
        Get.snackbar('Gagal Upload', 'Jenis photo belum sesuai',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InputTextFormCostum(
              controller: widget.controller,
              labletext: widget.hintText,
              hintText: widget.labletext,
              iconText: widget.iconText,
              disabled: true,
              validator: widget.validator,
              onTap: () {
                setState(() {
                  getImage();
                });
              },
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            height: 100,
            width: 100,
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
                        padding: const EdgeInsets.symmetric(vertical: 5),
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
        ],
      ),
    );
  }
}
