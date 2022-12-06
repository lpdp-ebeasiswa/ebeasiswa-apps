import 'package:flutter/material.dart';

class InputTextAktivasi extends StatelessWidget {
  const InputTextAktivasi({
    Key? key,
    this.controller,
    this.textInputAction,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      width: 70,
      child: TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        autofocus: true,
        keyboardType: TextInputType.number,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          hintText: "-",
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
