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
      this.onTap,
      this.border,
      this.focusBorder,
      this.iconTextRight,
      this.onPresIconRight,
      this.obscureText});

  final String? hintText;
  final String? labletext;
  final Icon? iconText;
  final Icon? iconTextRight;
  final TextInputType? typeInput;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool? disabled;
  final String? Function(String?)? validator;
  final String? Function(String?)? onsavecus;
  final String? Function(String?)? onChanged;
  final Function()? onTap;
  final Function()? onPresIconRight;
  final bool? border;
  final bool? focusBorder;
  final bool? obscureText;

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
        obscureText: obscureText ?? false,
        onTap: onTap,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: typeInput,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labletext,
            labelStyle: const TextStyle(color: Colors.grey),
            suffixIcon: iconTextRight != null
                ? IconButton(icon: iconTextRight!, onPressed: onPresIconRight)
                : null,
            prefixIcon: IconTheme(
                data: const IconThemeData(color: Color(0xFFFF8226)),
                child: iconText ?? const Icon(null)),
            enabledBorder: border == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFFF8226),
                    ),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.0),
              borderSide: const BorderSide(
                color: Color(0xFFFF8226),
              ),
            )),
      ),
    );
  }
}
