import 'package:flutter/material.dart';

class InputTextFormCostum extends StatelessWidget {
  const InputTextFormCostum(
      {super.key,
      this.hintText,
      this.labletext,
      this.iconText,
      this.typeInput,
      this.controller,
      this.textInputAction,
      this.disabled,
      this.validator,
      this.onsavecus,
      this.onChanged,
      this.onTap});

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
          hintText: hintText ?? "Default",
          labelText: labletext ?? "Default",
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
