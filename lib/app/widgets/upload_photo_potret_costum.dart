import 'dart:io';

import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import 'input_text_form_costum.dart';

class UploadPhotoPotret extends StatefulWidget {
  const UploadPhotoPotret(
      {super.key,
      this.hintText,
      this.labletext,
      this.iconText,
      this.controller,
      this.validator,
      this.onTap,
      this.image,
      this.disabledTextInput,
      this.height,
      this.width,
      this.borderRadius});

  final String? hintText;
  final String? labletext;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Icon? iconText;
  final bool? disabledTextInput;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final File? image;

  @override
  State<UploadPhotoPotret> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhotoPotret> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Column(
          children: [
            widget.disabledTextInput != true
                ? InputTextFormCostum(
                    controller: widget.controller,
                    labletext: widget.hintText,
                    hintText: widget.labletext,
                    iconText: widget.iconText,
                    disabled: true,
                    validator: widget.validator,
                    border: true,
                    onTap: widget.onTap,
                  )
                : Container(),
            const SizedBox(width: 5),
            SizedBox(
              height: widget.height ?? 180,
              width: widget.width ?? 140,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10.0),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.red,
                      child: widget.image != null
                          ? SizedBox(
                              height: widget.height ?? 180,
                              width: widget.width ?? 140,
                              child: Image.file(
                                widget.image!,
                                fit: BoxFit.fitWidth,
                              ),
                            )
                          : SizedBox(
                              height: widget.height ?? 180,
                              width: widget.width ?? 140,
                              child: Assets.image.lpdpNoImage.image(
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.fitWidth),
                            ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: widget.onTap,
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
      ),
    );
  }
}
